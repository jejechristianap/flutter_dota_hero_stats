import 'package:flutter_dota_hero_list/presentation/mvvm/home_mvvm/home_page_state.dart';
import 'package:flutter_dota_hero_list/presentation/mvvm/view_model.dart';
import 'package:logger/logger.dart';
import 'package:rxdart/rxdart.dart';

class HomePageViewModel extends ViewModel {
  final _stateSubject = BehaviorSubject<HomePageState>.seeded(HomePageState());
  Stream<HomePageState> get state => _stateSubject;

  @override
  void init() {
    super.init();
  }

  void plusButtonTapped() {
    // log.d('Plus Button Tap: ${_stateSubject.value.count}');
    _updateState(_stateSubject.value.count + 1);
  }

  void minusButtonTapped() {
    // log.e('Minus Button Tap: ${_stateSubject.value.count}');
    _updateState(_stateSubject.value.count - 1);
  }

  void _updateState(int newCount) {
    final state = _stateSubject.value;
    _stateSubject.add(
      state.copyWith(
        count: newCount,
        isPlusEnabled: newCount < 5,
        isMinusEnabled: newCount > 0,
      ),
    );
  }

  @override
  void dispose() {
    _stateSubject.close();
  }
}
