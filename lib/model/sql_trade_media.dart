
import 'package:giftmoney/json_mapper/mappable.dart';

enum MediaType {
    image, video
}

const Map<String, MediaType> MediaTypeMap = {
  'image': MediaType.image,
  'video': MediaType.video
};

class SQLTradeMedia extends Mappable {
  String uuid;
  String tradeID;
  MediaType type;
  String path;

  SQLTradeMedia({this.uuid, this.tradeID, this.type, this.path}) : super.fromJSON(null);

  SQLTradeMedia.fromJSON(Map<String, dynamic> map) : super.fromJSON(null) {
    uuid = transformBasic(map['uuid']);
    tradeID = transformBasic(map['tradeID']);
    type = transformEnum(map['type'], MediaTypeMap);
    path = transformBasic(map['personID']);
  }

  @override
  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      'uuid': uuid,
      'tradeID': tradeID,
      'type': serializeEnum(type, MediaTypeMap),
      'path': path
    };
  }
}