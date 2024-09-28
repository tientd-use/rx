import 'package:flutter/cupertino.dart';

@immutable
abstract class SearchEvent {
  const SearchEvent();
}

@immutable
class SearchLoadingEvent implements SearchEvent {
  const SearchLoadingEvent();
}

@immutable
class SearchLoadErrEvent implements SearchEvent {
  final Object? error;
  const SearchLoadErrEvent(this.error);
}

@immutable
class SearchLoadedSuccessEvent implements SearchEvent {
  final List<String> listNames;
  const SearchLoadedSuccessEvent(this.listNames);
}

@immutable
class SearchLoadedWithEmptyListEvent implements SearchEvent {
  const SearchLoadedWithEmptyListEvent();
}
