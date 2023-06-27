#include<stdio.h>
// #include<bits/stdc++.h>

void bubble_sort(int arr[], int size) {
  for (int i = 0; i < size - 1; i++) {
    for (int j = 0; j < size - i - 1; j++) {
      if (arr[j] > arr[j + 1]) {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
}

typedef long long ll;
int main(){
    // ios_base::sync_with_stdio(false);cin.tie(NULL);cout.tie(NULL);
    freopen("inp.inp","r",stdin);
    freopen("out.out","w",stdout);
    int a, temp=0;
    scanf("%d", &a);
    int arr[a];
    for (int i=0; i<a; i++){
        scanf("%d", &arr[i]);
        temp += arr[i];
        printf("%d ", arr[i]);
    }
    bubble_sort(arr, a);
    printf("\n%f\n", (float)(temp/a));
    if (a%2!=0)
        printf("%d", arr[(a/2)]);
    else
        printf("%d %d", arr[(a/2)-1], arr[a/2]);
}