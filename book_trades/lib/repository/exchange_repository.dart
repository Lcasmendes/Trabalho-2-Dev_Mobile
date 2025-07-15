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
      throw Exception('Network error or failed to load exchanges: $e');
    }
  }

  Future<Exchange> addExchange(Exchange exchange) async {
    try {
      final response = await _dio.post(
        '/trocas',
        data: exchange.toJson(),
      );

      if (response.statusCode == 201) {
        return Exchange.fromJson(response.data);
      } else {
        throw Exception('Failed to add exchange: ${response.statusCode} - ${response.data}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('Failed to add exchange: ${e.response!.statusCode} - ${e.response!.data}');
      } else {
        throw Exception('Network error or failed to add exchange: $e');
      }
    } catch (e) {
      throw Exception('Unexpected error adding exchange: $e');
    }
  }

  Future<void> updateExchange(Exchange exchange) async {
    try {
      if (exchange.id == null) {
        throw Exception('Exchange primary ID (JSON Server ID) is required to update an exchange.');
      }

      final response = await _dio.patch(
        '/trocas/${exchange.id}',
        data: exchange.toJson(),
      );

      if (response.statusCode == 200) {
        return;
      } else {
        throw Exception('Failed to update exchange (PATCH): ${response.statusCode} - ${response.data}');
      }
    } on DioException catch (e) {
      if (e.response != null) {
        print('Backend Error Response for PATCH: ${e.response!.data}');
        print('Backend Error Status Code for PATCH: ${e.response!.statusCode}');
        throw Exception('Failed to update exchange (PATCH): ${e.response!.statusCode} - ${e.response!.data}');
      } else {
        throw Exception('Network error or failed to update exchange: $e');
      }
    } catch (e) {
      throw Exception('Unexpected error updating exchange: $e');
    }
  }
}