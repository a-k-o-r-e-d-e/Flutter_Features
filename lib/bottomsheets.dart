import 'package:flutter/material.dart';

class BottomSheets extends StatefulWidget {
  @override
  _BottomSheetsState createState() => _BottomSheetsState();
}

class _BottomSheetsState extends State<BottomSheets> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  VoidCallback _showPersistBottomSheetCallback;

  @override
  void initState() {
    super.initState();
    _showPersistBottomSheetCallback = _showBottomSheet;
  }

  void _showBottomSheet() {
    setState(() {
      _showPersistBottomSheetCallback = null;
    });
    _scaffoldKey.currentState
        .showBottomSheet((context) {
          return Container(
            color: Colors.green,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Center(
                  child: Text("Hi Bottomsheet"),
                ),
              ],
            ),
          );
        })
        .closed
        .whenComplete(() {
          if (mounted) {
            setState(() {
              _showPersistBottomSheetCallback = _showBottomSheet;
            });
          }
        });
  }

  void _showModalSheet() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Container(
//            height: 50.0,
            color: Colors.greenAccent,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                Center(
                  child: Text("Hi BottomSheet"),
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Flutter BottomSheet"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: _showPersistBottomSheetCallback,
                child: Text("Persistent"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
              ),
              RaisedButton(
                onPressed: _showModalSheet,
                child: Text("Modal"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
