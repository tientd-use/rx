import 'package:flutter/material.dart';
import 'package:test_stream/bloc/search_bloc.dart';
import 'package:test_stream/service/user_service.dart';
import 'package:test_stream/view/search_result_view.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final SearchBloc _searchBloc;

  @override
  void initState() {
    _searchBloc = SearchBloc(searchService: SearchService());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            TextField(
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.black26),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding:
                      const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                  hintText: "Search word",
                  hintStyle: const TextStyle(fontSize: 20)),
              onChanged: _searchBloc.search.add,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SearchResultView(searchResults: _searchBloc.searchResults),
            ),
          ],
        ),
      ),
    );
  }
}
