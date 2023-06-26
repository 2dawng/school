#include <cstdio>
#include <cstring>
#include <algorithm>

using namespace std;

struct DV {
    char hoten[80]; int ns, nkn;
};

void readnprint(DV *arr, int n){
    for (int i = 0; i < n; i++) {
        scanf("%[^\n]s", arr[i].hoten);
        scanf(" %d", &arr[i].ns);
        scanf("%d", arr[i].nkn);
        // scanf(" %c", &arr[i].hoc);
    }
}

// bool sorter(const DV& lhs, const DV& rhs) {
//     // if (strcmp(lhs.ten, rhs.ten) != 0)
//     //     return strcmp(lhs.ten, rhs.ten) < 0;
//     // if (strcmp(lhs.ho, rhs.ho) != 0)
//     //     return strcmp(lhs.ho, rhs.ho) < 0;
//     return strcmp(lhs.ns, rhs.ns) < 0;
// }

int main() {
    freopen("inp.inp", "r", stdin);
    freopen("out.out", "w", stdout);

    int n;
    scanf("%d", &n);

    DV* arr;
    readnprint(arr,n);
    

    // printf("Danh sach dang vien:\n");
    // for (int i = 0; i < n; i++) {
    //     printf("Dang vien %d\nHo va ten: %s\nNam sinh: %s\nNam ket nap: %s\n",
    //         i + 1, arr[i].hoten, arr[i].ns, arr[i].nkn);
    // }

    // sort(arr, arr + n, sorter);

    // printf("\nSau khi sap xep:\n");
    // for (int i = 0; i < n; i++) {
    //     printf("Sinh vien %d\nHo va ten: %s %s\nQue quan: %s\nHoc luc: %c\n",
    //         i + 1, arr[i].ho, arr[i].ten, arr[i].que, arr[i].hoc);
    // }

    // return 0;
}
