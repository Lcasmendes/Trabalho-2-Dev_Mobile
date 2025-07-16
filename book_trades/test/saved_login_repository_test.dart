// test/saved_login_repository_test.dart

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:projeto2/repository/floor/login_try.dart';
import 'package:projeto2/repository/floor/login_try_dao.dart';
import 'package:projeto2/repository/login_try_repository.dart';

@GenerateMocks([SavedLoginDao])
import 'saved_login_repository_test.mocks.dart';

void main() {
  group('SavedLoginRepository', () {
    late SavedLoginDao mockSavedLoginDao;
    late SavedLoginRepository repository;

    setUp(() {
      mockSavedLoginDao = MockSavedLoginDao() as SavedLoginDao;
      repository = SavedLoginRepository(mockSavedLoginDao);
    });

    test('insert chama o método insert do DAO', () async {
      final savedLogin = SavedLogin(id: 'user1', email: 'test@example.com');
      when(mockSavedLoginDao.insert(savedLogin)).thenAnswer((_) async => Future.value());

      await repository.insert(savedLogin);

      verify(mockSavedLoginDao.insert(savedLogin)).called(1);
    });

    test('getAll retorna todos os SavedLogins do DAO', () async {
      final expectedLogins = [
        SavedLogin(id: 'user1', email: 'test1@example.com'),
        SavedLogin(id: 'user2', email: 'test2@example.com'),
      ];
      when(mockSavedLoginDao.getAll()).thenAnswer((_) async => expectedLogins);

      final result = await repository.getAll();

      verify(mockSavedLoginDao.getAll()).called(1);
      expect(result, equals(expectedLogins));
    });

    // --- MUDANÇA AQUI PARA getAllInStream ---
    test('getAllInStream retorna um stream de SavedLogins do DAO', () {
      final savedLogin1 = SavedLogin(id: 'user1', email: 'stream1@example.com');
      final savedLogin2 = SavedLogin(id: 'user2', email: 'stream2@example.com');
      final expectedStreamData = [
        [savedLogin1, savedLogin2]
      ];
      when(mockSavedLoginDao.getAllInStream()).thenAnswer((_) => Stream.value([savedLogin1, savedLogin2]));

      final result = repository.getAllInStream();

      verify(mockSavedLoginDao.getAllInStream()).called(1);
      // Compara com as instâncias exatas
      expect(result, emitsInOrder(expectedStreamData));
    });

    test('deleteAll chama o método deleteAll do DAO', () async {
      when(mockSavedLoginDao.deleteAll()).thenAnswer((_) async => Future.value());

      await repository.deleteAll();

      verify(mockSavedLoginDao.deleteAll()).called(1);
    });

    test('getSavedLogin retorna um stream do SavedLogin salvo do DAO', () {
      final singleUserLogin = SavedLogin(id: 'single_user', email: 'single@example.com');
      final expectedStreamData = [
        [singleUserLogin]
      ];
      when(mockSavedLoginDao.getSavedLogin()).thenAnswer((_) => Stream.value([singleUserLogin]));

      final result = repository.getSavedLogin();

      verify(mockSavedLoginDao.getSavedLogin()).called(1);
      // Compara com as instâncias exatas
      expect(result, emitsInOrder(expectedStreamData));
    });

    test('getUserId retorna o ID do usuário salvo do DAO', () async {
      when(mockSavedLoginDao.getUserId()).thenAnswer((_) async => 'saved_user_id');

      final result = await repository.getUserId();

      verify(mockSavedLoginDao.getUserId()).called(1);
      expect(result, 'saved_user_id');
    });

    test('getSaved retorna o SavedLogin salvo do DAO', () async {
      final expectedLogin = SavedLogin(id: 'unique_id', email: 'unique@example.com');
      when(mockSavedLoginDao.getSaved()).thenAnswer((_) async => expectedLogin);

      final result = await repository.getSaved();

      verify(mockSavedLoginDao.getSaved()).called(1);
      expect(result, equals(expectedLogin));
    });

    test('getSaved retorna null se nenhum SavedLogin for encontrado', () async {
      when(mockSavedLoginDao.getSaved()).thenAnswer((_) async => null);

      final result = await repository.getSaved();

      verify(mockSavedLoginDao.getSaved()).called(1);
      expect(result, isNull);
    });
  });
}