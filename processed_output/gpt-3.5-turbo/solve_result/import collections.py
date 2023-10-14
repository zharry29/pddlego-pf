import collections
n=int(input()[0])
edge = input().split(",")
graph = {}
degree = [0]*n
for i in range(n):
    graph[i] = []

for i in range(len(edge)):
    ed = edge[i].split(":")
    graph[int(ed[1])].append(int(ed[0]))
    degree[int(ed[0])]+=1
q = collections.deque([u for u in range(n) if degree[u]==0])
visited = 0
while q:
    visited+=1
    u = q.popleft()
    for v in graph[u]:
        degree[v]-=1
        if degree[v]==0:
            q.append(v)

if visited != n:
    print(0)
else:
    print(1)
    