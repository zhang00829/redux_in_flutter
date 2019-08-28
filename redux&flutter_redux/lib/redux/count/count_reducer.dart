import 'package:meta/meta.dart';
import 'count_action.dart';
import 'count_state.dart';

CountState countReducer({@required CountState pre, @required  dynamic action}) {
  if (action is MultiChangeAction) {
    return CountState(num: action.num, changeColorAction: pre.changeColorAction);
  }
  if(action is ChangeColorAction){
    return CountState(num: pre.num, changeColorAction: action);
  }
  return pre;
}
