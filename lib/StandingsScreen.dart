import 'package:flutter/material.dart';
import 'StandingsInfo.dart';
import 'API_communicator.dart';

class StandingsScreen extends StatelessWidget {
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
//      body: _buildTableScreen(),
    );
  }

  ///returns widget with table layout for use in TableScreen build method
  Future<Widget> _buildTableScreen() async {
    API_communicator connection = API_communicator();
    List<StandingsInfo> standingsInfoList =
        await connection.build_competition_standings(competitionCode);
    return ListView(
      //for scrolability
      children: <Widget>[],
    );
  }

  ///given a team in a position in table build a row to display
  Widget _buildStandingsRow(StandingsInfo teamInPosition) {
    String position = teamInPosition.position.toString();
    String points = teamInPosition.points.toString();
    String name = teamInPosition.name;
    String pointsDiff = teamInPosition.pointsDiff.toString();

    return Row(
      children: <Widget>[
        Text(position),
        Text(name),
        Text(points),
        Text(pointsDiff)

        //TODO this now gives a row need to call this in place that makes list of these rows so that this in turn can be called to build layout with these rows
      ],
    );
  }
}
