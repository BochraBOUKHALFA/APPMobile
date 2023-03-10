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
        if (response.statusCode == 200) {
          var jsonResponse = response.body;
          Response res = Response.fromJson(json.decode(jsonResponse));
          //save json in local file
          file.writeAsStringSync(jsonResponse,
              flush: false, mode: FileMode.write);
          return res;
        } else {
          return Future.error("Failed to load data");
        }
      } catch (e) {
        throw Exception('Probleme data : $e');
      }
    }
  }
}
