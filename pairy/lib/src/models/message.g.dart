// GENERATED CODE - DO NOT MODIFY BY HAND

part of pairy.src.models.message;

// **************************************************************************
// Generator: JsonModelGenerator
// **************************************************************************

class Message extends _Message {
  Message(
      {this.id,
      this.pairingId,
      this.userId,
      this.text,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final String pairingId;

  @override
  final String userId;

  @override
  final String text;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  Message copyWith(
      {String id,
      String pairingId,
      String userId,
      String text,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new Message(
        id: id ?? this.id,
        pairingId: pairingId ?? this.pairingId,
        userId: userId ?? this.userId,
        text: text ?? this.text,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  Map<String, dynamic> toJson() {
    return MessageSerializer.toMap(this);
  }
}
