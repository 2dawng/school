#include<iostream>
using namespace std;
typedef long long ll;

int *reqa(int *a){
    cin>>*a;
    int *arr=new int[*a];
    for (int i = 0;i < *a; i++)
        cin>>arr[i];
    for (int i = 0;i < *a; i++)
        cout<<arr[i]<<" ";
    return arr;
}

int reqb(int *a, int *arr){
    if (arr[0] == 0)
        return -1;
    int temp = 0;
    for (int i = 1;i < *a; i++)
        if (arr[i] % arr[0] == 0)
            temp++;
    return temp;
}

void reqc(int *a, int *arr){
    int a1, a2, a3;
    if (arr[0] >= arr[1] && arr[0] >= arr[2]){
        a1 = arr[0];
        if (arr[1] >= arr [2]){
        a2 = arr[1];
        a3 = arr[2];
        }
        else{
        a2 = arr[2];
        a3 = arr[1];
        }
    }
    else if (arr[1] >= arr [2]){
        a1 = arr[1];
        if (arr[0] >= arr [2]){
            a2 = arr[0];
            a3 = arr[2];
        }
        else{
        a2 = arr[2];
        a3 = arr[0];
        }
        }
        else{
        a1 = arr[2];
        if (arr[0] >= arr [1]){
            a2 = arr[0];
            a3 = arr[1];
        }
        else{
        a2 = arr[1];
        a3 = arr[0];
        }
    }
    for (int i = 3;i < *a; i++){
        if (arr[i] >= a1){
            a3 = a2;
            a2 = a1;
            a1 = arr[i];
        }
        else if (arr[i] >= a2){
            a3 = a2;
            a2 = arr[i];
        }else if (arr[i] > a3)
            a3 = arr[i];
    }
    cout << "Ba phan tu lon nhat la " << a1 <<", " << a2 << ", " << a3;
}

void reqd(int *a, int *arr){
    int temp = arr[0] + arr[1] + arr[2];
    int loc;
    for (int i = 2;i < *a; i++){
        if (arr[i - 2] + arr[i - 1] + arr[i] >= temp){
            temp = arr[i - 2] + arr[i - 1] + arr[i];
            loc = i;
        }
    }
    cout << "Bo ba phan tu co tong lon nhat la " << arr[loc - 2] << ", " << arr[loc - 1] << ", "<< arr[loc];
}

void reqe(int *a, int *arr){
    int temp = 2147483647;
    for (int i = 0;i < *a; i++)
        if (arr[i] >= 0 && arr[i] < temp)
            temp = arr[i];
    cout << "Phan tu duong nho nhat cua day la " << temp;
}

int main(){
    int *a ;
    int *arr=new int[*a];
    arr = reqa(a);
    cout<<endl;
    int b = reqb(a, arr);
    if (b == -1)
        cout << "Phan tu dau tien la 0";
    else 
        cout << "Co " << b << " phan tu chia het cho phan tu dau tien";
    cout<<endl;
    if (*a > 3){
        reqc(a, arr);
        cout << endl;
        reqd(a, arr);
    }
    cout << endl;
    reqe(a, arr);
    
}