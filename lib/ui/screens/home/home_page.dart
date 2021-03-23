import 'package:flutter/material.dart';
import 'package:gif_explorer/service/git_api.dart';
import 'package:gif_explorer/ui/screens/home/widget/body.dart';
import 'package:gif_explorer/ui/screens/home/widget/appBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _api = GitApi();
  List<dynamic> results = [];

  @override
  void initState() {
    _api.getTrending().then((value) => {
          setState(() {
            results = value;
          })
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, onSubmitted: _onSubmitted),
      body: buidBody(context, results, _onRefresh),
    );
  }

  void _onRefresh() {
    _api.nextGroup().then((value) => {
          setState(() {
            results = value;
          })
        });
  }

  void _onSubmitted(String text) {
    if (text.isEmpty) {
      _api.getTrending().then((value) => setState(() {
            results = value;
          }));
    } else {
      _api.search(text).then((value) => {
            setState(() {
              results = value;
            })
          });
    }
  }
}
