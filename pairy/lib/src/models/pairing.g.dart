// GENERATED CODE - DO NOT MODIFY BY HAND

part of pairy.src.models.pairing;

// **************************************************************************
// Generator: JsonModelGenerator
// **************************************************************************

class Pairing extends _Pairing {
  Pairing({this.id, this.user1, this.user2, this.createdAt, this.updatedAt});

  @override
  final String id;

  @override
  final String user1;

  @override
  final String user2;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  Pairing copyWith(
      {String id,
      String user1,
      String user2,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new Pairing(
        id: id ?? this.id,
        user1: user1 ?? this.user1,
        user2: user2 ?? this.user2,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  Map<String, dynamic> toJson() {
    return PairingSerializer.toMap(this);
  }
}
