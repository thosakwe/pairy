// GENERATED CODE - DO NOT MODIFY BY HAND

part of pairy.src.models.message;

// **************************************************************************
// Generator: SerializerGenerator
// **************************************************************************

abstract class MessageSerializer {
  static Message fromMap(Map map) {
    return new Message(
        id: map['id'],
        pairingId: map['pairing_id'],
        userId: map['user_id'],
        text: map['text'],
        createdAt: map['created_at'] != null
            ? DateTime.parse(map['created_at'])
            : null,
        updatedAt: map['updated_at'] != null
            ? DateTime.parse(map['updated_at'])
            : null);
  }

  static Map<String, dynamic> toMap(Message model) {
    return {
      'id': model.id,
      'pairing_id': model.pairingId,
      'user_id': model.userId,
      'text': model.text,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class MessageFields {
  static const String id = 'id';

  static const String pairingId = 'pairing_id';

  static const String userId = 'user_id';

  static const String text = 'text';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}
