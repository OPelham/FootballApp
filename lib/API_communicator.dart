import 'package:http/http.dart' as http ;
import 'R_connection.dart';
import 'dart:convert';
import 'dart:io';

class API_communicator {
  ///Returns Json from API as String, dynamic map
  Future<Map <String, dynamic>> fetch_response() async {
    print("DEBUG making API_communicator");
    final response =  await http.get(R_connection.BASE + "competitions/BL1/matches", headers: {
      "X-Auth-Token": "b6206f49f10942df9e7ec04470cfb1ef"
    });

    ///if connected return the json decoded into map
    if (response.statusCode == 200) {
      print("DEBUG JSON to print" + response.body);
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load post');
    }


  }
}

