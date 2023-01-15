import 'package:sqflite_mvvm_design/core/enums/database_tables.dart';
import 'package:sqflite_mvvm_design/data/models/Poet.dart';
import '../helper/repository.dart';

class PoetService
{
  late Repository _repository;
  PoetService(){
    _repository = Repository();
  }

  SavePoet(Poet poet) async{
    return await _repository.insertData(
        DatabaseTables.poet.value,
        poet.poetMap()
    );
  }

  readAllPoets() async{
    return await _repository.readData(DatabaseTables.poet.value);
  }

  readPoetById(int id) async {
    return await _repository.readDataById(
        DatabaseTables.poet.value, id
    );
  }

  updatePoet(Poet poet) async {
    return await _repository.updateData(
        DatabaseTables.poet.value,
        poet.poetMap()
    );
  }

  deletePoet(poetId) async {
    return await _repository.deleteDataById(
        DatabaseTables.poet.value,
        poetId
    );
  }

}