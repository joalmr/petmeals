import 'package:get_storage/get_storage.dart';

class MyStorage {
  final box = GetStorage();

  //? REVISAR SI FUNCIONA CON OBJECT

  // User get user => box.read('user');
  // set user(User value) => box.write('user', value);

  String get uid => box.read('uid') ?? '';
  set uid(String value) => box.write('uid', value);

  String get name => box.read('name') ?? '';
  set name(String value) => box.write('name', value);

  String get photo => box.read('photo') ?? '';
  set photo(String value) => box.write('photo', value);
}
