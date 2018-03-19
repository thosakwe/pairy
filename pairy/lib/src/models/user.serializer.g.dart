// GENERATED CODE - DO NOT MODIFY BY HAND

part of pairy.src.models.user;

// **************************************************************************
// Generator: SerializerGenerator
// **************************************************************************

abstract class UserSerializer {
  static User fromMap(Map map) {
    return new User(
        id: map['id'],
        githubId: map['github_id'],
        name: map['name'],
        avatar: map['avatar'],
        repoCount: map['repo_count'],
        followerCount: map['follower_count'],
        followingCount: map['following_count'],
        languages: map['languages'],
        popularRepos: map['popular_repos'] is Iterable
            ? map['popular_repos'].map(RepoSerializer.fromMap).toList()
            : null,
        stars: map['stars'] is Iterable
            ? map['stars'].map(RepoSerializer.fromMap).toList()
            : null,
        createdAt: map['created_at'] != null
            ? DateTime.parse(map['created_at'])
            : null,
        updatedAt: map['updated_at'] != null
            ? DateTime.parse(map['updated_at'])
            : null);
  }

  static Map<String, dynamic> toMap(User model) {
    return {
      'id': model.id,
      'github_id': model.githubId,
      'name': model.name,
      'avatar': model.avatar,
      'repo_count': model.repoCount,
      'follower_count': model.followerCount,
      'following_count': model.followingCount,
      'languages': model.languages,
      'popular_repos': model.popularRepos?.map(RepoSerializer.toMap)?.toList(),
      'stars': model.stars?.map(RepoSerializer.toMap)?.toList(),
      'created_at': model.createdAt?.toIso8601String(),
      'updated_at': model.updatedAt?.toIso8601String()
    };
  }
}

abstract class UserFields {
  static const String id = 'id';

  static const String githubId = 'github_id';

  static const String name = 'name';

  static const String avatar = 'avatar';

  static const String repoCount = 'repo_count';

  static const String followerCount = 'follower_count';

  static const String followingCount = 'following_count';

  static const String languages = 'languages';

  static const String popularRepos = 'popular_repos';

  static const String stars = 'stars';

  static const String createdAt = 'created_at';

  static const String updatedAt = 'updated_at';
}

abstract class RepoSerializer {
  static Repo fromMap(Map map) {
    return new Repo(
        name: map['name'],
        description: map['description'],
        language: map['language']);
  }

  static Map<String, dynamic> toMap(Repo model) {
    return {
      'name': model.name,
      'description': model.description,
      'language': model.language
    };
  }
}

abstract class RepoFields {
  static const String name = 'name';

  static const String description = 'description';

  static const String language = 'language';
}
