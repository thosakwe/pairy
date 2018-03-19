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
      this.repoCount,
      this.followerCount,
      this.followingCount,
      this.languages,
      this.popularRepos,
      this.stars,
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
  final int repoCount;

  @override
  final int followerCount;

  @override
  final int followingCount;

  @override
  final List<String> languages;

  @override
  final List<dynamic> popularRepos;

  @override
  final List<dynamic> stars;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  User copyWith(
      {String id,
      String githubId,
      String name,
      String avatar,
      int repoCount,
      int followerCount,
      int followingCount,
      List<String> languages,
      List<dynamic> popularRepos,
      List<dynamic> stars,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new User(
        id: id ?? this.id,
        githubId: githubId ?? this.githubId,
        name: name ?? this.name,
        avatar: avatar ?? this.avatar,
        repoCount: repoCount ?? this.repoCount,
        followerCount: followerCount ?? this.followerCount,
        followingCount: followingCount ?? this.followingCount,
        languages: languages ?? this.languages,
        popularRepos: popularRepos ?? this.popularRepos,
        stars: stars ?? this.stars,
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
