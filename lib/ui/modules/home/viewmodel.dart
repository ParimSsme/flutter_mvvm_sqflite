import '../../../config/router/route_service.dart';
import '../../../core/base/view_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../../data/models/Poet.dart';
import '../../../data/services/poet_services.dart';

class HomeScreenState {

  final List<Poet>? poets;

  HomeScreenState({
    this.poets,
  });

  HomeScreenState copyWith({
    List<Poet>? poets,
  }) {
    return HomeScreenState(
      poets: poets,
    );
  }
}

class HomeScreenViewModel extends BaseViewModel {

  final _stateSubject =
  BehaviorSubject<HomeScreenState>.seeded(HomeScreenState());
  Stream<HomeScreenState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  PoetEditScreenViewModel({
    List<Poet>? poets
  }) {
    _stateSubject.add(HomeScreenState(
        poets: poets
    ));
  }


  getAllPoets() async {
    final _poetService = PoetService();
    List<Poet> poets = await _poetService.readAllPoets();
    updateList(poets);
  }

  updateList(List<Poet> list){
    final state = _stateSubject.value;
    _stateSubject.add(
      state.copyWith(
        poets: list,
      ),
    );
  }

  @override
  void init() {
    getAllPoets();
  }

  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
  }
}