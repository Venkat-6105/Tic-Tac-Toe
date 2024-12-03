package com.tictactoe;

import java.util.Arrays;

public class TicTacToe {
    private String[] board = new String[9];
    private boolean xTurn = true;
    private int moveCount = 0;
    private boolean gameWon = false;

    private final int[][] winningPatterns = {
            {0, 1, 2}, {0, 3, 6}, {2, 5, 8},
            {6, 7, 8}, {3, 4, 5}, {1, 4, 7},
            {0, 4, 8}, {2, 4, 6}
    };

    public TicTacToe() {
        resetGame();
    }

    public void resetGame() {
        Arrays.fill(board, "");
        xTurn = true;
        moveCount = 0;
        gameWon = false;
    }

    public String makeMove(int position) {
        if (position < 0 || position >= 9 || !board[position].isEmpty() || gameWon) {
            return "Invalid move.";
        }

        board[position] = xTurn ? "X" : "O";
        xTurn = !xTurn;
        moveCount++;

        if (checkWin()) {
            gameWon = true;
            return board[position] + " Wins!";
        } else if (moveCount == 9) {
            return "It's a Draw!";
        }

        return "Move accepted.";
    }

    private boolean checkWin() {
        for (int[] pattern : winningPatterns) {
            String a = board[pattern[0]];
            String b = board[pattern[1]];
            String c = board[pattern[2]];

            if (!a.isEmpty() && a.equals(b) && b.equals(c)) {
                return true;
            }
        }
        return false;
    }

    public String[] getBoard() {
        return board;
    }

    public boolean isXTurn() {
        return xTurn;
    }

    public boolean isGameWon() {
        return gameWon;
    }

    public int getMoveCount() {
        return moveCount;
    }
}