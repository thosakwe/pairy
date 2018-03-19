library pairy.src.models.message;

import 'package:angel_model/angel_model.dart';
import 'package:angel_serialize/angel_serialize.dart';
part 'message.g.dart';
part 'message.serializer.g.dart';

@serializable
class _Message extends Model {
  String pairingId, userId, text;
}