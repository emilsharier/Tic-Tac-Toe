import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/init_screen.dart';
import 'package:tic_tac_toe/player_names.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PlayerDetails>(
      create: (_) => PlayerDetails(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Spacer(),
            Text(
              "X O X",
              style: TextStyle(
                color: Colors.amber[700],
                fontSize: 130.0,
                fontFamily: 'Lilita',
              ),
            ),
            Text(
              "A game of TIC TAC TOE",
              style: TextStyle(
                color: Colors.amber,
                fontSize: 20.0,
                fontFamily: 'Lilita',
              ),
            ),
            Spacer(),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              highlightElevation: 15.0,
              splashColor: Colors.amber,
              elevation: 10.0,
              padding: EdgeInsets.symmetric(
                vertical: 7.0,
                horizontal: 20.0,
              ),
              child: Text(
                "Start",
                style: start_button_style,
              ),
              onPressed: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.downToUp,
                  child: RegisterScreen(),
                ),
              ),
              color: Colors.amber[900],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
