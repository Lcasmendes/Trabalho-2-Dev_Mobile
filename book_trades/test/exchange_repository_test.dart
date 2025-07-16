import 'package:flutter_test/flutter_test.dart';
import 'package:dio/dio.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:projeto2/repository/exchange_data.dart';
import 'package:projeto2/repository/offering_data.dart';
import 'package:projeto2/repository/exchange_repository.dart';

@GenerateMocks([Dio])
import 'exchange_repository_test.mocks.dart';

void main() {
  group('ExchangeRepository', () {
    late MockDio mockDio;
    late ExchangeRepository repository;

    setUp(() {
      mockDio = MockDio();
      repository = ExchangeRepository(dioClient: mockDio);
    });

    // Testes para getAllExchanges
    test('getAllExchanges retorna uma lista de trocas em caso de sucesso (status 200)', () async {
      final mockResponseData = [
        {
          'exchange_id': 1,
          'solicitor_id': 101,
          'book_name': 'Aventuras em Flutter',
          'book_state': 'Novo',
          'searching_for': 'Um bom livro de Dart',
          'sugested': 'Nenhum',
          'id': 'abc-123',
          'offerings': [
            {'userId': 201, 'book': 'Flutter Avançado', 'book_state': 'Usado'}
          ],
        },
        {
          'exchange_id': 2,
          'solicitor_id': 102,
          'book_name': 'Receitas Mágicas',
          'book_state': 'Usado',
          'searching_for': 'Livro de culinária italiana',
          'sugested': 'Nenhum',
          'id': 'def-456',
          'offerings': [], // Exemplo com offerings vazios
        },
      ];

      when(mockDio.get(any)).thenAnswer(
            (_) async => Response(
          requestOptions: RequestOptions(path: '/trocas'),
          data: mockResponseData,
          statusCode: 200,
        ),
      );

      final result = await repository.getAllExchanges();

      verify(mockDio.get('/trocas')).called(1);
      expect(result, isA<List<Exchange>>());
      expect(result.length, 2);
      expect(result[0].bookName, 'Aventuras em Flutter');
      expect(result[0].id, 'abc-123');
      expect(result[0].offerings.length, 1);
      expect(result[0].offerings[0].book, 'Flutter Avançado');
      expect(result[0].offerings[0].userId, 201);

      expect(result[1].bookName, 'Receitas Mágicas');
      expect(result[1].offerings, isEmpty);
    });

    test('getAllExchanges lança exceção em caso de falha de API (status não 200)', () async {
      when(mockDio.get(any)).thenAnswer(
            (_) async => Response(
          requestOptions: RequestOptions(path: '/trocas'),
          data: 'Not Found',
          statusCode: 404,
        ),
      );

      expect(() => repository.getAllExchanges(), throwsA(isA<Exception>()));
      await expectLater(
        repository.getAllExchanges(),
        throwsA(
          predicate((e) => e is Exception && e.toString().contains('Failed to load exchanges: 404')),
        ),
      );
    });

    test('getAllExchanges lança exceção em caso de erro de rede ou DioException', () async {
      when(mockDio.get(any)).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/trocas'),
          error: 'Connection refused',
          type: DioExceptionType.connectionError,
        ),
      );

      expect(() => repository.getAllExchanges(), throwsA(isA<Exception>()));
      await expectLater(
        repository.getAllExchanges(),
        throwsA(
          predicate((e) => e is Exception && e.toString().contains('Network error or failed to load exchanges:')),
        ),
      );
    });

    // --- Testes para addExchange ---
    test('addExchange retorna a troca adicionada em caso de sucesso (status 201)', () async {
      final newExchange = Exchange(
        solicitorId: 103,
        bookName: 'Meu Novo Livro',
        bookState: 'Novo',
        searchingFor: 'Qualquer coisa',
        sugested: 'Sugestão',
        offerings: [
          Offering(userId: 202, book: 'Ofereço este', bookState: 'Bom')
        ],
      );
      final mockResponseData = {
        'exchange_id': 3,
        'solicitor_id': 103,
        'book_name': 'Meu Novo Livro',
        'book_state': 'Novo',
        'searching_for': 'Qualquer coisa',
        'sugested': 'Sugestão',
        'id': 'ghi-789',
        'offerings': [
          {'userId': 202, 'book': 'Ofereço este', 'book_state': 'Bom'}
        ],
      };

      when(mockDio.post(
        any,
        data: anyNamed('data'),
      )).thenAnswer(
            (_) async => Response(
          requestOptions: RequestOptions(path: '/trocas'),
          data: mockResponseData,
          statusCode: 201,
        ),
      );

      final result = await repository.addExchange(newExchange);

      verify(mockDio.post('/trocas', data: newExchange.toJson())).called(1);
      expect(result, isA<Exchange>());
      expect(result.id, 'ghi-789');
      expect(result.bookName, 'Meu Novo Livro');
      expect(result.offerings.length, 1);
      expect(result.offerings[0].book, 'Ofereço este');
      expect(result.offerings[0].userId, 202);
    });

    test('addExchange lança exceção em caso de falha de API (status não 201)', () async {
      final newExchange = Exchange(
        solicitorId: 104,
        bookName: 'Falha',
        bookState: 'Ruim',
        searchingFor: 'Nada',
        sugested: 'Não',
        offerings: [],
      );
      when(mockDio.post(
        any,
        data: anyNamed('data'),
      )).thenAnswer(
            (_) async => Response(
          requestOptions: RequestOptions(path: '/trocas'),
          data: 'Bad Request',
          statusCode: 400,
        ),
      );

      expect(() => repository.addExchange(newExchange), throwsA(isA<Exception>()));
      await expectLater(
        repository.addExchange(newExchange),
        throwsA(
          predicate((e) => e is Exception && e.toString().contains('Failed to add exchange: 400')),
        ),
      );
    });

    test('addExchange lança exceção em caso de DioException (rede ou outro)', () async {
      final newExchange = Exchange(
        solicitorId: 105,
        bookName: 'Erro',
        bookState: 'Duvidoso',
        searchingFor: 'Qualquer',
        sugested: 'Talvez',
        offerings: [],
      );
      when(mockDio.post(
        any,
        data: anyNamed('data'),
      )).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/trocas'),
          error: 'Timeout',
          type: DioExceptionType.connectionTimeout,
        ),
      );

      expect(() => repository.addExchange(newExchange), throwsA(isA<Exception>()));
      await expectLater(
        repository.addExchange(newExchange),
        throwsA(
          predicate((e) => e is Exception && e.toString().contains('Network error or failed to add exchange:')),
        ),
      );
    });

    // --- Testes para updateExchange ---
    test('updateExchange conclui com sucesso em caso de sucesso (status 200)', () async {
      final updatedExchange = Exchange(
        exchangeId: 1,
        solicitorId: 101,
        bookName: 'Aventuras em Flutter (Atualizado)',
        bookState: 'Excelente',
        searchingFor: 'Nada',
        sugested: 'Sugestão 2',
        id: 'abc-123',
        offerings: [
          Offering(userId: 201, book: 'Flutter Avançado', bookState: 'Novo')
        ],
      );

      when(mockDio.patch(
        any,
        data: anyNamed('data'),
      )).thenAnswer(
            (_) async => Response(
          requestOptions: RequestOptions(path: '/trocas/abc-123'),
          data: updatedExchange.toJson(),
          statusCode: 200,
        ),
      );

      await repository.updateExchange(updatedExchange);

      verify(mockDio.patch('/trocas/abc-123', data: updatedExchange.toJson())).called(1);
    });

    test('updateExchange lança exceção se o ID do servidor for nulo ou vazio', () async {
      final exchangeWithoutId = Exchange(
        solicitorId: 1,
        bookName: 'Livro sem ID',
        bookState: 'Ruim',
        searchingFor: 'X',
        sugested: 'Y',
        offerings: [],
      );
      final exchangeWithEmptyId = Exchange(
        id: '', // ID vazio
        solicitorId: 1,
        bookName: 'Livro com ID vazio',
        bookState: 'Ruim',
        searchingFor: 'X',
        sugested: 'Y',
        offerings: [],
      );

      expect(() => repository.updateExchange(exchangeWithoutId), throwsA(isA<Exception>()));
      expect(() => repository.updateExchange(exchangeWithEmptyId), throwsA(isA<Exception>()));

      await expectLater(
        repository.updateExchange(exchangeWithoutId),
        throwsA(
          predicate((e) => e is Exception && e.toString().contains('ID (JSON Server ID) is required')),
        ),
      );
    });

    test('updateExchange lança exceção em caso de falha de API (status não 200)', () async {
      final updatedExchange = Exchange(
        exchangeId: 1,
        solicitorId: 101,
        bookName: 'Falha na Atualização',
        bookState: 'Bom',
        searchingFor: 'Nada',
        sugested: 'Nenhuma',
        id: 'abc-123',
        offerings: [],
      );
      when(mockDio.patch(
        any,
        data: anyNamed('data'),
      )).thenAnswer(
            (_) async => Response(
          requestOptions: RequestOptions(path: '/trocas/abc-123'),
          data: 'Unauthorized',
          statusCode: 401,
        ),
      );

      expect(() => repository.updateExchange(updatedExchange), throwsA(isA<Exception>()));
      await expectLater(
        repository.updateExchange(updatedExchange),
        throwsA(
          predicate((e) => e is Exception && e.toString().contains('Failed to update exchange (PATCH): 401')),
        ),
      );
    });

    test('updateExchange lança exceção em caso de DioException (rede ou outro)', () async {
      final updatedExchange = Exchange(
        exchangeId: 1,
        solicitorId: 101,
        bookName: 'Erro de Rede',
        bookState: 'Bom',
        searchingFor: 'Nada',
        sugested: 'Nenhuma',
        id: 'abc-123',
        offerings: [],
      );
      when(mockDio.patch(
        any,
        data: anyNamed('data'),
      )).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: '/trocas/abc-123'),
          error: 'Host lookup failed',
          type: DioExceptionType.unknown,
        ),
      );

      expect(() => repository.updateExchange(updatedExchange), throwsA(isA<Exception>()));
      await expectLater(
        repository.updateExchange(updatedExchange),
        throwsA(
          predicate((e) => e is Exception && e.toString().contains('Network error or failed to update exchange:')),
        ),
      );
    });
  });
}