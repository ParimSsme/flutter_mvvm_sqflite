import 'package:sqflite/sqflite.dart';
import 'db_conection.dart';

class Repository {
  static final DBConnection _databaseService = DBConnection();
  static late Database? _database;

  insertData(table, Map<String, String> data) async {
    _database = await _databaseService.database;
    return await _database?.insert(table, data);
  }

  readData(table) async {
    _database = await _databaseService.database;
    var data = _database?.query(table);
    return data;
  }

  searchData(table, searchedInColumn, searchedInName) async {
    _database = await _databaseService.database;
    var data = _database?.query(table,
        where: " $searchedInColumn Like '%$searchedInName%'");
    return data;
  }

  //Read a Single Record By ID
  readDataById(table, itemId) async {
    _database = await _databaseService.database;
    return await _database?.query('poet', where: 'id=?', whereArgs: [itemId]);
  }

  readDataByCondition(table, column, condition) async {
    _database = await _databaseService.database;
    return await _database
        ?.query('poet', where: '$column=?', whereArgs: [condition]);
  }

  updateData(table, data) async {
    _database = await _databaseService.database;
    return await _database
        ?.update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  deleteDataById(table, itemId) async {
    _database = await _databaseService.database;
    var count =
        await _database?.rawDelete('DELETE FROM $table WHERE id = ?', [itemId]);
    assert(count == 1);

    return count;
  }
}
