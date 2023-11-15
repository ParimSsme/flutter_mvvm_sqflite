import 'package:flutter/material.dart';
import '../data/models/Poet.dart';
import '../data/services/poet_services.dart';

class PoetModel with ChangeNotifier {
  List<Poet> _poets = [];

  List<Poet> get poets {
    return [..._poets];
  }

  Poet findById(int id) {
    return _poets.firstWhere((poet) => poet.id == id);
  }

  Future<void> fetchAndSetPoets() async {
    final poetService = PoetService();
    List<Poet> poets = await poetService.readAllPoets();
    _poets = poets;
    notifyListeners();
  }

  Future<void> fetchAndSetFavoritePoets() async {
    final poetService = PoetService();
    List<Poet> poets = await poetService.readAllFavoritePoets();
    _poets = poets;
    notifyListeners();
  }

  Future<void> searchPoets(String name) async {
    final poetService = PoetService();
    List<Poet> poets = await poetService.searchPoets(name);
    _poets = poets;
    notifyListeners();
  }

  Future<void> addPoet(Poet poet) async {
    final poetService = PoetService();
    await poetService.addPoet(poet);
    fetchAndSetPoets();
    notifyListeners();
  }

  Future<void> updatePoet(int id, Poet newPoet) async {
    final poetService = PoetService();
    final result = await poetService.updatePoet(newPoet);
    if(result == 1){
      _poets[(newPoet.id ?? -1)-1] = newPoet;
      notifyListeners();
    }
  }

  toggleFavoritePoet(Poet poet) async {
    final poetService = PoetService();
    final result = await poetService.updatePoet(poet);
    if(result == 1){
      _poets[(poet.id ?? -1)-1] = poet;
      notifyListeners();
    }
  }

  Future<void> deletePoet(int id) async {
    final poetService = PoetService();
    final result = await poetService.deletePoet(id);
    if(result == 1){
      fetchAndSetPoets();
      notifyListeners();
    }
  }
}
