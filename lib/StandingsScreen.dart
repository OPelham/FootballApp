import 'package:flutter/material.dart';

class StandingsScreen extends StatelessWidget {
  
  ///list of StandingsInto object
  
//  BuildContext context;
  String competitionCode;
  //constructor
  StandingsScreen(this.competitionCode);

  @override
  Widget build(BuildContext context) {
//    this.context = context;
  return Scaffold(
    key: Key("table_scaffold"),
    //appbar ...
    body: _buildTableScreen(),
  );

  }

  /***
   * returns widget with table layout for use in TableScreen build method
   */
  Widget _buildTableScreen() {
    return ListView( //for scrolability
      children: <Widget>[],
    );
  }

  Widget _buildStandingsRow() {
    return Row(
      children: <Widget>[
        Expanded(
          ///position
        ),
        Expanded(
          ///name
        ), //Expanded
        Expanded(
          ///points
        ), //Expanded
        Expanded(
          ///pointsDiff
        ),
      ],
    );
  }

}

