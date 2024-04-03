import java.util.Random;
import java.util.Scanner;

public class Minesweeper {
    private static final int SIZE = 5;
    private static final int MINES = 5;
    private static char[][] board = new char[SIZE][SIZE];
    private static char[][] mines = new char[SIZE][SIZE];

    public static void main(String[] args) {
        initializeBoard();
        placeMines();
        playGame();
    }

    private static void initializeBoard() {
        for (int i = 0; i < SIZE; i++) {
            for (int j = 0; j < SIZE; j++) {
                board[i][j] = '-';
                mines[i][j] = ' ';
            }
        }
    }

    private static void placeMines() {
        Random random = new Random();
        int count = 0;
        while (count < MINES) {
            int x = random.nextInt(SIZE);
            int y = random.nextInt(SIZE);
            if (mines[x][y] != '*') {
                mines[x][y] = '*';
                count++;
            }
        }
    }

    private static void playGame() {
        Scanner scanner = new Scanner(System.in);
        int row, col;
        boolean gameOver = false;

        while (!gameOver) {
            printBoard(board);

            System.out.print("Enter row and column: ");
            row = scanner.nextInt();
            col = scanner.nextInt();

            if (mines[row][col] == '*') {
                System.out.println("Game Over! You hit a mine.");
                gameOver = true;
            } else {
                board[row][col] = Character.forDigit(countAdjacentMines(row, col), 10);
            }
        }
        scanner.close();
    }

    private static int countAdjacentMines(int row, int col) {
        int count = 0;
        for (int i = row - 1; i <= row + 1; i++) {
            for (int j = col - 1; j <= col + 1; j++) {
                if (i >= 0 && i < SIZE && j >= 0 && j < SIZE && mines[i][j] == '*') {
                    count++;
                }
            }
        }
        return count;
    }

    private static void printBoard(char[][] board) {
        for (int i = 0; i < SIZE; i++) {
            for (int j = 0; j < SIZE; j++) {
                System.out.print(board[i][j] + " ");
            }
            System.out.println();
        }
    }
}
