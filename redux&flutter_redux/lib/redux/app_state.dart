import 'package:meta/meta.dart';

import 'count/count_state.dart';

class AppState {
  final CountState countState;

  AppState({@required this.countState});

  factory AppState.init() {
    return AppState(countState: CountState.init());
  }
}
