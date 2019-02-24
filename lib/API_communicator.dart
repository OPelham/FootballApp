import 'package:http/http.dart' as http ;
import 'R_connection.dart';
import 'dart:convert';

/***
 * The class responsible for making calls to the API
 * TODO move build teams method into own class 
 */
class API_communicator {

  ///Returns Json of a competition from API as String, dynamic map
  Future<Map <String, dynamic>> fetch_competition_teams(String competitionCode) async {
    final response =  await http.get(R_connection.BASE + "competitions/$competitionCode/teams", headers: {
      "X-Auth-Token": R_connection.APIKEY
    });

    ///if connected return the json decoded into map
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }

  Future<Map<String, dynamic>> fetch_competition_standings(String competitionCode) async {
    final response = await http.get(R_connection.BASE + "competitions/$competitionCode/standings", headers: {
      "X-Auth-Token": R_connection.APIKEY
    });

    if (response.statusCode == 200) {
      print("DEBUG JSON to print" + response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }
  }



  //return array of team objects
  Future<void> build_competition_teams(String competitionCode) async {
    var resp = await fetch_competition_teams(competitionCode);
    List teams = resp["teams"];
    //Has problems priniting if crest is null
    teams.forEach((team) => print("NAME - " + team["name"] /*+ " CREEST - " + team["crestUrl"] */ ));
    ///Make team objects and create them here make a factory for them?
  }
  
  Future<void> build_competition_standings(String competitionCode) async {
    //list to return list of maps
    List<Map<String,String>> standingsList;

    var resp = await fetch_competition_standings(competitionCode);
    print(resp);
    //get value for key standings, first element in array is all games, get arrayvalue from key table, each element is a position, useful keys - position, team - has map with name and crestUrl, points,
    List standings = resp["standings"];
    print(standings);
    Map<String, dynamic> totalSeason = standings[0];
    print("TOTAL SEASON - $totalSeason");

    List<dynamic> table = totalSeason["table"];
    print("TABLE - $table");
    table.forEach((position) => print(position["points"] ));


  }

  ///Need method to return
  

  ///TODO need list of all competitions too, perhaps return top level and build out objects ar start up? or just display for each screen so can refresh just whats needed for this
  ///So could have a method for populating each screen
  ///EG - Matches for favourite teams
}

