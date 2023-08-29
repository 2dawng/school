#include <cstdio>
#include <cstring>
#include <algorithm>

using namespace std;

struct SV {
    char ho[50], ten[50], que[50], hoc;
};

bool sorter(const SV& lhs, const SV& rhs) {
    if (lhs.hoc != rhs.hoc)
        return lhs.hoc < rhs.hoc;
    if (strcmp(lhs.ten, rhs.ten) != 0)
        return strcmp(lhs.ten, rhs.ten) < 0;
    if (strcmp(lhs.ho, rhs.ho) != 0)
        return strcmp(lhs.ho, rhs.ho) < 0;
    return strcmp(lhs.que, rhs.que) < 0;
}

int main() {
    freopen("inp.inp", "r", stdin);
    freopen("out.out", "w", stdout);

    int n;
    scanf("%d", &n);

    SV* arr = new SV[n];
    for (int i = 0; i < n; i++) {
        scanf(" %[^\n]", arr[i].ho);
        scanf(" %[^\n]", arr[i].ten);
        scanf(" %[^\n]", arr[i].que);
        scanf(" %c", &arr[i].hoc);
    }
    

    printf("Danh sach sinh vien:\n");
    for (int i = 0; i < n; i++) {
        printf("Sinh vien %d\nHo va ten: %s %s\nQue quan: %s\nHoc luc: %c\n",
            i + 1, arr[i].ho, arr[i].ten, arr[i].que, arr[i].hoc);
    }

    sort(arr, arr + n, sorter);

    printf("\nSau khi sap xep:\n");
    for (int i = 0; i < n; i++) {
        printf("Sinh vien %d\nHo va ten: %s %s\nQue quan: %s\nHoc luc: %c\n",
            i + 1, arr[i].ho, arr[i].ten, arr[i].que, arr[i].hoc);
    }

    return 0;
}
