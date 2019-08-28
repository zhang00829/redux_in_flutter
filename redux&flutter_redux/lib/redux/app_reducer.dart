import 'app_state.dart';
import 'count/count_reducer.dart';

AppState appReducer (AppState appState,dynamic action ){
  return AppState(countState: countReducer(pre: appState.countState, action: action));
}