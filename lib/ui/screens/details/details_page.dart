import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class DetailsPage extends StatelessWidget {
  final Map<dynamic, dynamic> gif;
  DetailsPage({@required this.gif});

  @override
  Widget build(BuildContext context) {
    print(this.gif);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          gif['title']
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.share, color: Theme.of(context).primaryColor, size: 32),
              onPressed: () => Share.share(gif['url']),
            ),
          )
        ],
      ),
      body: Center(
          child: CachedNetworkImage(
            placeholder: (context, url) => SizedBox(
              height: 200,
              width: 200,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
              ),
            ),
            imageUrl: gif['url'],
          ),
        ),
    );
  }
}
