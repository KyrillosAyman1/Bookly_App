import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = "https://www.googleapis.com/books/v1/";
  String _apiKey = "AIzaSyC41Q0jtqpgo9tCcS-u-0aMO-ULFmvstNY";
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endpoint}) async {
    var response = await _dio.get("$_baseUrl$endpoint&key=$_apiKey");
    return response.data;
  }
}
