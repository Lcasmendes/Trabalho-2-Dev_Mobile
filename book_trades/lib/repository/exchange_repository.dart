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
        throw Exception('Failed to load exchanges: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching exchanges: $e');
      throw Exception('Network error or failed to load exchanges: $e');
    }
  }

  Future<Exchange> addExchange(Exchange exchange) async {
    try {
      final response = await _dio.post(
        '/trocas', // Endpoint para adicionar trocas
        data: exchange.toJson(), // Dio serializa o Map para JSON automaticamente
      );

      if (response.statusCode == 201) {
        return Exchange.fromJson(response.data);
      } else {
        throw Exception('Failed to add exchange: ${response.statusCode} - ${response.data}');
      }
    } on DioException catch (e) {
      print('Error adding exchange: $e');
      if (e.response != null) {
        throw Exception('Failed to add exchange: ${e.response!.statusCode} - ${e.response!.data}');
      } else {
        throw Exception('Network error or failed to add exchange: $e');
      }
    } catch (e) {
      print('Unexpected error adding exchange: $e');
      throw Exception('Unexpected error adding exchange: $e');
    }
  }
}