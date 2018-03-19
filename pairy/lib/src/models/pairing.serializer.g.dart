// GENERATED CODE - DO NOT MODIFY BY HAND

part of pairy.src.models.pairing;

// **************************************************************************
// Generator: SerializerGenerator
// **************************************************************************

abstract class PairingSerializer {
  static Pairing fromMap(Map map) {
    return new Pairing(
        id: map['id'],
        user1: map['user1'],
        user2: map['user2'],
        createdAt: map['created_at'] != null
            ? DateTime.parse(map['created_at'])
            : null,
        updatedAt: map['updated_at'] != null
            ? DateTime.parse(map['updated_at'])
            : null);
  }

  static Map<String, dynamic> toMap(Pairing model) {
    return {
      'id': model.id,
      'user1': model.user1,
      'user2': model.user2,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class PairingFields {
  static const String id = 'id';

  static const String user1 = 'user1';

  static const String user2 = 'user2';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}
