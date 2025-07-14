
import 'package:floor/floor.dart';
import 'package:projeto2/repository/floor/login_try.dart';

@dao
abstract class SavedLoginDao {

  @Insert(onConflict: OnConflictStrategy.abort)
  Future<void> insert(SavedLogin savedLogin);

  @Query('SELECT * FROM SavedLogin ORDER BY id DESC')
  Future<List<SavedLogin>> getAll();

  @Query('SELECT * FROM SavedLogin ORDER BY id DESC')
  Stream<List<SavedLogin>> getAllInStream();

  @Query("DELETE FROM SavedLogin")
  Future<void> deleteAll();

  @Query("SELECT * FROM SavedLogin LIMIT 1")
  Stream<List<SavedLogin>?> getSavedLogin();

  @Query("SELECT id FROM SavedLogin LIMIT 1")
  Future<String?> getUserId();

  @Query("Select * from SavedLogin Limit 1")
  Future<SavedLogin?> getSaved();
}