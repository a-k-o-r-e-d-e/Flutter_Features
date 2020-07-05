import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutterfeaturesapp/ui/Utils/drawer_util.dart';
import 'package:http/http.dart' as http;

class ConnectivityTest extends StatefulWidget {
  @override
  _ConnectivityTestState createState() => _ConnectivityTestState();
}

class _ConnectivityTestState extends State<ConnectivityTest> {
  Connectivity _connectivity;
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _connectivity = Connectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged
        .listen((ConnectivityResult connectionStatus) {
      print(connectionStatus);
      if (connectionStatus == ConnectivityResult.mobile ||
          connectionStatus == ConnectivityResult.wifi) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future getData() async {
    http.Response response =
        await http.get("https://jsonplaceholder.typicode.com/posts/");
    if (response.statusCode == HttpStatus.ok) {
      var result = jsonDecode(response.body);
      return result;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Connectivity Test"),
      ),
      drawer: DrawerUtil(),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var myData = snapshot.data;
              return ListView.builder(
                  itemCount: myData.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(myData[index]['title']),
                        subtitle: Text(myData[index]['body']),
                      ));
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.network_check),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                    ),
                    CircularProgressIndicator(),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                    ),
                    Text("Please Wait while we get data from Api"),
                  ],
                ),
              );
            }
          }),
    );
  }
}
