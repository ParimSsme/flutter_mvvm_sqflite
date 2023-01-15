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
        model.id = map['id'];
        model.name = map['name'];
        model.info = map['info'];
        model.image = map['image'];
        return model;

      default:
        throw Exception('Route not implemented');
    }
  }

}