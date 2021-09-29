import 'package:album/enum/view_state.dart';
import 'package:flutter/material.dart';

class BaseVM extends ChangeNotifier {
  ViewState _state = ViewState.idle;

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}