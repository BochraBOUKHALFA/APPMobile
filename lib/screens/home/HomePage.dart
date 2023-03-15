import 'package:flutter/material.dart';
import 'package:appmobile/ApiData/Data.dart';
import 'package:appmobile/ApiData/Response.dart';
import 'package:appmobile/services/ApiServiceProvider.dart';
import 'package:appmobile/screens/details/details_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: FutureBuilder<Response>(
            future: _apiServiceProvider.getData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Data> list = snapshot.data?.data ??
                    []; // use null-aware operators to handle null values
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
                            borderRadius: BorderRadius.circular(8.0)),
                        padding: const EdgeInsets.all(8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailsScreen(product: product),
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.name ?? "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  Text("${product.price} · ${product.color}",
                                      style:
                                          Theme.of(context).textTheme.caption),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icons.bookmark_border_rounded,
                                      Icons.share,
                                      Icons.more_vert
                                    ].map((e) {
                                      return InkWell(
                                        onTap: () {},
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 8.0),
                                          child: Icon(e, size: 16),
                                        ),
                                      );
                                    }).toList(),
                                  )
                                ],
                              )),
                              Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            "https://image.shutterstock.com/image-vector/coffee-machine-logo-design-260nw-621385727.jpg"),
                                      ))),
                            ],
                          ),
                        ),
                      );
                    });
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
