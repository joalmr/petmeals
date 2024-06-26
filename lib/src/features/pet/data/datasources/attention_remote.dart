import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:petmeals/src/core/error/failure.dart';
import 'package:petmeals/src/features/pet/data/models/attention_model.dart';
import 'package:petmeals/src/features/pet/domain/entities/attention.dart';

abstract class AttentionRemoteDataSource {
  Future<List<AttentionModel>> getAttentions(String petId);
  Future<AttentionModel> addAttention(AttentionEntity attention, String petId);
  Future<void> deleteAttention(String id, String petId);
  Future<List<AttentionModel>> getNextAttentions(String petId);
}

class AttentionRemoteDataSourceImpl implements AttentionRemoteDataSource {
  final ref = FirebaseFirestore.instance.collection('pets');

  @override
  Future<AttentionModel> addAttention(
      AttentionEntity attention, String petId) async {
    try {
      return await ref
          .doc(petId)
          .collection('attentions')
          .add(AttentionModel.fromEntity(attention).toJson())
          .then((value) => value.get())
          .then((value) {
        return AttentionModel.fromJson(value.data()!);
      });
    } on Exception catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<void> deleteAttention(String id, String petId) async {
    try {
      ref.doc(petId).collection('attentions').doc(id).delete();
    } on Exception catch (e) {
      throw ServerFailure(message: e.toString());
    }
  }

  @override
  Future<List<AttentionModel>> getAttentions(String petId) async {
    final docs = await ref
        .doc(petId)
        .collection('attentions')
        .orderBy('date', descending: true)
        .limit(10)
        .get()
        .then((value) => value.docs);

    final myAttentions = docs.map((doc) {
      final attention = AttentionModel.fromJson(doc.data());
      final newPet = attention.copyWith(id: doc.id);
      return newPet;
    }).toList();

    return myAttentions;
  }

  @override
  Future<List<AttentionModel>> getNextAttentions(String petId) async {
    final docs = await ref
        .doc(petId)
        .collection('attentions')
        .orderBy('date', descending: true)
        .get()
        .then((value) => value.docs);

    final myAttentions = docs.map((doc) {
      final attention = AttentionModel.fromJson(doc.data());
      final newPet = attention.copyWith(id: doc.id);
      return newPet;
    }).toList();

    AttentionModel? deworming;
    AttentionModel? grooming;
    AttentionModel? vaccination;
    List<AttentionModel> nextlist = [];

    if (myAttentions.isNotEmpty) {
      for (var element in myAttentions) {
        final DateTime next = element.nextDateDuration!;
        switch (element.type) {
          case 'deworming':
            {
              if (deworming == null) {
                deworming = element;
              } else {
                if (next.isBefore(deworming.nextDateDuration!) &&
                    next.isAfter(
                        DateTime.now().add(const Duration(days: -7)))) {
                  deworming = element;
                }
              }
            }
            break;
          case 'grooming':
            {
              if (grooming == null) {
                grooming = element;
              } else {
                if (next.isBefore(grooming.nextDateDuration!) &&
                    next.isAfter(
                        DateTime.now().add(const Duration(days: -7)))) {
                  grooming = element;
                }
              }
            }
            break;
          case 'vaccine':
            {
              if (vaccination == null) {
                vaccination = element;
              } else {
                if (next.isBefore(vaccination.nextDateDuration!) &&
                    next.isAfter(
                        DateTime.now().add(const Duration(days: -7)))) {
                  vaccination = element;
                }
              }
            }
            break;
          // default:
          //   return [];
        }
      }
    }

    if (deworming != null) {
      nextlist.add(deworming);
    }
    if (grooming != null) {
      nextlist.add(grooming);
    }
    if (vaccination != null) {
      nextlist.add(vaccination);
    }

    return nextlist;
  }
}
