import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/GameState.dart';
import 'package:tic_tac_toe/player_names.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.grey[200],
            title: Center(
              child: Text(
                "GO BACK?",
                style: TextStyle(
                  fontFamily: 'Lilita',
                  fontSize: 30.0,
                ),
              ),
            ),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FlatButton(
                  color: Colors.amber[500],
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                  child: new Text(
                    "NO",
                    style: TextStyle(
                      fontFamily: 'Lilita',
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Spacer(),
                new FlatButton(
                  color: Colors.amber[900],
                  onPressed: () {
                    Provider.of<PlayerDetails>(context).reset();
                    Navigator.of(context).pop(true);
                  },
                  child: Text(
                    "YES",
                    style: TextStyle(
                      fontFamily: 'Lilita',
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ) ??
        false;
  }

  @override
  void initState() {
    //showResult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final String player1 = Provider.of<PlayerDetails>(context).getPlayer1Name;
    final String player2 = Provider.of<PlayerDetails>(context).getPlayer2Name;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: Colors.grey[200],
                  title: Center(
                    child: Text(
                      "GO BACK?",
                      style: TextStyle(
                        fontFamily: 'Lilita',
                        fontSize: 30.0,
                      ),
                    ),
                  ),
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new FlatButton(
                        color: Colors.amber[500],
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: new Text(
                          "NO",
                          style: TextStyle(
                            fontFamily: 'Lilita',
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
                      new FlatButton(
                        color: Colors.amber[900],
                        onPressed: () {
                          Provider.of<PlayerDetails>(context).reset();
                          Navigator.of(context).pop(true);
                        },
                        child: Text(
                          "YES",
                          style: TextStyle(
                            fontFamily: 'Lilita',
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.refresh,
                size: 30.0,
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.grey[200],
                    title: Center(
                      child: Text(
                        "Reset?",
                        style: TextStyle(
                          fontFamily: 'Lilita',
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    content: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new FlatButton(
                          color: Colors.amber[500],
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: new Text(
                            "NO",
                            style: TextStyle(
                              fontFamily: 'Lilita',
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Spacer(),
                        new FlatButton(
                          color: Colors.amber[900],
                          onPressed: () {
                            Provider.of<PlayerDetails>(context).resetMatrix();
                            Navigator.of(context).pop(true);
                          },
                          child: Text(
                            "YES",
                            style: TextStyle(
                              fontFamily: 'Lilita',
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
          centerTitle: true,
          title: Text(
            "PLAY!",
            style: TextStyle(
              fontFamily: 'Lilita',
              fontSize: 35.0,
            ),
          ),
          backgroundColor: Colors.amber[800],
          elevation: 10.0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Spacer(
              flex: 1,
            ),
            Text(
              player1 + " - X ",
              style: TextStyle(
                fontFamily: 'BalooBhai',
                color: Colors.black54,
                fontSize: 30.0,
              ),
            ),
            Expanded(
              flex: 4,
              child: GridView.builder(
                // physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 0.99,
                ),
                itemCount: 9,
                itemBuilder: (context, index) => IndButton(index, ""),
              ),
            ),
            Text(
              player2 + " - O",
              style: TextStyle(
                fontFamily: 'BalooBhai',
                color: Colors.black54,
                fontSize: 30.0,
              ),
            ),
            Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}

class IndButton extends StatefulWidget {
  final int index;
  final String symbol;
  IndButton(this.index, this.symbol);

  @override
  _IndButtonState createState() => _IndButtonState();
}

class _IndButtonState extends State<IndButton> {
  String temp;
  GameState gameState;
  Color color;

  @override
  void initState() {
    color = Colors.black;
    temp = "";
    super.initState();
  }

  showResult() {
    gameState = Provider.of<PlayerDetails>(context).gameState;
    int winnerId = Provider.of<PlayerDetails>(context).getWinner;

    String winnerPlayerName = "";

    (winnerId == 0)
        ? winnerPlayerName = Provider.of<PlayerDetails>(context).player1
        : winnerPlayerName = Provider.of<PlayerDetails>(context).player2;

    if (gameState == GameState.done) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.grey[200],
            title: Center(
              child: Text(
                winnerPlayerName + " has won the game!",
                style: TextStyle(
                  fontFamily: 'BalooBhai',
                  color: Colors.black54,
                  fontSize: 30.0,
                ),
              ),
            ),
          );
        },
      );
    } else if (gameState == GameState.draw) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            backgroundColor: Colors.grey[200],
            title: Center(
              child: Text(
                "IT'S A DRAW!",
                style: TextStyle(
                  fontFamily: 'BalooBhai',
                  color: Colors.black54,
                  fontSize: 30.0,
                ),
              ),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<PlayerDetails>(context).assignValue(widget.index);
        setState(() {
          temp = Provider.of<PlayerDetails>(context)
              .matrix[widget.index]
              .toString();
          if (temp == "0") {
            temp = "X";
            color = Colors.amber[900];
          } else {
            temp = "O";
            color = Colors.amber;
          }
        });
        showResult();
      },
      child: Container(
        color: Colors.grey[300],
        child: Center(
          child: Text(
            temp,
            style: TextStyle(
              color: color,
              fontFamily: 'Lilita',
              fontSize: 60.0,
            ),
          ),
        ),
      ),
    );
  }
}
