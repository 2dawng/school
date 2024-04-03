#include <iostream>
#include <climits>

using namespace std;

int minCoins(int A[], int n, int M)
{
    int dp[M + 1];
    dp[0] = 0;

    for (int i = 1; i <= M; ++i)
    {
        dp[i] = INT_MAX;
        for (int j = 0; j < n; ++j)
        {
            if (A[j] <= i)
            {
                int sub_res = dp[i - A[j]];
                if (sub_res != INT_MAX && sub_res + 1 < dp[i])
                {
                    dp[i] = sub_res + 1;
                }
            }
        }
    }

    return dp[M];
}

int main()
{
    int n;
    cout << "Nhap so loai dong tien: ";
    cin >> n;

    int B[6];
    B[0] = 1;
    B[1] = 2;
    B[2] = 5;
    B[3] = 10;
    B[4] = 25;
    B[5] = 50;

    int A[n];
    if (n != 0)
    {
        cout << "Nhap thong tin ve tung loai dong tien:\n";
        for (int i = 0; i < n; ++i)
        {
            cout << "Menh gia cua dong tien thu " << i + 1 << ": ";
            cin >> A[i];
        }
    }

    int M;
    cout << "Nhap so dong tien can doi: ";
    cin >> M;
    int min_coins_needed;
    if (n != 0)
        min_coins_needed = minCoins(A, n, M);
    else
        min_coins_needed = minCoins(B, 6, M);
    if (min_coins_needed == INT_MAX)
    {
        cout << "Khong the doi duoc.\n";
    }
    else
    {
        cout << "So luong it nhat cac dong tien can dung la: " << min_coins_needed << endl;
    }

    return 0;
}
