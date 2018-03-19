library pairy.src.models.github_user;

import 'package:angel_serialize/angel_serialize.dart';

part 'github_user.g.dart';

part 'github_user.serializer.g.dart';

@Serializable(autoIdAndDateFields: false)
class _GithubUser {
  String login, avatarUrl, followersUrl, followingUrl, starredUrl, bio, name;
  int id, publicRepos, followers, following;
  DateTime createdAt, updatedAt;
}
