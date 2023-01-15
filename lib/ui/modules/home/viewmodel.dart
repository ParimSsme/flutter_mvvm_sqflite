import '../../../config/router/router.dart';
import '../../../core/base/view_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../../data/models/Poet.dart';

class HomeScreenState {

  final Poet? poet;

  HomeScreenState({
    this.poet,
  });

  HomeScreenState copyWith({
    Poet? poet,
  }) {
    return HomeScreenState(
      poet: poet,
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
    Poet? poet
  }) {
    _stateSubject.add(HomeScreenState(
        poet: poet
    ));
  }

  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
  }
}