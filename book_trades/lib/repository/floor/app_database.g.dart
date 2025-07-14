// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  SavedLoginDao? _savedLoginDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `SavedLogin` (`id` TEXT NOT NULL, `email` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  SavedLoginDao get savedLoginDao {
    return _savedLoginDaoInstance ??= _$SavedLoginDao(database, changeListener);
  }
}

class _$SavedLoginDao extends SavedLoginDao {
  _$SavedLoginDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database, changeListener),
        _savedLoginInsertionAdapter = InsertionAdapter(
            database,
            'SavedLogin',
            (SavedLogin item) =>
                <String, Object?>{'id': item.id, 'email': item.email},
            changeListener);

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<SavedLogin> _savedLoginInsertionAdapter;

  @override
  Future<List<SavedLogin>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM SavedLogin ORDER BY id DESC',
        mapper: (Map<String, Object?> row) =>
            SavedLogin(id: row['id'] as String, email: row['email'] as String));
  }

  @override
  Stream<List<SavedLogin>> getAllInStream() {
    return _queryAdapter.queryListStream(
        'SELECT * FROM SavedLogin ORDER BY id DESC',
        mapper: (Map<String, Object?> row) =>
            SavedLogin(id: row['id'] as String, email: row['email'] as String),
        queryableName: 'SavedLogin',
        isView: false);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM SavedLogin');
  }

  @override
  Stream<List<SavedLogin>?> getSavedLogin() {
    return _queryAdapter.queryListStream('SELECT * FROM SavedLogin LIMIT 1',
        mapper: (Map<String, Object?> row) =>
            SavedLogin(id: row['id'] as String, email: row['email'] as String),
        queryableName: 'SavedLogin',
        isView: false);
  }

  @override
  Future<String?> getUserId() async {
    return _queryAdapter.query('SELECT id FROM SavedLogin LIMIT 1',
        mapper: (Map<String, Object?> row) => row.values.first as String);
  }

  @override
  Future<SavedLogin?> getSaved() async {
    return _queryAdapter.query('Select * from SavedLogin Limit 1',
        mapper: (Map<String, Object?> row) =>
            SavedLogin(id: row['id'] as String, email: row['email'] as String));
  }

  @override
  Future<void> insert(SavedLogin savedLogin) async {
    await _savedLoginInsertionAdapter.insert(
        savedLogin, OnConflictStrategy.abort);
  }
}
