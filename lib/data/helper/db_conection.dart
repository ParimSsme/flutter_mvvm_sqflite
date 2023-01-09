import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DBConnection {
  // Singleton pattern
  static final DBConnection _databaseService = DBConnection._internal();
  factory DBConnection() => _databaseService;
  DBConnection._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {

    var dbDir = await getDatabasesPath();
    var dbPath = join(dbDir, "data.db");

// Delete any existing database:
    await deleteDatabase(dbPath);

// Create the writable database file from the bundled demo database file:
    ByteData data = await rootBundle.load("assets/poets.db");
    List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    await File(dbPath).writeAsBytes(bytes);
    return await openDatabase(dbPath);
  }

  // Future<Database> setDatabase() async {
  //   var dbDir = await getDatabasesPath();
  //   var dbPath = join(dbDir, "data.db");
  //   var database =
  //   await openDatabase(dbPath, version: 1, onCreate: _createDatabase);
  //   return database;
  // }
  //
  // Future<void> _createDatabase(Database database, int version) async {
  //   String sql =
  //       "CREATE TABLE users (id INTEGER PRIMARY KEY,name TEXT,contact Text,description TEXT);";
  //   await database.execute(sql);
  // }
}