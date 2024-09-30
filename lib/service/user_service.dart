import 'api.dart';

class SearchService {
  late final Api api = Api();
  Future<List<String>> searchWords(String searchTerm) {
    return api.search(searchTerm);
  }
}
