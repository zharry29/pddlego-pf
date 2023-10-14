# multi-head self-attention
class SelfAttention(nn.Module):
    # 这里我们用h个heads，每个都有自己的q，k，v；然后embedding vector维度是k
    def __init__(self, k, h = 8):
        super().__init__()
        self.k, self.h = k, h
        # weights of q, k, v, tranform from (b, t, k) to (b, t, k*h)
        # 把所有keys，queries，values绑成一个matrix方便计算
        self.get_query = nn.Linear(k, k*h, bias=False)
        self.get_key   = nn.Linear(k, k*h, bias=False)
        self.get_value = nn.Linear(k, k*h, bias=False)
        # combine multiheads into one，合并multiheads
        self.unified   = nn.Linear(k*h, k, bias=False)
    def forward(self, x):
      	# input shape (b, t, k), b=batch size, t=sequence length, k=embedding dimension
        b, t, k = x.size()
        # shape (b, t, k) -> (b, t, k, h)
        query = self.get_query(x).view(b, t, k, self.h)
        key   = self.get_key(x).  view(b, t, k, self.h)
        value = self.get_value(x).view(b, t, k, self.h)
        # in order to apply bmm, we need shape (b * h, t, k) and (b * h, k, t)
        # bmm只能保留第0维度，所以我们给key，query，value变形，使得batch size和h都可以保留
#         print(query)
#         print(query.transpose(1, 2))
#         print(torch.reshape(query, (b, k, t, self.h)))
        query = torch.reshape(query.transpose(1, 2), (b * self.h, t, k))
        key   = torch.reshape(key.transpose(1, 2),   (b * self.h, k, t))
        value = torch.reshape(value.transpose(1, 2), (b * self.h, t, k))
#         print(query.shape)
#         print(key.shape)
        # scale down
        query = query / (k ** (1/4))
        key   = key   / (k ** (1/4))
        # calc attention
        # out shape (b * h, t, t)
        raw_weights = torch.bmm(query, key)
        weights = F.softmax(raw_weights, dim=2)
        # (b*h, t, t) * (b*h, t, k) = (b*h, t, k), reshape back to (b, t, k*h)
        attentionA = torch.reshape(torch.bmm(weights, value).transpose(1, 2), (b, t, self.h*k))
        #下边这句效果相同
#         attentionB = torch.bmm(weights, value).transpose(1, 2).contiguous().view(b, t, self.h * k)
        # combine multiheads, shape (b, t, k*h) to (b, t, k)
        out = self.unified(attentionA)
        return out
# test
x = torch.rand((1, 3, 2))
test = SelfAttention(2, 4)
test(x)