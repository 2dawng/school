#include <iostream>
using namespace std;

int findSmallest(int arr[], int left, int right)
{
    if (left == right)
    {
        return arr[left];
    }

    int mid = left + (right - left) / 2;

    int leftSmallest = findSmallest(arr, left, mid);
    int rightSmallest = findSmallest(arr, mid + 1, right);

    return min(leftSmallest, rightSmallest);
}

int main()
{
    int arr[] = {9, 4, 5, 7, 2, 4, 6, 8, 1, 3};
    int size = sizeof(arr) / sizeof(arr[0]);

    int result = findSmallest(arr, 0, size - 1);
    cout << "Smallest value: " << result;
    return 0;
}
