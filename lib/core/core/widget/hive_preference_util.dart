import 'package:hive/hive.dart';
class HivePreferenceUtil {

  static late Box box;

  static Future<void> init()async{
    box = await Hive.openBox('appBox');
  }

  static Future<String> saveData({required String key, required dynamic value})async{
   var token = await box.put(key, value);
   return token as String ;
  }


  static Future<String> getData ({required String key})async{
   var value = await box.get(key) ;
   return value != null ? value as String : '';
  }

  static Future<String> removeData({required String key})async{
   var value = await box.delete(key);
   return value as String ;
  }

}