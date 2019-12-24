import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:tic_tac_toe/constants.dart';
import 'package:tic_tac_toe/game_screen.dart';
import 'package:tic_tac_toe/player_names.dart';

class RegisterScreen extends StatelessWidget {
  TextEditingController _t1 = TextEditingController();
  TextEditingController _t2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var playerDetailState = Provider.of<PlayerDetails>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: Text(
          "LETS BEGIN!",
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
        // mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Spacer(
            flex: 5,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: TextFormField(
              cursorColor: Colors.amber[800],
              style: TextStyle(
                fontFamily: 'Lilita',
                fontSize: 20.0,
              ),
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                suffixText: 'X',
                suffixStyle: TextStyle(
                  fontFamily: 'Lilita',
                  fontSize: 25.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber[900],
                    width: 3.0,
                  ),
                ),
                hintText: 'Player 1',
                hintStyle: TextStyle(fontFamily: 'Lilita'),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber, width: 5.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              controller: _t1,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10.0,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: TextFormField(
              cursorColor: Colors.amber[800],
              style: TextStyle(
                fontFamily: 'Lilita',
                fontSize: 20.0,
              ),
              decoration: InputDecoration(
                suffixText: 'O',
                suffixStyle: TextStyle(
                  fontFamily: 'Lilita',
                  fontSize: 25.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.amber[900],
                    width: 3.0,
                  ),
                ),
                hintText: 'Player 2',
                hintStyle: TextStyle(fontFamily: 'Lilita'),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber, width: 5.0),
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              controller: _t2,
            ),
          ),
          Spacer(
            flex: 1,
          ),
          MaterialButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              "Start",
              style: start_button_style,
            ),
            highlightElevation: 15.0,
            splashColor: Colors.amber,
            elevation: 10.0,
            padding: EdgeInsets.symmetric(
              vertical: 7.0,
              horizontal: 20.0,
            ),
            onPressed: () {
              playerDetailState.setNames(_t1.text, _t2.text);
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: GameScreen(),
                ),
              );
            },
            color: Colors.amber[900],
          ),
          Spacer(
            flex: 5,
          ),
        ],
      ),
    );
  }
}
