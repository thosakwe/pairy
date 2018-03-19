// GENERATED CODE - DO NOT MODIFY BY HAND

part of pairy.src.models.user;

// **************************************************************************
// Generator: JsonModelGenerator
// **************************************************************************

class User extends _User {
  User(
      {this.id,
      this.githubId,
      this.name,
      this.avatar,
      this.createdAt,
      this.updatedAt});

  @override
  final String id;

  @override
  final String githubId;

  @override
  final String name;

  @override
  final String avatar;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  User copyWith(
      {String id,
      String githubId,
      String name,
      String avatar,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new User(
        id: id ?? this.id,
        githubId: githubId ?? this.githubId,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  Map<String, dynamic> toJson() {
    return UserSerializer.toMap(this);
  }
}

class Repo extends _Repo {
  Repo({this.name, this.description, this.language});

  @override
  final String name;

  @override
  final String description;

  @override
  final String language;

  Repo copyWith({String name, String description, String language}) {
    return new Repo(
        name: name ?? this.name,
        description: description ?? this.description,
        language: language ?? this.language);
  }

  Map<String, dynamic> toJson() {
    return RepoSerializer.toMap(this);
  }
}
