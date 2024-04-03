import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.Random;

public class ClickableMinesweeper extends JFrame {
    private static final int SIZE = 10;
    private static final int MINES = 10;
    private JButton[][] buttons = new JButton[SIZE][SIZE];
    private char[][] mines = new char[SIZE][SIZE];

    public ClickableMinesweeper() {
        setTitle("Clickable Minesweeper");
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new GridLayout(SIZE, SIZE));

        initializeBoard();
        placeMines();

        for (int i = 0; i < SIZE; i++) {
            for (int j = 0; j < SIZE; j++) {
                JButton button = new JButton();
                button.setPreferredSize(new Dimension(50, 50));
                add(button);
                buttons[i][j] = button;

                int row = i;
                int col = j;
                button.addMouseListener(new MouseAdapter() {
                    @Override
                    public void mouseClicked(MouseEvent e) {
                        if (e.getButton() == MouseEvent.BUTTON1) {
                            revealCell(row, col);
                        }
                    }
                });
            }
        }

        pack();
        setLocationRelativeTo(null);
        setVisible(true);
    }

    private void initializeBoard() {
        for (int i = 0; i < SIZE; i++) {
            for (int j = 0; j < SIZE; j++) {
                mines[i][j] = ' ';
            }
        }
    }

    private void placeMines() {
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

    private void revealCell(int row, int col) {
        if (mines[row][col] == '*') {
            JOptionPane.showMessageDialog(this, "Game Over! You hit a mine.");
            System.exit(0);
        } else {
            buttons[row][col].setText(String.valueOf(countAdjacentMines(row, col)));
        }
    }

    private int countAdjacentMines(int row, int col) {
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

    public static void main(String[] args) {
        SwingUtilities.invokeLater(ClickableMinesweeper::new);
    }
}
