import 'dart:convert';

import 'package:gif_explorer/constants/api.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class GitApi {
  int limit = 25;
  String searchText = '';
  Future<List> getTrending() async {
    searchText = '';
    final uri = Uri.https('api.giphy.com', '/v1/gifs/trending', {
      'rating': 'g',
      'limit': limit.toString(),
      'api_key': ACCES_KEY,
    });
    http.Response response = await http.get(uri);
    List<Map<dynamic, dynamic>> results = [];

    jsonDecode(response.body)['data'].map((gifResponse) {
      final map = Map.from({
        'title': gifResponse['title'],
        'url': gifResponse['images']['fixed_width']['url'],
      });
      map['details'] = Map.from({
        'title': gifResponse['title'],
        'url': gifResponse['images']['downsized_large']['url'],
      });
      results.add(map);
    }).toList();

    return results;
  }

  Future<List> search(String text) async {
    searchText = text;
    final uri = Uri.https('api.giphy.com', '/v1/gifs/search', {
      'rating': 'g',
      'lang': 'en',
      'q': searchText,
      'limit': limit.toString(),
      'offset': '0',
      'api_key': ACCES_KEY,
    });
    http.Response response = await http.get(uri);
    List<Map<dynamic, dynamic>> results = [];

    jsonDecode(response.body)['data'].map((gifResponse) {
      final map = Map.from({
        'title': gifResponse['title'],
        'url': gifResponse['images']['fixed_width']['url'],
      });
      map['details'] = Map.from({
        'title': gifResponse['title'],
        'url': gifResponse['images']['downsized_large']['url'],
      });
      results.add(map);
    }).toList();

    return results;
  }

  Future<List> nextGroup() async {
    if (searchText.isEmpty) {
      limit += 25;
      return await getTrending();
    } else {
      limit += 25;
      return await search(searchText);
    }
  }
}
