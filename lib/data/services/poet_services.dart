import 'package:sqflite_mvvm_design/core/enums/database_tables.dart';
import 'package:sqflite_mvvm_design/data/models/Poet.dart';
import '../helper/repository.dart';

class PoetService
{
  late Repository _repository;
  PoetService(){
    _repository = Repository();
  }

  AddPoet(Poet poet) async{
    return await _repository.insertData(
        DatabaseTables.poet.value,
        poet
        // poet.poetMap()
    );
  }

  Future<List<Poet>> readAllPoets() async {
    List<Poet> poetList = <Poet>[];
    var result = await _repository.readData(DatabaseTables.poet.value);
    result.forEach((map) {
      Poet poet = Poet.fromMap(map);
      poetList.add(poet);
    });
    return poetList;
  }

  readPoetById(int id) async {
    return await _repository.readDataById(
        DatabaseTables.poet.value, id
    );
  }

  updatePoet(Poet poet) async {
    return await _repository.updateData(
        DatabaseTables.poet.value,
        poet
    );
  }

  deletePoet(poetId) async {
    return await _repository.deleteDataById(
        DatabaseTables.poet.value,
        poetId
    );
  }

}