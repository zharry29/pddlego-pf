import torch
import torch.nn as nn

class AttentionLSTM(nn.Module):
    def __init__(self, input_size, hidden_size, output_size):
        super(AttentionLSTM, self).__init__()
        self.hidden_size = hidden_size
        self.lstm = nn.LSTM(input_size, hidden_size, batch_first=True)
        self.attention = nn.Linear(hidden_size, hidden_size)
        self.out = nn.Linear(hidden_size, output_size)
        
    def forward(self, input):
        # LSTM编码
        output, (hidden, cell) = self.lstm(input)
        
        # 使用LSTM隐藏状态作为查询Q
        query = hidden[-1]  # 使用最后一个时间步的隐藏状态作为查询
        
        # 计算注意力权重，注意力权重的计算方式可根据具体需求调整
        attn_weights = torch.softmax(torch.matmul(output, query.unsqueeze(2)), dim=1)
        
        # 计算注意力向量
        attn_vectors = torch.sum(attn_weights * output, dim=1)
        
        # 将注意力向量通过线性层得到最终输出
        output = torch.relu(attn_vectors)
        output = self.out(output)
        
        return output

# 构造数据
inputs = [torch.randn(3, 5) for _ in range(10)]
labels = [torch.randint(0, 2, (3,)) for _ in range(10)]

# 构造数据加载器
train_dataset = torch.utils.data.TensorDataset(torch.stack(inputs), torch.stack(labels))
train_loader = torch.utils.data.DataLoader(train_dataset, batch_size=2)

# 创建模型
model = AttentionLSTM(input_size=5, hidden_size=10, output_size=2)

# 定义损失函数和优化器
criterion = nn.CrossEntropyLoss()
optimizer = torch.optim.Adam(model.parameters(), lr=0.001)

# 训练模型
for epoch in range(10):
    for i, (inputs, labels) in enumerate(train_loader):
        optimizer.zero_grad()
        outputs = model(inputs)
        loss = criterion(outputs, labels)
        loss.backward()
        optimizer.step()

        if i % 2 == 0:
            print('Epoch [{}/{}], Step [{}/{}], Loss: {:.4f}'
                  .format(epoch+1, 10, i+1, len(train_loader), loss.item()))

# 在测试集上进行评估
test_inputs = [torch.randn(3, 5) for _ in range(5)]
test_labels = [torch.randint(0, 2, (3,)) for _ in range(5)]
test_dataset = torch.utils.data.TensorDataset(torch.stack(test_inputs), torch.stack(test_labels))
test_loader = torch.utils.data.DataLoader(test_dataset, batch_size=2)

total = 0
correct = 0
with torch.no_grad():
    for inputs, labels in test_loader:
        outputs = model(inputs)
        _, predicted = torch.max(outputs.data, 1)
        total += labels.size(0)
        correct += (predicted == labels).sum().item()

print('Accuracy of the model on the test set: {:.2f}%'.format(100 * correct / total))