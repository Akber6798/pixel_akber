import 'package:flutter/cupertino.dart';

class BottomController with ChangeNotifier {
  int _bottomIndex = 0;
  int get bottomIndex => _bottomIndex;

  changeIndex(int index) {
    _bottomIndex = index;
    notifyListeners();
  }
}
