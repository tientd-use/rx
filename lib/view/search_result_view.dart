import 'package:flutter/material.dart';
import 'package:test_stream/bloc/search_event.dart';

class SearchResultView extends StatelessWidget {
  final Stream<SearchEvent?> searchResults;

  const SearchResultView({required this.searchResults});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: searchResults,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final result = snapshot.data;

            if (result is SearchLoadingEvent) {
              print('Loading');
              return const Center(child: CircularProgressIndicator());
            } else if (result is SearchLoadErrEvent) {
              return const Center(child: Text('Error'));
            } else if (result is SearchLoadedWithEmptyListEvent) {
              return const Center(child: Text('No results'));
            } else if (result is SearchLoadedSuccessEvent) {
              final _listNames = result.listNames;
              return ListView.builder(
                itemCount: _listNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(
                      _listNames[index],
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text("Unknown State"));
            }
          } else {
            return const Center(child: Text("No data"));
          }
        });
  }
}
