import 'dart:io';
import 'ttt_functions.dart';

void main() {
  // start with an empty board
  List<List<String>> board = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]];

  // initialize variables
  Map<String, String> nextPlayer = {"X": "O", "O": "X"};
  String curPlayer = "X";

  while (true) {
    printBoard(board);
    stdout.write("Enter player $curPlayer move as row,col: ");
    String? move = stdin.readLineSync();
    List<String> moveParts = move!.split(",");

    if (moveParts.length == 2 &&
        0 <= int.parse(moveParts[0]) &&
        int.parse(moveParts[0]) <= 2 &&
        0 <= int.parse(moveParts[1]) &&
        int.parse(moveParts[1]) <= 2) {
      int row = int.parse(moveParts[0]);
      int col = int.parse(moveParts[1]);
      if (play(curPlayer, row, col, board)) {
        String winner = checkWin(board);
        if (winner == curPlayer) {
          printBoard(board);
          print("Congratulations! Player $curPlayer wins.");
          break;
        } else if (!canPlay(board)) {
          printBoard(board);
          print("No more valid moves. It's a draw.");
          break;
        } else {
          curPlayer = nextPlayer[curPlayer]!;
        }
      } else {
        print("Invalid move. That position is already taken.");
      }
    } else {
      print("Invalid move. Rows and columns must be between 0 and 2 and separated by a comma.");
    }
  }

  print("\nThanks for playing!");
}
