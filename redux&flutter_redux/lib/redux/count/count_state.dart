import 'package:flutter/foundation.dart';

import 'count_action.dart';

class CountState{
  final int num;
  final ChangeColorAction changeColorAction;

  CountState({@required this.num,@required this.changeColorAction});

  factory CountState.init(){
    return CountState(num: 0,changeColorAction: ChangeColorAction.light);
  }
}