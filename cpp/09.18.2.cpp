#include <iostream>
using namespace std;

const int N = 8;
int count = 0;

bool isSafe(char board[N][N], int row, int col) {
    // Check if there is a queen in the same column
    for (int i = 0; i < row; i++) {
        if (board[i][col] == 'Q') {
            return false;
        }
    }

    // Check if there is a queen in the diagonal (\)
    for (int i = row - 1, j = col - 1; i >= 0 && j >= 0; i--, j--) {
        if (board[i][j] == 'Q') {
            return false;
        }
    }

    // Check if there is a queen in the diagonal (/)
    for (int i = row - 1, j = col + 1; i >= 0 && j < N; i--, j++) {
        if (board[i][j] == 'Q') {
            return false;
        }
    }

    return true;
}

void solve(char board[N][N], int row) {
    if (row == N) {
        // Found a valid placement
        count++;
        return;
    }

    for (int col = 0; col < N; col++) {
        if (board[row][col] == '.' && isSafe(board, row, col)) {
            // Place the queen
            board[row][col] = 'Q';

            // Recur to the next row
            solve(board, row + 1);

            // Remove the queen (backtrack)
            board[row][col] = '.';
        }
    }
}

int main() {
    char board[N][N];

    // Read the input
    for (int i = 0; i < N; i++) {
        for (int j = 0; j < N; j++) {
            cin >> board[i][j];
        }
    }

    // Solve the problem
    solve(board, 0);

    // Print the result
    cout << count << endl;

    return 0;
}
