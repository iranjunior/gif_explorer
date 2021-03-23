import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, { void Function(String) onSubmitted }) {
  return AppBar(
    title: Image.network(
        'https://developers.giphy.com/branch/master/static/header-logo-8974b8ae658f704a5b48a2d039b8ad93.gif'),
    backgroundColor: Colors.black12,
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(80.0),
      child: TextField(
        autofocus: false,
        onSubmitted: onSubmitted,
        style: TextStyle(color: Theme.of(context).primaryColor),
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Pesquisar',
            labelStyle: TextStyle(
                fontSize: 24.0, color: Theme.of(context).primaryColor),
            prefixIcon: Icon(Icons.search, color: Colors.pink)),
      ),
    ),
  );
}
