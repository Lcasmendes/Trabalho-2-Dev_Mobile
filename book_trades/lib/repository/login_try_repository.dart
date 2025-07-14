import 'package:projeto2/repository/floor/login_try.dart';
import 'package:projeto2/repository/floor/login_try_dao.dart';

class SavedLoginRepository {

  final SavedLoginDao savedLoginDao;

  SavedLoginRepository(this.savedLoginDao);

  Future<void> insert(SavedLogin savedLogin) => savedLoginDao.insert(savedLogin);

  Future<List<SavedLogin>> getAll() => savedLoginDao.getAll();

  Stream<List<SavedLogin>> getAllInStream() => savedLoginDao.getAllInStream();

  Future<void> deleteAll() => savedLoginDao.deleteAll();

  Stream<List<SavedLogin>?> getSavedLogin() => savedLoginDao.getSavedLogin();

  Future<String?> getUserId() => savedLoginDao.getUserId();

  Future<SavedLogin?> getSaved() => savedLoginDao.getSaved();

}