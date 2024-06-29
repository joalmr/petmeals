## PetModel

en PetModelImplFromJson reemplazar:

```dart
age: (DateTime.now().difference(DateTime.parse(json['borndate'])).inDays) ~/ 365, //? [solo fromJson PetModel]
```

en PetModelImplToJson agregar:

```dart
'created_at': DateTime.timestamp(), //? [solo toJson PetModel]
//quitar: id & age
```

## Icono

para crear el icono de la app

```bash
flutter pub run flutter_launcher_icons
```

## Flavor

```bash
flutter build appbundle --flavor prod
```

## Specie

0 = gato
1 = perro
