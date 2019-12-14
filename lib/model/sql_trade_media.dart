
enum MediaType {
    image, video
}

class SQLTradeMedia {
  final int id;
  final int tradeID;
  final MediaType type;
  final String path;

  SQLTradeMedia(this.id, this.tradeID, this.type, this.path);
  
}