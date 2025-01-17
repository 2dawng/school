'''
import math

#CNTT3 K63
#the tich hinh cau
#import math
#R=float(input())
# V=4/3*math.pi*R**3
# print("VOLUME = %.3f"%V)

#V=4/3*math.pi*R**3
#print("VOLUME = %.3f"%(4/3*3.14159263*float(input())**3))

#dien tich HBH
a,b=map(float,input().split())
alpha = int(input())
S=a*b*math.sin(alpha*math.pi/180)
print("%.3f"%S)


#phuong trinh equation ax+b=0

a,b=map(float,input().split())
# if a==0:
#     if b==0: print("vo so nghiem")
#     else: print("vo nghiem")
# else: print("x = %0.3f"%(-b/a))

if a==b==0 : print("vo so nghiem")
elif a==0: print("vo nghiem")
else: print("x = %0.3f"%(-b/a))

#cach khac
if a==0: print("vo so nghiem" if b==0 else "vo nghiem")
else:  print("x = %0.3f"%(-b/a))

#SO O GIUA
a,b,c=map(int,input().split())
if (a-b)*(a-c)<0 :print(a)
elif (b-c)*(b-a)<0 :print(b)
elif (c-a)*(c-b)<0 :print(c)
else: print("KHONG CO SO O GIUA")

#cach khac
a,b,c=map(int,input().split())
x,z=max(a,b,c),min(a,b,c)
y=a+b+c-x-z
if y==x or y ==z : print("KHONG CO SO O GIUA")
else: print(y)


#ham range

X=list(range(1,10,1))   #begin,end,step
print(X)
Y=list(range(10,20))    #mac dinh step=1
print(Y)
Z=list(range(13))      #mac dinh begin=0
print(Z)
A=list(range(10,3,-2))
print(A)

#tinh n giai thua
n=int(input())
s=1
for i in range(2,n+1): s*=i
print(s)

#so fibonacci lon
n=int(input())
a,b=1,1       #a=F0          b=F1
for i in range(2,n): a,b=b,a+b
print(b)

X=[4,7,2,8,4,8,3,2]    #list    -> bien   -> thay doi duoc
Y=(3,7,2,1,3,6,1,8)     #tuple  -> hang   -> khong doi
Z=set(X)
T=set(Y)
print(X,Y,Z,T)
X[0]=0  #ok
Y[1]=2  #khong duoc


#nha soan nhac tai ba
a=list(map(int,input().split()))   #nhap day
t,g=0,0
for i in range(7):  #0 -> 6
    if a[i]<a[i+1]: t+=1
    if a[i]>a[i+1]: g+=1
if t==7: print("TANG")
elif g==7: print("GIAM")
else: print("KHONGBIET")

#ghep hinh
a,b=map(int,input().split())
c,d=map(int,input().split())
if a<b: a,b=b,a
if c<d: c,d=d,c
print("Yes" if a==c==b+d else "No")

#Tích của dãy cấp số cộng
n,k=map(int,input().split())
s=1
for i in range(n,0,-k): s*=i
print(s)

# dem tren day so
def cp(x):
    if x<0: return False
    return int(x**0.5)**2==x

if __name__ == '__main__':
    n=int(input())
    a=list(map(int,input().split()))
    print(len([x for x in a if x%3!=0]))
    print(len([x for x in a if cp(x)]))
    print(len([1 for x,y in zip(a,a[1:]) if x!=0 and y%x==0]))
    dc=len([x for x in a if x%2==0])
    dl=n-dc
    print(dc*(dc-1)//2+dl*(dl-1)//2)
    print(len([1 for x,y,z in zip(a,a[1:],a[2:]) if x<y<z]))

#kiem tra cap so cong
n=int(input())
a=list(map(int,input().split()))
b=[x-y for y,x in zip(a,a[1:])]
s=set(b)
if len(s)==1: print("Day la day cap so cong voi cong sai",b[0])
else: print("Day khong la day cap so cong")


#set
x=[4,7,2,8,4,8,3,2]
y=set(x)
print(*y)

#rut gon tap hop so nguyen
n=int(input())
a=list(map(int,input().split()))
s=set()
for x in a:
    if x not in s:
        print(x,end = " ")
        s.add(x)

#phep giao hai tap hop
input()
a=set(map(int,input().split()))
input()
b=set(map(int,input().split()))
c=a.intersection(b)
d=list(c)
d.sort()
print(*d)

#string

x=str(3.14159)
print(x)

x="hom nay mua to qua"
print(x.center(60))  #can giua
print(x.rjust(60))   #can phai

#tam giac sao
n=int(input())
for i in range(1,n+1): print('*'*i)

#ve mui ten
n=int(input())
for i in range(n,0,-1):
    x=i*'*'
    print(x.rjust(2*n-i))
for i in range(2,n+1):
    x=i*'*'
    print(x.rjust(2*n-i))

#dao mang ky tu
input()
print(input()[::-1])

#dao tu
x=input().split()[::-1]
print(*x)


# D={4:7,'a':6,8:[5,8],(2,3):"ha noi"}
# print(D.keys())
# print(D.values())
# print(D.items())


a=[int(x) for x in input().split()]
D={}
for x in a: D[x]=D.get(x,0)+1
    # if x in D.keys(): D[x]+=1
    # else: D[x]=1
for x in sorted(D.keys()):
    print(x,D[x])

import collections

# x="L32"
# print(x[0])
# t=int(x[1:])
# print(t)
#
# from collections import Counter
# a=[4,7,2,8,4,8,3,2]
# D=Counter(a)
# print(D)

#dem giay
# L,R={},{}
# for i in range(int(input())):
#     s=input()
#     x=int(s[1:])
#     if s[0]=='L': L[x]=L.get(x,0)+1
#     else: R[x]=R.get(x,0)+1
# print(sum(min(L.get(i,0),R.get(i,0)) for i in range(101)))

#phan tu ap dao
import collections
n=int(input())//2
D=collections.Counter(map(int,input().split()))
for k,v in D.items():
    if v>n:
        print(k)
        break
else: print("khong co phan tu ap dao")

#thong ke tan suat
import collections
n=int(input())
D=collections.Counter(map(int,input().split()))
for x in sorted(D.keys()): print(x,D[x])



#truy van tan suat chuoi
D={}
for i in range(int(input())):
    x=input()
    D[x]=D.get(x,0)+1
for i in range(int(input())): print(D.get(input(),0))


#cot dien bang nhau
import collections
input()
D=collections.Counter(map(int,input().split()))
print(sum((v*(v-1) for v in D.values()))//2)

# s=0
# for v in D.values(): s+=v*(v-1)//2
# print(s)


# from collections import namedtuple
# sv=namedtuple("sinhvien","ten,tuoi,diem")
# A=sv("tran anh",15,3.5)
# print(A)
# print(A.ten)
# print(A.tuoi)
# print(A.diem)


# x="tran van hung dung 15 9.5"
# a,b,c=x.rsplit(' ',2)
# print(a)
# print(b)
# print(c)
# *a,b,c=x.split()
# ten=" ".join(a)
# print(ten)
# print(b)
# print(c)

#trao giai chung ket marathon
from collections import namedtuple
sv=namedtuple("sv","ten diem")
D=[]
K=[]
for i in range(int(input())):
    ten,diem,khoa=input().rsplit(' ',2)
    if khoa=="DDT": D.append(sv(ten,int(diem)))
    else: K.append(sv(ten,int(diem)))
D.sort(key=lambda x:x.diem,reverse=True)  #sx giam theo diem
print("Giai nhat :%s"%(D[0].ten))
print("Giai nhi :%s"%(D[1].ten))
print("Giai ba :%s"%(D[2].ten))
s=max(K,key=lambda x:x.diem)
print("Giai giao luu :%s"%(s.ten))

#tinh diem thi lap trinh
from collections import namedtuple
n=int(input())
sv=namedtuple("sv",input()+" TD")
D=[]
for i in range(n):
    x=input()+" 0"
    s=sv._make(x.split())
    s=s._replace(TD=int(s.A)+int(s.B)*2+int(s.C)*3+int(s.D)*4+int(s.E)*5)
    D.append(s)
D.sort(key=lambda x:x.TEN)
for s in D: print(s.TEN,s.TD)

import queue

# from queue import LifoQueue            #stack
# S=LifoQueue()                       #rong
# for x in [4,7,2,8]: S.put(x)
# print(S.queue)
# print(S.queue[0])
# print(S.queue[-1])                 #top
# y=S.get()                          #y=8            S.queue = [4,7,2]
# print(y)
# print(S.queue)

# doi sang co so 2
import queue
HEXA="0123456789ABCDEFGHIJKL"
def cs3():
    n=int(input())
    S=queue.LifoQueue()
    while n:
        S.put(HEXA[n%16])
        n//=16
    print(*S.queue[::-1],sep="")

if __name__ == '__main__':
    #for i in range(int(input())):
    cs3()


# khoi luong hoa chat
K={'C':12,'H':1,'O':16,'(':0}
import queue
def sol():
    S=queue.LifoQueue()
    for c in input():
        if c in K.keys(): S.put(K[c])
        elif '0'<=c<='9': S.queue[-1]*=int(c)
        else:
            t=0
            while S.queue[-1]>0: t+=S.get()
            S.queue[-1]=t
    print(sum(S.queue))
if __name__ == '__main__':
    for i in range(int(input())): sol()

#hau to ba lan
import queue
ut={'(':0,'+':1,'-':1,'*':2,'/':2,'%':2}
S=queue.LifoQueue()
out=''
x=input()
for c in x:
    if c=='(': S.put(c)
    elif c==')':
        while(S.queue[-1]!='(') : out+=S.get()
        S.get()
    elif '0'<=c<='9' : out+=c
    else:
        while S.qsize()>0 and ut[S.queue[-1]]>=ut[c]: out+=S.get()
        S.put(c)
out+=S.queue[::-1]         #while S.qsize(): out+=S.get()
print(out)
y=x.replace('/','//')
print(eval(y))



#chao don K59
import queue
n=int(input())
a=list(map(int,input().split()))
L=[0]*n
S=queue.LifoQueue()
S.put((-1,1e9))
for i,x in enumerate(a):
    while S.queue[-1][1]<=x: S.get()
    L[i]=S.queue[-1][0]
    S.put((i,x))
S.queue=[(-1,1e9)]
R=[0]*n
for i in range(n-1,-1,-1):
    while S.queue[-1][1] <= a[i]: S.get()
    R[i] = S.queue[-1][0]
    S.put((i, a[i]))
for i,x,y in zip(range(n),L,R):                 #x,i,y
    if x==-1 or y==-1: print(x+y+1,end=" ")
    else: print(x if i-x<=y-i else y,end=" ")


#xep hang
import queue
S=queue.LifoQueue()        #(t[0],[1])
n=input()
a=map(int,input().split())
res=0
for x in a:
    while S.qsize()>0 and S.queue[-1][0]<x: res+=S.get()[1]
    if S.qsize()>0 and S.queue[-1][0]==x:
        res+=S.queue[-1][1]+(S.qsize()>1)
        S.queue[-1][1]+=1
    else:
        res+=S.qsize()>0
        S.put([x,1])
print(res)

# vi du queue
from queue import Queue
Q=Queue()                 # queue rong
Q.queue+=[3,7,2,1]
print(Q.qsize())
print(Q.queue)
for x in 5,6,3: Q.put(x)
print(Q.queue)
t=Q.get()
print(t)
print(Q.queue)

import queue
#bit mat bat de
n,k=map(int,input().split())
Q=queue.Queue()
for i in range(1,n+1): Q.put(i)
while Q.qsize()>1 :
    for j in range(1,k): Q.put(Q.get())
    Q.get()
print(Q.queue[0])

#canh cua than ky
import queue
def sol():
    n=int(input())
    Q=queue.Queue()
    for x in "dangdung","tienquan","quang123","maianh","minhduc": Q.put([x,1])
    while n>Q.queue[0][1]:
        n -= Q.queue[0][1]
        Q.put(Q.get())
        Q.queue[-1][1]*=2
    print(Q.queue[0][0])
if __name__ == '__main__':
    for i in range(int(input())): sol()

#moi con duong ve 0
import queue
def sol(S):
    n=int(input())
    D=set([n])
    S.put(n)
    while S.qsize():
        u=S.get()
        z=int(u**0.5)+1
        for a in range(1,z):
            if u%a==0:
                v=(a-1)*(u//a+1)
                if v not in D:
                    S.put(v)
                    D.add(v)
    print(*sorted(list(D)))
if __name__ == '__main__':
    S=queue.LifoQueue()
    sol(S)

#robot
import queue
Q=queue.Queue()
x,y=map(int,input().split())
Q.put((x,y))
D={(x,y):1}
while Q.qsize():
    x,y=Q.get()
    if x%2==0 and (y,x//2) not in D.keys():
        Q.put((y,x//2))
        D[(y,x//2)]=1
    if y%2 and ((y+1)//2,x) not in D.keys():
        Q.put(((y+1)//2,x))
        D[((y+1)//2,x)]=1
print(len(D))


#phan vung anh
import queue
A=[]
def DFS(u,v):            #depth first search dung LifoQueue con breadth first search dung Queue
    global A
    S=queue.LifoQueue()
    S.put((u,v))
    A[u][v]=1
    dem=1
    while S.qsize():
        x,y=S.get()
        for i in range(-1,2):
            for j in range(-1,2):
                if 0<=x+i<n and 0<=y+j<m and A[x+i][y+j]==0:
                    A[x+i][y+j]=1
                    S.put((x+i,y+j))
                    dem+=1
    return dem
if __name__ == '__main__':
    n,m=map(int,input().split())
    for i in range(n): A.append(list(map(int,input().split())))
    res=[]
    for i in range(n):
        for j in range(m):
            if A[i][j]==0: res.append(DFS(i,j))
    print(len(res))
    print(*sorted(res))


#vung kin
import queue
A=[]
def DFS(u,v):            #depth first search dung LifoQueue con breadth first search dung Queue
    global A
    S=queue.LifoQueue()
    S.put((u,v))
    A[u][v]=1
    while S.qsize():
        x,y=S.get()
        for i,j in (-1,0),(1,0),(0,-1),(0,1):
            if 0<=x+i<n and 0<=y+j<m and A[x+i][y+j]==0:
                A[x+i][y+j]=1
                S.put((x+i,y+j))
if __name__ == '__main__':
    n,m=map(int,input().split())
    for i in range(n): A.append(list(map(int,input().split())))
    for i in range(n):
        if A[i][0] == 0: DFS(i, 0)
        if A[i][m - 1] == 0: DFS(i, m - 1)
    for j in range(m):
        if A[0][j] == 0: DFS(0, j)
        if A[n-1][j] == 0: DFS(n-1,j)
    res=0
    for i in range(n):
        for j in range(m):
            if A[i][j]==0:
                DFS(i,j)
                res+=1
    print(res)



#dong nuoc
import queue
def bfs():
    n,m,k=[int(_) for _ in  input().split()]
    D={(0,0):0}
    Q=queue.Queue()
    Q.put((0,0))
    while Q.qsize():
        x,y=Q.get()
        z=x+y
        for z,t in (0,y),(n,y),(x,0),(x,m),(max(0,z-m),min(z,m)),(min(n,z),max(0,z-n)):
            if (z,t) not in D.keys():
                D[(z,t)]=D[(x,y)]+1
                Q.put((z,t))
                if (z==k or t==k): return D[(z,t)]
    return "Khong dong duoc nuoc"
if __name__ == '__main__':
    print(bfs())


#dong nuoc chi ra duong di
import queue
def induong(D,f):
    L=[(0,0)]
    while f[0] or f[1]:
        L.insert(1,f)
        f=D[f]
    print(*L,sep="->")
def bfs():
    n,m,k=[int(_) for _ in  input().split()]
    D={(0,0):0}
    Q=queue.Queue()
    Q.put((0,0))
    while Q.qsize():
        x,y=Q.get()
        z=x+y
        for z,t in (0,y),(n,y),(x,0),(x,m),(max(0,z-m),min(z,m)),(min(n,z),max(0,z-n)):
            if (z,t) not in D.keys():
                D[(z,t)]=(x,y)
                Q.put((z,t))
                if (z==k or t==k):
                    induong(D,(z,t))
                    return
    print("Khong dong duoc nuoc")
if __name__ == '__main__':
    bfs()


#chu so 6 va 8
import queue
def BFS():
    n=int(input())
    if n%5==0: return 0
    Q=queue.Queue()
    for x in 6,8: Q.put(x%n)
    M={6%n:6,8%n:8}
    while Q.qsize():
        u=Q.get()
        for x in 6,8:
            v=(u*10+x)%n
            if v not in M.keys():
                M[v]=M[u]*10+x
                Q.put(v)
            if v==0: return M[v]
    return 0
if __name__ == '__main__':
    print(BFS())



#hang doi uu tien
import queue
Q=queue.PriorityQueue()
for x in 4,7,2,8,4,8,3,2: Q.put(-x)

while Q.qsize(): print(-Q.get())

#noi thanh kim loai
from queue import PriorityQueue
Q=PriorityQueue()
n=int(input())
for x in map(int,input().split()): Q.put(x)
res=0
for i in range(1,n):
    a=Q.get()+Q.get()
    res+=a
    Q.put(a)
print(res)


#sx co dieu kien
import queue
class item:
    def __init__(self,d=0):self.data=d
    def __lt__(self, other):
        if self.data%2!=other.data%2: return self.data%2<other.data%2
        if self.data%2==0: return self.data<other.data
        return self.data>other.data
    def __str__(self): return str(self.data)


Q=queue.PriorityQueue()
for x in 4265,364,63,435,85,726,435,737,254:Q.put(item(x))
print(Q.queue[0])




#Trinh tham
import queue
class item:
    def __init__(self,v,p):   self.val,self.pos=v,p
    def __lt__(self, other):  return self.val>other.val

Q=queue.PriorityQueue()
n,k=map(int,input().split())
a=list(map(int,input().split()))
for i,x in enumerate(a,1):
    Q.put(item(x,i))
    if i>=k:
        while i-Q.queue[0].pos>=k: Q.get()
        print(Q.queue[0].val,end=" ")


#lap ghep ong nuoc
from queue import PriorityQueue
Q=PriorityQueue()
n,k=map(int,input().split())
for x in map(int,input().split()): Q.put(x)
res=0
while Q.qsize()>1:
    t=0
    for i in range(min(k,Q.qsize())): t+=Q.get()
    res+=t
    Q.put(t)
print(res)

#thuat toan huffman
import collections
from queue import PriorityQueue
Q=PriorityQueue()
D=collections.Counter(input())  #dem tan suat
for x in D.values(): Q.put(x)
res=0
while Q.qsize()>1:
    a=Q.get()+Q.get()
    res+=a
    Q.put(a)
print(res)

#phan tu trung vi
import queue
L=queue.PriorityQueue()
R=queue.PriorityQueue()
n=int(input())
a=map(int,input().split())
for i,x in enumerate(a,1):
    if i%2: L.put(-x)
    else: R.put(x)
    if i>1 and -L.queue[0]>R.queue[0]:
        x,y=L.get(),R.get()
        L.put(-y)
        R.put(-x)
    print(-L.queue[0],end=" ")



#giao hang
import queue
Q=queue.PriorityQueue()
A=[[] for i in range(100005)]
res=0
n=int(input())
for i in range(n):
    t,v=map(int,input().split())
    A[t].append(v)
for i in range(100000,0,-1):
    for x in A[i]: Q.put(-x)
    if Q.qsize(): res-=Q.get()
print(res)

#thuat toan prim

8 13
1 2 7
1 8 4
2 8 2
2 7 8
2 3 4
3 4 2
3 6 3
3 7 8
4 5 9
4 6 4
5 6 3
6 7 6
7 8 5

import queue
Q=queue.PriorityQueue()
n,m=map(int,input().split())
A=[[] for i in range(n+5)]
for i in range(m):
    u,v,w=map(int,input().split())
    A[u].append((w,v))
    A[v].append((w,u))
res=0
M=[0,0]+[1e9]*(n+5)
Q.put((0,1))
while Q.qsize():
    w,u=Q.get()
    if M[u]==-1: continue
    M[u]=-1
    res+=w
    for d,v in A[u]:
        if M[v]>d:
            Q.put((d,v))
            M[v]=d
print(res)


#nhom ban
P=[0]*100005  #P[x] -> cha cua x
D=[1]*100005  #D[x] - So nut trong cay con co goc la x
def find_root(x):  #return x if P[x]==0 else find_root(P[x])
    while P[x]: x=P[x]
    return x
def ghep(x,u):
    while P[x]:
        y= P[x]
        P[x]=u
        x = y

if __name__ == '__main__':
    n,m=map(int,input().split())
    res=n
    M=1
    for i in range(m):
        x,y= map(int, input().split())
        u=find_root(x)
        v=find_root(y)
        if u!=v:
            P[v]=u
            D[u]+=D[v]
            ghep(x, u)
            ghep(y, u)
            M=max(M,D[u])
            res-=1
    print(res)
    print(M)

#thuat toan Kruskal tim cay khung nho nhat cua do thi
P=[0]*10005
def find_root(x):  #return x if P[x]==0 else find_root(P[x])
    while P[x]: x=P[x]
    return x
if __name__ == '__main__':
    n,m=map(int,input().split())
    A=[]
    for i in range(m):
        u,v,w = map(int,input().split())
        A.append((w,u,v))
    A.sort()
    res=0
    for w,x,y in A:
        u=find_root(x)
        v=find_root(y)
        if u!=v:
            res+=w
            P[v]=u
            while P[x]: P[x],x=u,P[x]
            while P[y]: P[y],y=u,P[y]
    print(res)
'''
# phản ứng hoá học
P = [0]*1005  # P[x] -> cha cua x
D = [1]*1005  # D[x] - So nut trong cay con co goc la x


def find_root(x):
    while P[x]:
        x = P[x]
    return x


if __name__ == '__main__':
    n, m = map(int, input().split())
    M = 1
    for i in range(m):
        x, y = map(int, input().split())
        u = find_root(x)
        v = find_root(y)
        if u != v:
            P[v] = u
            D[u] += D[v]
            while P[x]:
                P[x], x = u, P[x]
            while P[y]:
                P[y], y = u, P[y]
            M = max(M, D[u])
    res = 1
    for x in range(1, n+1):
        if P[x] == 0:
            res *= 1 << (D[x]-1)
    print(res)
