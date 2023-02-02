import 'package:sqflite_mvvm_design/core/enums/database_tables.dart';
import '../models/Poet.dart';

class ResponseBody {

  static dynamic? body(
      DatabaseTables table,
      Map<String, dynamic> map
  ) {

    switch (table) {
      case DatabaseTables.poet:
        Poet model = Poet();
        model.id = map[PoetColumns.id.name];
        model.name = map[PoetColumns.name.name];
        model.info = map[PoetColumns.info.name];
        model.image = map[PoetColumns.image.name];
        return model;

      default:
        throw Exception('table not exist');
    }
  }

}