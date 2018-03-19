library pairy.src.models.pairing;

import 'package:angel_model/angel_model.dart';
import 'package:angel_serialize/angel_serialize.dart';
part 'pairing.g.dart';
part 'pairing.serializer.g.dart';

@serializable
class _Pairing extends Model {
  String user1, user2;
}