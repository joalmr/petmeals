# comfypet

Nueva version de Comfypet dev

## firebase

- en build gradle proyecto agregar dentro de dependencies:
  - classpath 'com.google.gms:google-services:4.3.15'
- en build gradle app agregar:
  - en los plugins:
    - id 'com.google.gms.google-services'
  - en las dependencies:
    - implementation platform('com.google.firebase:firebase-bom:32.2.3')

## firebase auth

- en pubspec agregar:
  - google_sign_in, firebase_core, firebase_auth
  - (flutter pub add google_sign_in firebase_core firebase_auth)
- en el main agregar:
  - WidgetsFlutterBinding.ensureInitialized();
  - await Firebase.initializeApp();

## firebase firestore

- en pubspec agregar:

  - cloud_firestore
  - (flutter pub add cloud_firestore)

### conectar a una colección

```dart
final personRef = FirebaseFirestore.instance.collection('persons').withConverter(
  fromFirestore: (snapshot, _) {
    final person = Person.fromJson(snapshot.data()!);
    final newPerson = person.copyWith(id: snapshot.id);
    return newPerson;
  },
  toFirestore: (person, _) => person.toJson(),
);
```
