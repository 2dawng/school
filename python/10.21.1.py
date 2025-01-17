from queue import Queue
def BFS():
    n,m, k=map(int,input().split())
    Q=Queue()
    Q.put((0,0))
    D={(0,0):0}
    while Q.qsize():
        x,y=Q.get()
        z=x+y
        for u,v in set