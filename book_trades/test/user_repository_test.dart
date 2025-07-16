import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:projeto2/repository/user_repository.dart';
import 'exchange_repository_test.mocks.dart';
@GenerateMocks([Dio])

void main() {
  group('UserRepository', () {
    late MockDio mockDio;
    late UserRepository userRepository;

    setUp(() {
      mockDio = MockDio();
      userRepository = UserRepository();
      userRepository.dioClient = mockDio;
    });

    test('login retorna "success" e ID do usuário para credenciais válidas (status 200)', () async {
      final mockResponseData = [
        {
          'id': 1,
          'username': 'testuser',
          'email': 'test@example.com',
          'password': 'password123'
        },
      ];

      when(mockDio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer(
            (_) async => Response(
          requestOptions: RequestOptions(path: '/users'),
          data: mockResponseData,
          statusCode: 200,
        ),
      );

      final result = await userRepository.login('test@example.com', 'password123');

      verify(mockDio.get(
        '/users',
        queryParameters: {'email': 'test@example.com', 'password': 'password123'},
      )).called(1);

      expect(result.$1, 'success');
      expect(result.$2, '1');
    });

    test('login retorna "success" e ID do usuário para credenciais válidas (status 201)', () async {
      final mockResponseData = [
        {
          'id': 2,
          'username': 'newuser',
          'email': 'newuser@example.com',
          'password': 'newpassword'
        },
      ];

      when(mockDio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer(
            (_) async => Response(
          requestOptions: RequestOptions(path: '/users'),
          data: mockResponseData,
          statusCode: 201,
        ),
      );

      final result = await userRepository.login('newuser@example.com', 'newpassword');

      verify(mockDio.get(
        '/users',
        queryParameters: {'email': 'newuser@example.com', 'password': 'newpassword'},
      )).called(1);

      expect(result.$1, 'success');
      expect(result.$2, '2');
    });

    test('login retorna "failed" para credenciais inválidas (lista vazia)', () async {
      final mockResponseData = [];

      when(mockDio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenAnswer(
            (_) async => Response(
          requestOptions: RequestOptions(path: '/users'),
          data: mockResponseData,
          statusCode: 200,
        ),
      );

      final result = await userRepository.login('invalid@example.com', 'wrongpass');

      verify(mockDio.get(
        '/users',
        queryParameters: {'email': 'invalid@example.com', 'password': 'wrongpass'},
      )).called(1);

      expect(result.$1, 'failed');
      expect(result.$2, "");
    });

    test('login retorna "failed_connection" em caso de erro de rede (DioException)', () async {
      when(mockDio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/users'),
          error: 'Connection refused',
          type: DioExceptionType.connectionError,
        ),
      );

      final result = await userRepository.login('any@example.com', 'anypass');

      expect(result.$1, 'failed_connection');
      expect(result.$2, "");
    });

    test('login retorna "failed_connection" em caso de erro desconhecido', () async {
      when(mockDio.get(
        any,
        queryParameters: anyNamed('queryParameters'),
      )).thenThrow(
        Exception('Something went wrong'),
      );

      final result = await userRepository.login('any@example.com', 'anypass');

      expect(result.$1, 'failed_connection');
      expect(result.$2, "");
    });
  });
}