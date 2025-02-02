import 'package:hive/hive.dart';
class HivePreferenceUtil {

  static late Box box;

  static Future<void> init()async{
    box = await Hive.openBox('appBox');
  }

  static Future<void> saveData({required String key, required dynamic value})async{
    await box.put(key, value);
  }

  static Future<void> getData ({required String key})async{
    await box.get(key);
  }

  static Future<void> removeData({required String key})async{
    await box.delete(key);
  }

}