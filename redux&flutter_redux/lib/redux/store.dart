import 'package:redux/redux.dart';

import 'app_state.dart';
import 'app_reducer.dart';

Store<AppState> createStore() {
  return Store<AppState>(
    appReducer,
    initialState: AppState.init(),
  );
}
