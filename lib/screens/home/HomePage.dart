import 'package:flutter/material.dart';
import 'package:appmobile/ApiData/Data.dart';
import 'package:appmobile/ApiData/Response.dart';
import 'package:appmobile/services/ApiServiceProvider.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiServiceProvider _apiServiceProvider = new ApiServiceProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Products List"),
        ),
        body: FutureBuilder<Response>(
          future: _apiServiceProvider.getData(),
          builder: (context, snapshot) {
            
            if (snapshot.hasData) {
              List<Data> list = snapshot.data?.data ?? []; // use null-aware operators to handle null values
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    Data? user = list[index]; // mark user as nullable
                    print(user);
                    return ListTile(
                      title: Text(user.name ?? ""), // use null-aware operators to handle null values
                      subtitle: Text(user.description ?? ""), // use null-aware operators to handle null values
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(user.color ?? ""), // use null-aware operators to handle null values
                      ),
                    );
                  });
            } else {
              //return Center(child: CircularProgressIndicator());
              return Text('ligne 42');
            }
          },
        ));
  }
}
