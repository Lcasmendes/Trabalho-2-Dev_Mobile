import 'package:dio/dio.dart';
import 'package:projeto2/repository/response_data.dart';

class UserRepository {
  static const _BASE_URL = "http://10.0.2.2:3000";

  late Dio _dio;

  UserRepository() {
    _dio = Dio(BaseOptions(baseUrl: _BASE_URL));
  }

  set dioClient(Dio client) {
    _dio = client;
  }

  Future<(String, String)> login(
      String username,
      String password,
      ) async {
    try {
      final response = await _dio.get(
        '/users',
        queryParameters: {'email': username, 'password': password},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> dataList = response.data;

        if (dataList.isNotEmpty) {
          final responseData = ResponseData.fromJson(dataList[0]);
          return ('success', responseData.id);
        } else {
          return ('failed', "");
        }
      } else {
        throw Exception('Login failed with status code: ${response.statusCode}');
      }
    } on DioException catch (e) {
      print("Dio error: ${e.response?.statusCode} - ${e.message}");
      return ('failed_connection', "");
    } catch (e) {
      print("Unexpected error: $e");
      return ('failed_connection', "");
    }
  }
}