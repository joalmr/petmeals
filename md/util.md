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
<!-- //cambiar -->
<!-- //'specie': instance.specie!.toJson(), -->
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



```
_$PetModelImpl _$$PetModelImplFromJson(Map<String, dynamic> json) =>
    _$PetModelImpl(
      actions:
          (json['actions'] as List<dynamic>?)?.map((e) => e as String).toList(),
      age: (DateTime.now()
              .difference(DateTime.parse(json["borndate"]))
              .inDays) ~/
          365,
      borndate: json['borndate'] == null
          ? null
          : DateTime.parse(json['borndate'] as String),
      foods:
          (json['foods'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['id'] as String?,
      name: json['name'] as String?,
      photo: json['photo'] as String?,
      sex: json['sex'] as bool?,
      specie: json['specie'] as int?,
      sterillized: json['sterillized'] as bool?,
      userId:
          (json['userId'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PetModelImplToJson(_$PetModelImpl instance) =>
    <String, dynamic>{
      'actions': instance.actions,
      // 'age': instance.age,
      'borndate': instance.borndate?.toIso8601String(),
      "created_at": DateTime.timestamp(),
      'foods': instance.foods,
      // 'id': instance.id,
      'name': instance.name,
      'photo': instance.photo,
      'sex': instance.sex,
      'specie': instance.specie,
      'sterillized': instance.sterillized,
      'userId': instance.userId,
    };
```