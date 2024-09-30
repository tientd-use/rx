import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:test_stream/bloc/search_event.dart';
import 'package:test_stream/service/user_service.dart';

@immutable
class SearchBloc {
  final Sink<String> search;
  final Stream<SearchEvent?> searchResults;

  const SearchBloc._({
    required this.search,
    required this.searchResults,
  });

  void dispose() {
    search.close();
  }

  factory SearchBloc({required SearchService searchService}) {
    final textChanges = BehaviorSubject<String>();
    final result = textChanges
        .distinct()
        .debounceTime(const Duration(milliseconds: 300))
        .switchMap<SearchEvent?>((String searchTerm) {
      if (searchTerm.isEmpty) {
        return Stream<SearchEvent?>.value(null);
      } else {
        return Rx.fromCallable(() => searchService.searchWords(searchTerm))
            .delay(const Duration(seconds: 1))
            .map((words) => words.isEmpty
                ? SearchLoadedWithEmptyListEvent()
                : SearchLoadedSuccessEvent(words))
            .startWith(SearchLoadingEvent())
            .onErrorReturnWith((error, _) => SearchLoadErrEvent(error));
      }
    });

    return SearchBloc._(
      search: textChanges.sink,
      searchResults: result,
    );
  }
}
