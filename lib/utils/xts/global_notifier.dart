import 'package:flutter/cupertino.dart';

SyncNotifier syncRequiredNotifier = SyncNotifier();

enum DataSyncType {
  visitors,
  messages,
  communities,
  streets,
  accessPoints,
  account,
  all
}

class SyncNotifier extends ChangeNotifier {
  bool _syncRequired = false;
  late DataSyncType _type;

  bool get syncRequired => _syncRequired;

  DataSyncType get syncType => _type;

  void notify({DataSyncType? type}) {
    _syncRequired = true;
    _type = type ?? DataSyncType.all;
    notifyListeners();
  }
}
