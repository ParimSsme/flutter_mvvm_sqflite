import 'package:sqflite/sqflite.dart';

import 'db_conection.dart';

class Repository
{
  static final DBConnection _databaseService = DBConnection();
  static late Database? _database;

  insertData(table, data) async {
    _database = await _databaseService.database;
    return await _database?.insert(table, data);
  }


  readData(table) async {
    _database = await _databaseService.database;
    return await _database?.query(table);
  }

  //Read a Single Record By ID
  readDataById(table, itemId) async {
    _database = await _databaseService.database;
    return await _database?.query('poet', where: 'id=?', whereArgs: [itemId]);
  }

  updateData(table, data) async {
    _database = await _databaseService.database;
    return await _database
        ?.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  deleteDataById(table, itemId) async {
    _database = await _databaseService.database;
    return await _database?.rawDelete("delete from $table where id=$itemId");
  }

}