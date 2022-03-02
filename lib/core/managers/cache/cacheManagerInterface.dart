import 'package:hive/hive.dart';

import '../../base/baseModel.dart';

abstract class ICacheManager<T extends BaseModel> {
  final String boxName;
  Box<T>? _hiveBox;

  Box<T>? get getBox => _hiveBox;

  Future<void> init() async {
    registerAdapters();
    if (!(_hiveBox?.isOpen ?? false)) {
      _hiveBox = await Hive.openBox(boxName);
    }
  }

  void registerAdapters();

  Future<void> clearBox() async {
    //clear box
    await _hiveBox?.clear();
  }

  ICacheManager(this.boxName);

  Future<void> addItem(String key, T item) async {
    await _hiveBox?.put(key, item);
  }

  Future<void> addItems(String key, List<T> items) async {
    await _hiveBox?.putAll(Map.fromEntries(items
        .map((e) => MapEntry(e, e)))); // TODO: uncompleted process in this line
  }

  Future<void> removeItem(String key) async {
    await _hiveBox?.delete(key);
  }

  Future<void> addItemWithEncrypt(String key, T item);
  Future<void> addItemsWithEncrypt(String key, List<T> items);

  T? getItem(String key) {
    _hiveBox?.get(key);
    return null;
  }

  List<T?>? getAllItems() {
    _hiveBox?.values.toList();
    return null;
  }
}
