go router
hero
**
mustcallsuper
**
\*\*

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
para crear los modelos freezed

```yaml
dart run build_runner build
```

## PetModel

en PetModelImplFromJson reemplazar:

```dart
age: (DateTime.now().difference(DateTime.parse(json["borndate"])).inDays) ~/ 365, //? [solo fromJson PetModel]
```

en PetModelImplToJson agregar:

```dart
"created_at": DateTime.timestamp(), //? [solo toJson PetModel]
//quitar: id & age
//cambiar
'specie': instance.specie!.toJson(),
```

## Icono

```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
	flutter_launcher_icons: ^0.13.1

flutter_launcher_icons:
  android: "launcher_icon"
  ios: true
  image_path: "assets/images/logo/comfypet.png"
  adaptive_icon_background: "assets/images/logo/comfypet.png"
```

para crear el icono de la app

```yaml
flutter pub run flutter_launcher_icons
```
