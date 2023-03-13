import 'package:appmobile/screens/details/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:appmobile/constants.dart';
import 'package:appmobile/ApiData/Data.dart';
import 'package:appmobile/ApiData/Response.dart';
import 'package:appmobile/services/ApiServiceProvider.dart';
import 'package:appmobile/screens/home/home_screen.dart';

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
        title: Text("Liste des produits"),
        backgroundColor: kPrimaryColor,
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: FutureBuilder<Response>(
            future: _apiServiceProvider.getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data> list = snapshot.data?.data ?? [];
                return ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    Data? product = list[index];
                    return Container(
                      height: 136,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFFE0E0E0)),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              detailsScreen()),
                                    );
                                  },
                                  child: Text(
                                    product.name ?? "",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              detailsScreen()),
                                    );
                                  },
                                  child: Text(
                                    product.description ?? "",
                                    style: Theme.of(context).textTheme.caption,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => detailsScreen()),
                              );
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                    "https://image.shutterstock.com/image-vector/coffee-machine-logo-design-260nw-621385727.jpg" ??
                                        "",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
