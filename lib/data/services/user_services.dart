import 'package:sqflite_mvvm_design/data/models/Poet.dart';

import '../helper/repository.dart';

class UserService
{
  late Repository _repository;
  UserService(){
    _repository = Repository();
  }
  //Save User
  SaveUser(Poet user) async{
    return await _repository.insertData('poet', user.poetMap());
  }
  //Read All Users
  readAllUsers() async{
    return await _repository.readData('poet');
  }
  //Edit User
  UpdateUser(Poet user) async{
    return await _repository.updateData('poet', user.poetMap());
  }

  deleteUser(userId) async {
    return await _repository.deleteDataById('poet', userId);
  }

}