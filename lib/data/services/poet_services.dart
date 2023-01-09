import 'package:sqflite_mvvm_design/data/models/Poet.dart';
import 'package:sqflite_mvvm_design/data/service_constants.dart';
import '../helper/repository.dart';

class PoetService
{
  late Repository _repository;
  PoetService(){
    _repository = Repository();
  }

  //Save User
  SavePoet(Poet user) async{
    return await _repository.insertData(
        ServiceConstants.poetTable,
        user.poetMap()
    );
  }

  //Read All Users
  readAllPoets() async{
    return await _repository.readData(ServiceConstants.poetTable);
  }

  //Read All Users
  readPoetById(int id) async {
    return await _repository.readDataById(
        ServiceConstants.poetTable, id
    );
  }

  //Edit User
  UpdatePoet(Poet user) async{
    return await _repository.updateData(
        ServiceConstants.poetTable,
        user.poetMap()
    );
  }

  deletePoet(userId) async {
    return await _repository.deleteDataById(
        ServiceConstants.poetTable,
        userId
    );
  }

}