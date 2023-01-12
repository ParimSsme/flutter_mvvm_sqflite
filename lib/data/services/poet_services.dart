import 'package:sqflite_mvvm_design/data/models/Poet.dart';
import 'package:sqflite_mvvm_design/data/service_constants.dart';
import '../helper/repository.dart';

class PoetService
{
  late Repository _repository;
  PoetService(){
    _repository = Repository();
  }

  SavePoet(Poet poet) async{
    return await _repository.insertData(
        ServiceConstants.poetTable,
        poet.poetMap()
    );
  }

  readAllPoets() async{
    return await _repository.readData(ServiceConstants.poetTable);
  }

  readPoetById(int id) async {
    return await _repository.readDataById(
        ServiceConstants.poetTable, id
    );
  }

  updatePoet(Poet poet) async {
    return await _repository.updateData(
        ServiceConstants.poetTable,
        poet.poetMap()
    );
  }

  deletePoet(poetId) async {
    return await _repository.deleteDataById(
        ServiceConstants.poetTable,
        poetId
    );
  }

}