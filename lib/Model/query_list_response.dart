import 'Query.dart';

class QueryListResponse {
  bool? status;
  List<query>? queries;

  QueryListResponse.fromJson(json) {
    status = json['status'] ?? false;
    queries = json['data'] == null
        ? []
        : (json['data'] as List).map((e) => query.fromJson(e)).toList();
  }

  QueryListResponse.withError() {
    status = false;
  }
}
