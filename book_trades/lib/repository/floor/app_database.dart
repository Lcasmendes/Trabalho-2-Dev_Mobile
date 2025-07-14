// imports needed for the floor classes
import 'package:floor/floor.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:projeto2/repository/floor/login_try_dao.dart';
import 'package:projeto2/repository/floor/login_try.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [SavedLogin])
abstract class AppDatabase extends FloorDatabase {

  SavedLoginDao get savedLoginDao;

}