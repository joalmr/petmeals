import 'package:get_storage/get_storage.dart';

class MyStorage {
  final box = GetStorage();

  // bool get uidHas => box.hasData('uid');
  String get uid => box.read('uid') ?? "";
  set uid(String value) => box.write('uid', value);

  // bool get nameHas => box.hasData('name');
  String get name => box.read('name') ?? "";
  set name(String value) => box.write('name', value);

  // bool get photoHas => box.hasData('photo');
  String get photo => box.read('photo') ?? "";
  set photo(String value) => box.write('photo', value);
}
