import 'package:dio/dio.dart';
import 'exchange_data.dart';

class ExchangeRepository {
  static const _BASE_URL = "http://10.0.2.2:3000";
  late final Dio _dio;

  ExchangeRepository() {
    _dio = Dio(BaseOptions(baseUrl: _BASE_URL));
  }

  Future<List<Exchange>> getAllExchanges() async {
    try {
      final response = await _dio.get('/trocas');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Exchange.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load exchanges');
      }
    } catch (e) {
      print('Error fetching exchanges: $e');
      return [];
    }
  }
}
