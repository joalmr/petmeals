**
mustcallsuper
**

# Config

## Freezed

```yaml
flutter pub add freezed_annotation
flutter pub add --dev build_runner
flutter pub add --dev freezed
```

### if using freezed to generate fromJson/toJson, also add:

```yaml
flutter pub add json_annotation
flutter pub add --dev json_serializable
```

===
```yaml
flutter pub add freezed_annotation
flutter pub add dev:build_runner
flutter pub add dev:freezed
# if using freezed to generate fromJson/toJson, also add:
flutter pub add json_annotation
flutter pub add dev:json_serializable
```
para crear los modelos freezed
```yaml
dart run build_runner build

flutter pub run build_runner build --delete-conflicting-outputs
```

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
