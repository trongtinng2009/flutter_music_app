import 'package:http/http.dart';

abstract class DataConverter {
  dynamic convertSingleData(Map<String, dynamic> item);
  Future<List<dynamic>> convertListData(Future<Response> response);
}
