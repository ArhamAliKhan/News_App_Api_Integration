/// news : [{"imageUrl":"https://farmonaut.com/wp-content/uploads/2025/01/Global-Market-Turmoil-How-US-Dollar-Strength-and-Rising-Yields-Impact-World-Economy_1.jpg","headline":"Global markets rise amid new hopes"},{"imageUrl":"https://diplo-media.s3.eu-central-1.amazonaws.com/2024/07/partners-handshake-ai-companies-1024x585.jpg","headline":"Tech companies launch innovative solutions"},{"imageUrl":"https://medcitynews.com/wp-content/uploads/sites/7/2019/11/GettyImages-638646884-600x400.jpg","headline":"Health experts warn about new variant"},{"imageUrl":"https://img.freepik.com/free-photo/sports-tools_53876-138077.jpg?semt=ais_hybrid&w=740","headline":"Sports world shocked by team victory"},{"imageUrl":"https://climate.nasa.gov/system/internal_resources/details/original/103_shutterstock_88550854-740px.jpg","headline":"Climate talks spark worldwide attention"}]

class BreakingNews {
  BreakingNews({
      List<News>? news,}){
    _news = news;
}

  BreakingNews.fromJson(dynamic json) {
    if (json['news'] != null) {
      _news = [];
      json['news'].forEach((v) {
        _news?.add(News.fromJson(v));
      });
    }
  }
  List<News>? _news;
BreakingNews copyWith({  List<News>? news,
}) => BreakingNews(  news: news ?? _news,
);
  List<News>? get news => _news;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_news != null) {
      map['news'] = _news?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// imageUrl : "https://farmonaut.com/wp-content/uploads/2025/01/Global-Market-Turmoil-How-US-Dollar-Strength-and-Rising-Yields-Impact-World-Economy_1.jpg"
/// headline : "Global markets rise amid new hopes"

class News {
  News({
      String? imageUrl, 
      String? headline,}){
    _imageUrl = imageUrl;
    _headline = headline;
}

  News.fromJson(dynamic json) {
    _imageUrl = json['imageUrl'];
    _headline = json['headline'];
  }
  String? _imageUrl;
  String? _headline;
News copyWith({  String? imageUrl,
  String? headline,
}) => News(  imageUrl: imageUrl ?? _imageUrl,
  headline: headline ?? _headline,
);
  String? get imageUrl => _imageUrl;
  String? get headline => _headline;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['imageUrl'] = _imageUrl;
    map['headline'] = _headline;
    return map;
  }

}