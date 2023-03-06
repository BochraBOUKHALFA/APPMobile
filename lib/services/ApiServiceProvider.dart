import 'dart:convert' show json;
import 'dart:io';
import 'dart:math';

import 'package:path_provider/path_provider.dart';
import 'package:appmobile/ApiData/Response.dart';
import 'package:http/http.dart' as https;


class ApiServiceProvider {
  String url = "https://api-revendeurs-wyqn.onrender.com/productsheader";

  Future<Response> getData() async {
    String fileName = "userdata.json";
    
    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + "/" + fileName);
    if (file.existsSync()) {
      print("Loading from cache");
      var jsonData = file.readAsStringSync();
      Response response = Response.fromJson(json.decode(jsonData));
      return response;
    } else {
    try {
      print("Loading from API");
      var response = await https.get(Uri.parse(url));
      print('juba');
      if (response.statusCode == 200) {
        var jsonResponse = response.body;
        Response res = Response.fromJson(json.decode(jsonResponse));
        //save json in local file
        file.writeAsStringSync(jsonResponse, flush: true, mode: FileMode.write);
        return res;
      } 
      else {
      return Future.error("Failed to load data");
      }
    }
  catch (e) {
      throw Exception('Probleme data : $e');
    }
  }
}
}
//   Future<Response> getData() async {
//     var data = {
//   "data": [
//     {
//       "color": "red", 
//       "description": "The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J", 
//       "name": "Rex Bailey", 
//       "price": "659.00"
//     }, 
//     {
//       "color": "white", 
//       "description": "Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals", 
//       "name": "Israel Dooley", 
//       "price": "663.00"
//     }, 
//     {
//       "color": "indigo", 
//       "description": "The Nagasaki Lander is the trademarked name of several series of Nagasaki sport bikes, that started with the 1984 ABC800J", 
//       "name": "Jan Boehm", 
//       "price": "80.00"
//     }, 
//     {
//       "color": "cyan", 
//       "description": "The automobile layout consists of a front-engine design, with transaxle-type transmissions mounted at the rear of the engine and four wheel drive", 
//       "name": "Leroy Skiles", 
//       "price": "921.00"
//     }, 
//     {
//       "color": "violet", 
//       "description": "Andy shoes are designed to keeping in mind durability as well as trends, the most stylish range of shoes & sandals", 
//       "name": "Jacquelyn Hyatt", 
//       "price": "662.00"
//     }
//   ], 
//   "test": "test"
// };
//     return Response.fromJson(data);
//   }

