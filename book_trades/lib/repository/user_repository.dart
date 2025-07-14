import 'package:dio/dio.dart';
import 'package:projeto2/repository/response_data.dart';

class UserRepository {
  static const _BASE_URL = "http://10.0.2.2:3000";
  static const _TO_TEST_URL = "http://localhost:3000";

  late final Dio _dio;

  UserRepository([bool test = false]) {
    if (test) {
      _dio = Dio(BaseOptions(baseUrl: _TO_TEST_URL));
    } else {
      _dio = Dio(BaseOptions(baseUrl: _BASE_URL));
    }
  }

  Future<(String, String, String)> login(
    String username,
    String password,
  ) async {
    try {
      // Query params para filtrar no JSON Server por email e password
      final response = await _dio.get(
        '/users',
        queryParameters: {'email': username, 'password': password},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> dataList = response.data;

        if (dataList.isNotEmpty) {
          // Pega o primeiro usuário que bateu com o filtro
          final responseData = ResponseData.fromJson(dataList[0]);
          return ('success', responseData.id, responseData.username);
        } else {
          // Nenhum usuário encontrado com email+senha
          return ('failed', "", "");
        }
      } else {
        throw Exception('failed status code');
      }
    } catch (e) {
      print("error $e");
      return ('failed_connection', "", "");
    }
  }

  /*
  Future<String> login(String username, String password) async {

    await Future.delayed(const Duration(seconds: 2));

    if (!['user1', 'user2'].contains(username)) {
      return 'wrong_username';
    } else if (username == 'user1' && password != '123') {
      return 'wrong_password';
    } else if (username == 'user1' && password == '123') {
      return 'success';
    } else {
      return 'failed_connection';
    }
  }
  */
}
