library pairy.src.models.user;

import 'package:angel_model/angel_model.dart';
import 'package:angel_serialize/angel_serialize.dart';
part 'user.g.dart';
part 'user.serializer.g.dart';

@serializable
class _User extends Model {
  String githubId, name, avatar;
  int repoCount, followerCount, followingCount;
  List<String> languages;
  List<Repo> popularRepos, stars;
}

@Serializable(autoIdAndDateFields: false)
class _Repo {
  String name, description, language;
}