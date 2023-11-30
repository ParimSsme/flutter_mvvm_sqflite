import '../helper/repository.dart';
import '../models/Poet.dart';

class PoetService {
  late Repository _repository;
  PoetService() {
    _repository = Repository();
  }

  addPoet(Poet poet) async {
    var res = await _repository.insertData(Poet.tableKey, poet.poetMap());
    readAllPoets();
    return res;
  }

  Future<List<Poet>> readAllPoets() async {
    List<Poet> poetList = <Poet>[];
    var result = await _repository.readData(Poet.tableKey);
    result.forEach((map) {
      Poet poet = Poet.fromMap(map);
      poetList.add(poet);
    });
    return poetList;
  }

  Future<List<Poet>> readAllFavoritePoets() async {
    List<Poet> poetList = <Poet>[];
    var result = await _repository.readDataByCondition(
        Poet.tableKey, Poet.isFavoriteKey, 1);
    result.forEach((map) {
      Poet poet = Poet.fromMap(map);
      poetList.add(poet);
    });
    return poetList;
  }

  Future<List<Poet>> searchPoets(String name) async {
    List<Poet> poetList = <Poet>[];
    var result =
        await _repository.searchData(Poet.tableKey, Poet.nameKey, name);
    result.forEach((map) {
      Poet poet = Poet.fromMap(map);
      poetList.add(poet);
    });
    return poetList;
  }

  readPoetById(int id) async {
    return await _repository.readDataById(Poet.tableKey, id);
  }

  updatePoet(Poet poet) async {
    return await _repository.updateData(Poet.tableKey, poet.poetMap());
  }

  deletePoet(poetId) async {
    return await _repository.deleteDataById(Poet.tableKey, poetId);
  }
}
