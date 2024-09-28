class Api {
  List<String>? _words;
  Api();

  Future<List<String>> search(String searchTerm) async {
    final searchWord = searchTerm.trim().toLowerCase();
    final cachedResult = _extractWordsUsingSearchTerm(searchTerm);
  }

  List<String>? _extractWordsUsingSearchTerm(String searchTerm) {}
}
