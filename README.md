# petmeals

Nueva version pet

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

### implementar auth

SingIn => retorna UserCredential

```dart
  GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    return userCredential;
```

SignOut => void

```dart
  await FirebaseAuth.instance.signOut();
```

## implementar firestore

- en pubspec agregar:

  - cloud_firestore
  - (flutter pub add cloud_firestore)

### conectar a una colección

```dart
final personRef = FirebaseFirestore.instance.collection('pets').withConverter(
  fromFirestore: (snapshot, _) {
    final person = Person.fromJson(snapshot.data()!);
    final newPerson = person.copyWith(id: snapshot.id);
    return newPerson;
  },
  toFirestore: (person, _) => person.toJson(),
);
```
