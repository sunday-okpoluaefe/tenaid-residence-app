import 'package:flutter/cupertino.dart';

SyncNotifier syncRequiredNotifier = SyncNotifier();

class SyncNotifier extends ChangeNotifier {
  bool _syncRequired = false;

  bool get syncRequired => _syncRequired;

  void notify() {
    _syncRequired = true;
    notifyListeners();
  }
}
