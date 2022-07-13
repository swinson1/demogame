class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
}

class Game {
  static final boardlength = 9;
  static final blocSize = 100.0;

  List<String>? board;
  static List<String>? initGameBoard() =>
      List.generate(boardlength, (index) => Player.empty);

  bool winnerCheck(
      String player, int index, List<int> scoreboard, int gridSize) {
    // if (index == 0) {
    //   if (board![0] == player && board![1] == player && board![2] == player) {
    //     scoreboard[0] = 1;
    //     return true;
    //   }
    // }
    int row = index ~/ 3;
    int col = index % 3;
    int score = player == "X" ? 1 : -1;

    scoreboard[row] += score;
    scoreboard[gridSize + col] += score;
    if (row == col) {
      scoreboard[gridSize * 2] += score;
    }
    if (gridSize - 1 - col == row) scoreboard[2 * gridSize + 1] += score;

    if (scoreboard.contains(3) || scoreboard.contains(-3)) {
      return true;
    }
    ;

    return false;
  }
}
