// GENERATED CODE - DO NOT MODIFY BY HAND

part of pairy.src.models.github_user;

// **************************************************************************
// Generator: JsonModelGenerator
// **************************************************************************

class GithubUser extends _GithubUser {
  GithubUser(
      {this.login,
      this.avatarUrl,
      this.followersUrl,
      this.followingUrl,
      this.starredUrl,
      this.bio,
      this.name,
      this.id,
      this.publicRepos,
      this.followers,
      this.following,
      this.createdAt,
      this.updatedAt});

  @override
  final String login;

  @override
  final String avatarUrl;

  @override
  final String followersUrl;

  @override
  final String followingUrl;

  @override
  final String starredUrl;

  @override
  final String bio;

  @override
  final String name;

  @override
  final int id;

  @override
  final int publicRepos;

  @override
  final int followers;

  @override
  final int following;

  @override
  final DateTime createdAt;

  @override
  final DateTime updatedAt;

  GithubUser copyWith(
      {String login,
      String avatarUrl,
      String followersUrl,
      String followingUrl,
      String starredUrl,
      String bio,
      String name,
      int id,
      int publicRepos,
      int followers,
      int following,
      DateTime createdAt,
      DateTime updatedAt}) {
    return new GithubUser(
        login: login ?? this.login,
        avatarUrl: avatarUrl ?? this.avatarUrl,
        followersUrl: followersUrl ?? this.followersUrl,
        followingUrl: followingUrl ?? this.followingUrl,
        starredUrl: starredUrl ?? this.starredUrl,
        bio: bio ?? this.bio,
        name: name ?? this.name,
        id: id ?? this.id,
        publicRepos: publicRepos ?? this.publicRepos,
        followers: followers ?? this.followers,
        following: following ?? this.following,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt);
  }

  Map<String, dynamic> toJson() {
    return GithubUserSerializer.toMap(this);
  }
}
