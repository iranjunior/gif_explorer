import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gif_explorer/ui/screens/details/details_page.dart';
import 'package:share/share.dart';

GridView buidBody(
    BuildContext context, List<dynamic> gifs, Function nextGroup) {
  return GridView(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      childAspectRatio: 1,
      crossAxisSpacing: 4.0,
      mainAxisSpacing: 8.0,
    ),
    padding: EdgeInsets.symmetric(vertical: 16.0),
    children: List.generate(gifs.length, (index) {
      return GestureDetector(
        onLongPress: () => {
          Share.share(gifs[index]['url'])
        },
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    DetailsPage(gif: gifs[index]))),
        child: CachedNetworkImage(
            fit: BoxFit.cover,
            placeholder: (context, url) => SizedBox(
                  height: 20,
                  width: 20,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: Colors.grey),
                  ),
                ),
            imageUrl: gifs[index]['url']),
      );
    })
      ..add(GestureDetector(
        onTap: nextGroup,
        child: Container(
          height: 30,
          width: 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add),
              Text(
                'Carregar Mais',
                style: TextStyle(color: Colors.pink),
              )
            ],
          ),
        ),
      )),
  );
}
