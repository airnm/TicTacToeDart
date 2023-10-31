import 'dart:io';

void printBoard(List<List<String>> board) {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      stdout.write(board[i][j]);
      if (j < 2) {
        stdout.write(" | ");
      }
    }
    print(""); // Print a newline after each row
    if (i < 2) {
      print("---+---+---"); // Print the horizontal line between rows
    }
  }
  print(""); // Print an extra newline at the end
}

bool play(String symbol, int row, int col, List<List<String>> board) {
  if (board[row][col] == " ") {
    board[row][col] = symbol;
    return true;
  } else {
    return false;
  }
}

bool canPlay(List<List<String>> board) {
  for (List<String> row in board) {
    if (row.contains(" ")) {
      return true;
    }
  }
  return false;
}

String checkWin(List<List<String>> board) {
  // Check rows
  for (List<String> row in board) {
    if ((row[0] == row[1]) && (row[1] == row[2]) && (row[0] != " ")) {
      return row[0];
    }
  }

  // Check columns
  for (int col = 0; col < 3; col++) {
    if ((board[0][col] == board[1][col]) &&
        (board[1][col] == board[2][col]) &&
        (board[0][col] != " ")) {
      return board[0][col];
    }
  }

  // Check diagonals
  if ((board[0][0] == board[1][1] && board[1][1] == board[2][2]) && (board[0][0] != " ")) {
    return board[0][0];
  }
  if ((board[0][2] == board[1][1] && board[1][1] == board[2][0]) && (board[0][2] != " ")) {
    return board[0][2];
  }

  return "";
}

