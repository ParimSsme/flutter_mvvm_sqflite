import 'package:sqflite_mvvm_design/core/enums/database_tables.dart';
import '../models/Poet.dart';

class ResponseBody {

  static dynamic body(
      DatabaseTables table,
      Map<String, dynamic> map
  ) {

    switch (table) {
      case DatabaseTables.poet:
        return Poet(
          id: map[Poet.idKey],
          name: map[Poet.nameKey],
          info: map[Poet.infoKey],
          image: map[Poet.imageKey]
        );

      default:
        throw Exception('table not exist');
    }
  }

}