import 'package:http/http.dart' as http ;
import 'R_connection.dart';
import 'dart:convert';
import 'dart:io';

class API_communicator {
  ///Returns Json from API as String, dynamic map
  Future<Map <String, dynamic>> fetch_response() async {
    final response =  await http.get(R_connection.BASE + "competitions/BL1/teams", headers: {
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

  Future<void> build_teams() async {
    var resp = await fetch_response();

    List teams = resp["teams"];

    teams.forEach((team) => print(team["name"]));
    ///Make team objects and create them here make a factory for them?

//    resp.forEach((key, value) {
//      print("DEBUG KEY" + key);
//      print(value);

//      print(teams);
//    }
//    );
  }
}

