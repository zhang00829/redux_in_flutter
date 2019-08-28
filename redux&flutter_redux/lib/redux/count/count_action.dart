import 'package:meta/meta.dart';

class MultiChangeAction{
  final int num;

  MultiChangeAction({@required this.num});
}

enum ChangeColorAction{
  dark,
  light
}