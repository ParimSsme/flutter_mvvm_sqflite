import '../../../config/router/router.dart';
import '../../../core/base/view_model.dart';
import 'package:rxdart/rxdart.dart';
import '../../../data/models/Poet.dart';

class PoetEditScreenState {

  final Poet? poet;

  PoetEditScreenState({
     this.poet,
  });

  PoetEditScreenState copyWith({
     Poet? poet,
  }) {
    return PoetEditScreenState(
        poet: poet,
    );
  }
}

class PoetEditScreenViewModel extends BaseViewModel {

  final _stateSubject =
  BehaviorSubject<PoetEditScreenState>.seeded(PoetEditScreenState());
  Stream<PoetEditScreenState> get state => _stateSubject;

  final _routesSubject = PublishSubject<AppRouteSpec>();
  Stream<AppRouteSpec> get routes => _routesSubject;

  PoetEditScreenViewModel({
     Poet? poet
  }) {
    _stateSubject.add(PoetEditScreenState(
        poet: poet
    ));
  }

  @override
  void dispose() {
    _stateSubject.close();
    _routesSubject.close();
  }
}