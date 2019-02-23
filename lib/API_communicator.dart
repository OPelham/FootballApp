import 'package:http/http.dart' as http ;
import 'R_connection.dart';
import 'dart:convert';
import 'dart:io';

class API_communicator {

  ///Returns Json of a competition from API as String, dynamic map
  Future<Map <String, dynamic>> fetch_competition_teams(String competitionCode) async {
    final response =  await http.get(R_connection.BASE + "competitions/$competitionCode/teams", headers: {
      "X-Auth-Token": R_connection.APIKEY
    });

    ///if connected return the json decoded into map
    if (response.statusCode == 200) {
      print("DEBUG JSON to print" + response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }



  //return array of team objects
  Future<void> build_teams() async {
    var resp = await fetch_competition_teams(R_connection.COMP_CODE_EUROPEAN_CHAMPIONSHIP);

    List teams = resp["teams"];

    //Has problems priniting if crest is null
    teams.forEach((team) => print("NAME - " + team["name"] /*+ " CREEST - " + team["crestUrl"] */ ));
    ///Make team objects and create them here make a factory for them?

//    resp.forEach((key, value) {
//      print("DEBUG KEY" + key);
//      print(value);

//      print(teams);
//    }
//    );
  }
}

