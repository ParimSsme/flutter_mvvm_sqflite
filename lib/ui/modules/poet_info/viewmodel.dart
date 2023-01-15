import '../../../config/router/router.dart';
import '../../../core/base/view_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../../data/models/Poet.dart';

class PoetInfoScreenState {

  final Poet? poet;

  PoetInfoScreenState({
    this.poet,
  });

  PoetInfoScreenState copyWith({
    Poet? poet,
  }) {
    return PoetInfoScreenState(
      poet: poet,
    );
  }
}

class PoetInfoScreenViewModel extends BaseViewModel {

  final _stateSubject =
  BehaviorSubject<PoetInfoScreenState>.seeded(PoetInfoScreenState());
  Stream<PoetInfoScreenState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  PoetInfoScreenViewModel({
    Poet? poet
  }) {
    _stateSubject.add(PoetInfoScreenState(
        poet: poet
    ));
  }

  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
  }
}