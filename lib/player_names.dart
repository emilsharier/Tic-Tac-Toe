import 'package:flutter/material.dart';

import 'GameState.dart';

class PlayerDetails with ChangeNotifier {
  List<int> matrix;

  int currentPlayer;
  int winner;
  GameState gameState;

  PlayerDetails() {
    matrix = [];
    for (int i = 0; i < 9; i++) matrix.add(-15);
    symbols = ["X", "O", ""];
    currentPlayer = 0;
    currentSymbol = "";
    gameState = GameState.playing;
    winner = -1;
  }

  void reset() {
    gameState = GameState.playing;
    player1 = player2 = "";
    matrix.clear();
    for (int i = 0; i < 9; i++) matrix.add(-15);
    currentPlayer = 0;
  }

  List<String> symbols;

  String player1, player2;
  String currentSymbol;

  void setNames(String n1, String n2) {
    player1 = n1;
    player2 = n2;
    notifyListeners();
  }

  void assignValue(int index) {
    if (matrix[index] != 0 && matrix[index] != 1) {
      matrix[index] = currentPlayer;
      (currentPlayer == 0) ? currentPlayer = 1 : currentPlayer = 0;
    }

    print(matrix);

    refractor();
  }

  refractor() {
    int sum = 0;
    int i, j;

    for (i = 0; i < 3; i++) {
      sum = 0;
      for (j = i; j < 9; j += 3) {
        sum += matrix[j];
      }
      if (sum == 0 || sum == 3) {
        gameState = GameState.done;
        winner = sum;
        notifyListeners();
        return;
      }
    }

    for (i = 0; i < 9; i += 3) {
      sum = 0;
      for (j = i; j < (i + 3); j++) {
        sum += matrix[j];
      }
      if (sum == 0 || sum == 3) {
        gameState = GameState.done;
        winner = sum;
        notifyListeners();
        return;
      }
    }

    sum = 0;
    for (i = 2; i < 7; i += 2) sum += matrix[i];
    if (sum == 0 || sum == 3) {
      gameState = GameState.done;
      winner = sum;
      notifyListeners();
      return;
    }

    sum = 0;
    for (i = 0; i < 9; i += 4) sum += matrix[i];
    if (sum == 0 || sum == 3) {
      gameState = GameState.done;
      winner = sum;
      notifyListeners();
      return;
    }

    if (!matrix.contains(-15)) {
      gameState = GameState.draw;
      notifyListeners();
    }
  }

  void resetMatrix() {
    matrix.clear();
    for (int i = 0; i < 15; i++) matrix.add(-15);
  }

  String getCurrentValue(int index) {
    if (matrix[index] == 0)
      return "X";
    else
      return "O";
  }

  int get getWinner => winner;
  GameState get getGameState => gameState;
  String get getCurrentSymbol => currentSymbol;
  String get getPlayer1Name => player1;
  String get getPlayer2Name => player2;
}
