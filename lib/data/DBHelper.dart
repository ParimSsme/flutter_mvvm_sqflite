import 'dart:io';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'models/Poet.dart';

class DBHelper {
  // Singleton pattern
  static final DBHelper _databaseService = DBHelper._internal();
  factory DBHelper() => _databaseService;
  DBHelper._internal();

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

  Future<List<Poet>> getPoets() async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(Poet.tableKey);
    return List.generate(maps.length, (index) => Poet.fromMap(maps[index]));
  }

  Future<Poet> getPoetInfo(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps = await db.query(Poet.tableKey,
        where: '${Poet.idKey} = ?', whereArgs: [id.toString()]);
    return Poet.fromMap(maps[0]);
  }

}
