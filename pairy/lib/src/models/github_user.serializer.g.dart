// GENERATED CODE - DO NOT MODIFY BY HAND

part of pairy.src.models.github_user;

// **************************************************************************
// Generator: SerializerGenerator
// **************************************************************************

abstract class GithubUserSerializer {
  static GithubUser fromMap(Map map) {
    return new GithubUser(
        login: map['login'],
        avatarUrl: map['avatar_url'],
        followersUrl: map['followers_url'],
        followingUrl: map['following_url'],
        starredUrl: map['starred_url'],
        bio: map['bio'],
        name: map['name'],
        id: map['id'],
        publicRepos: map['public_repos'],
        followers: map['followers'],
        following: map['following'],
        createdAt: map['created_at'] != null
            ? DateTime.parse(map['created_at'])
            : null,
        updatedAt: map['updated_at'] != null
            ? DateTime.parse(map['updated_at'])
            : null);
  }

  static Map<String, dynamic> toMap(GithubUser model) {
    return {
      'login': model.login,
      'avatar_url': model.avatarUrl,
      'followers_url': model.followersUrl,
      'following_url': model.followingUrl,
      'starred_url': model.starredUrl,
      'bio': model.bio,
      'name': model.name,
      'id': model.id,
      'public_repos': model.publicRepos,
      'followers': model.followers,
      'following': model.following,
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class GithubUserFields {
  static const String login = 'login';

  static const String avatarUrl = 'avatar_url';

  static const String followersUrl = 'followers_url';

  static const String followingUrl = 'following_url';

  static const String starredUrl = 'starred_url';

  static const String bio = 'bio';

  static const String name = 'name';

  static const String id = 'id';

  static const String publicRepos = 'public_repos';

  static const String followers = 'followers';

  static const String following = 'following';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}
