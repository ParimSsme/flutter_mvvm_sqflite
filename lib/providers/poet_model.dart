import 'package:flutter/material.dart';
import '../data/models/Poet.dart';
import '../data/services/poet_services.dart';

class PoetModel with ChangeNotifier {
  List<Poet> _poets = [];

  getAllPoets() async {}

  List<Poet> get poets {
    fetchAndSetPoets();
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

  Future<void> addPoet(Poet poet) async {
    final poetService = PoetService();
    poetService.AddPoet(poet);
  }

  Future<void> updatePoet(int id, Poet newPoet) async {

  }

  Future<void> deletePoet(int id) async {
    final poetService = PoetService();
    poetService.deletePoet(id);
    fetchAndSetPoets();
    notifyListeners();
  }
}
