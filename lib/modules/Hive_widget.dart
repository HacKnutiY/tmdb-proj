import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveElement {
  HiveElement() {
    Hive.initFlutter();
  }
  Future<String> put(String string) async {
    var hiveBox = await Hive.openBox<dynamic>('box');
    await hiveBox.put('key', string);
    print(hiveBox.values);
    return await hiveBox.get('key', defaultValue: "Said");
  }
}
