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
              List<Data> list = snapshot.data?.data ??
                  []; // use null-aware operators to handle null values
              return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    Data? product = list[index];
                    return ListTile(
                      title: Text(product.name ?? ""),
                      subtitle: Text(product.description ?? ""),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://image.shutterstock.com/image-vector/coffee-machine-logo-design-260nw-621385727.jpg" ??
                                ""),
                      ),
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
