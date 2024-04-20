import 'package:flutter/foundation.dart';

class ContainerModel extends ChangeNotifier {
  List<List<String>> _nestedList;

  ContainerModel(this._nestedList);

  List<List<String>> get nestedList => _nestedList;

  void addContainer(List<String> containerList) {
    _nestedList.add(containerList);
    notifyListeners(); // Обязательно вызывать notifyListeners() после изменения данных
  }
}
