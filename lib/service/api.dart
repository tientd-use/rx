import 'dart:convert';

import 'package:dio/dio.dart';

class Api {
  List<String>? _words;
  Api();

  Future<List<String>> search(String searchTerm) async {
    final searchWord = searchTerm.trim().toLowerCase();
    final cachedResult = _extractWordsUsingSearchTerm(searchTerm);
    if (cachedResult != null) {
      return cachedResult;
    }

    final words = await _getData(
        "https://dl.dropboxusercontent.com/s/s4xik49426frdl4/words.json?dl=0");

    _words = words;

    return _extractWordsUsingSearchTerm(searchWord) ?? [];
  }

  List<String>? _extractWordsUsingSearchTerm(String searchTerm) {
    final cachedWords = _words;
    if (cachedWords != null) {
      List<String> result = [];
      for (final worded in cachedWords) {
        if (worded.contains(searchTerm.trim().toLowerCase())) {
          result.add(worded);
        }
      }
      return result;
    } else {
      return null;
    }
  }

  Future<List<String>?> _getData(String url) async {
    final dio = Dio();
    final response = await dio.get(url);
    final data = jsonDecode(response.data)["names"];
    List<String>? names = data != null ? List<String>.from(data) : null;
    return names;
  }
}
