/// status : "ok"
/// totalResults : 1984
/// articles : [{"source":{"id":"wired","name":"Wired"},"author":"Adrienne So","title":"The Apple Watch Turns 10. Here's How Far It's Come","description":"When the Apple Watch launched, it was unclear if smartwatches would pan out. Ten years later, Apple has\na $100-billion hit that reshaped the watch industry and ushered in a new age of fitness tracking.","url":"https://www.wired.com/story/apple-watch-turns-10/","urlToImage":"https://media.wired.com/photos/6809646e58f463c0470389a0/191:100/w_1280,c_limit/Apple-Watch-10th-Anniversary_042025_Lede.jpg","publishedAt":"2025-04-24T14:02:22Z","content":"Every year, Apple launches one standout health feature, from measuring VO2 Max on the Series 3 to the ECG\nsensor on the Series 4, all the way to sleep apnea notifications on the Series 10. If you zoo… [+2825 chars]"},{"source":{"id":"wired","name":"Wired"},"author":"Brenda Stolyar","title":"22 Best MacBook Accessories (2025), Tested and Reviewed","description":"From charging adapters to external monitors, we’ve gathered the essential peripherals for your Apple\nlaptop.","url":"https://www.wired.com/gallery/best-macbook-accessories/","urlToImage":"https://media.wired.com/photos/680971b8740117201b72f852/191:100/w_2580,c_limit/Best-MacBook-Accessories_042025_Lede.jpg","publishedAt":"2025-04-24T12:30:00Z","content":"More Good Accessories..."},{"source":{"id":"wired","name":"Wired"},"author":"Reece Rogers","title":"How to Use Instagram Edits, Meta’s New CapCut Clone for Editing Videos","description":"Instagram’s long-promised video-editing app is out now. Here’s how to use Edits to make Reels, and how\nthe software differs from TikTok’s CapCut.","url":"https://www.wired.com/story/how-to-use-instagram-edits-capcut-clone/","urlToImage":"https://media.wired.com/photos/6809531af0d9ff7ab518fc92/191:100/w_1280,c_limit/Instagram-Edits-Gear-Edits-logo-still.jpg","publishedAt":"2025-04-24T11:00:00Z","content":"In January, Meta announced its stand-alone video editing app..."},{"source":{"id":"the-verge","name":"The Verge"},"author":"Jay Peters","title":"Nintendo Switch 2 preorders are off to a messy start","description":"Nintendo’s delayed Switch 2 preorders finally kicked off in the US at 12AM ET, but there have already\nbeen a lot of problems.","url":"https://www.theverge.com/news/654571/nintendo-switch-2-preorders-issues-problems","urlToImage":"https://platform.theverge.com/wp-content/uploads/sites/2/2025/04/STKR001_NINTENDO_SWITCH_4_A.jpg?quality=90&strip=all&crop=0%2C10.732984293194%2C100%2C78.534031413613&w=1200","publishedAt":"2025-04-24T04:32:03Z","content":"Preorders finally started, but there have been issues..."},{"source":{"id":"the-verge","name":"The Verge"},"author":"Nilay Patel","title":"Former DOJ antitrust chief says a Google break up will benefit the internet","description":"Talking about the possibility that the US government might break up Google.","url":"https://www.theverge.com/decoder-podcast-with-nilay-patel/654243/jonathan-kanter-antitrust-google-ad-tech-monopoly-doj","urlToImage":"https://platform.theverge.com/wp-content/uploads/sites/2/2025/04/DCD_Kanter_0424.jpg?quality=90&strip=all&crop=0%2C10.732984293194%2C100%2C78.534031413613&w=1200","publishedAt":"2025-04-24T14:00:24Z","content":"Former DOJ antitrust chief says a Google break up will benefit the internet..."},{"source":{"id":null,"name":"Android Central"},"author":"techkritiko@gmail.com (Jay Bonggolto)","title":"Samsung's next Galaxy Unpacked event could be heading back to New York","description":"The next Galaxy foldables are tipped to make their debut at the Big Apple in July.","url":"https://www.androidcentral.com/phones/samsung-galaxy/samsungs-unpacked-could-take-place-in-new-york","urlToImage":"https://cdn.mos.cms.futurecdn.net/fuufQZJjTExfx3hvHyCL2K.jpg","publishedAt":"2025-04-24T06:01:02Z","content":"What you need to know..."},{"source":{"id":null,"name":"Android Central"},"author":"derrek.lee@futurenet.com (Derrek Lee)","title":"Motorola Razr 2025 hands-on: A significant strategy shift","description":"Motorola's new Razr Ultra is impressive, overshadowing the other devices with both specs and price.","url":"https://www.androidcentral.com/phones/motorola/motorola-razr-2025-series-hands-on","urlToImage":"https://cdn.mos.cms.futurecdn.net/koLWjXKCDwQYaL7Ksi9VWd.jpg","publishedAt":"2025-04-24T16:00:00Z","content":"Motorola's 2025 Razr series is officially here..."},{"source":{"id":null,"name":"MacRumors"},"author":"Juli Clover","title":"Everything Rumored for the 2025 Apple Watch Series 11","description":"As we celebrate the 10th anniversary of the Apple Watch today, we thought we'd take a look at what Apple\nhas in store for the next-generation version of the device that's coming this fall.","url":"https://www.macrumors.com/guide/apple-watch-series-11/","urlToImage":"https://images.macrumors.com/t/jdzZpnmsQKKjg1ZYdw-RuMLwE7Y=/2500x/article-new/2025/03/apple-watch-series-10-blue-hue.jpeg","publishedAt":"2025-04-24T23:52:26Z","content":"As we celebrate the 10th anniversary of the Apple Watch today..."},{"source":{"id":null,"name":"MacRumors"},"author":"Joe Rossignol","title":"Apple Stores Giving Away a Limited-Edition Pin For Free Today","description":"Starting today, April 24, Apple Stores around the world are giving away a special pin for free to\ncustomers who request one.","url":"https://www.macrumors.com/2025/04/24/apple-stores-to-give-away-special-pin/","urlToImage":"https://images.macrumors.com/t/HDst_1PuD9uyLIe8E_ZvtSluGnU=/1600x/article-new/2025/04/Apple-Activity-Rings-Graphic.jpg","publishedAt":"2025-04-24T17:15:00Z","content":"Starting today, April 24, Apple Stores around the world are giving away a special pin..."}]

class NewsModel {
  NewsModel({String? status, num? totalResults, List<Articles>? articles}) {
    _status = status;
    _totalResults = totalResults;
    _articles = articles;
  }

  NewsModel.fromJson(dynamic json) {
    _status = json['status'];
    _totalResults = json['totalResults'];
    if (json['articles'] != null) {
      _articles = [];
      json['articles'].forEach((v) {
        _articles?.add(Articles.fromJson(v));
      });
    }
  }

  String? _status;
  num? _totalResults;
  List<Articles>? _articles;

  NewsModel copyWith({
    String? status,
    num? totalResults,
    List<Articles>? articles,
  }) => NewsModel(
    status: status ?? _status,
    totalResults: totalResults ?? _totalResults,
    articles: articles ?? _articles,
  );

  String? get status => _status;

  num? get totalResults => _totalResults;

  List<Articles>? get articles => _articles;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['totalResults'] = _totalResults;
    if (_articles != null) {
      map['articles'] = _articles?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// source : {"id":"wired","name":"Wired"}
/// author : "Adrienne So"
/// title : "The Apple Watch Turns 10. Here's How Far It's Come"
/// description : "When the Apple Watch launched, it was unclear if smartwatches would pan out. Ten years later, Apple has\na $100-billion hit that reshaped the watch industry and ushered in a new age of fitness tracking."
/// url : "https://www.wired.com/story/apple-watch-turns-10/"
/// urlToImage : "https://media.wired.com/photos/6809646e58f463c0470389a0/191:100/w_1280,c_limit/Apple-Watch-10th-Anniversary_042025_Lede.jpg"
/// publishedAt : "2025-04-24T14:02:22Z"
/// content : "Every year, Apple launches one standout health feature, from measuring VO2 Max on the Series 3 to the ECG\nsensor on the Series 4, all the way to sleep apnea notifications on the Series 10. If you zoo… [+2825 chars]"

class Articles {
  Articles({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) {
    _source = source;
    _author = author;
    _title = title;
    _description = description;
    _url = url;
    _urlToImage = urlToImage;
    _publishedAt = publishedAt;
    _content = content;
  }

  Articles.fromJson(dynamic json) {
    _source = json['source'] != null ? Source.fromJson(json['source']) : null;
    _author = json['author'];
    _title = json['title'];
    _description = json['description'];
    _url = json['url'];
    _urlToImage = json['urlToImage'];
    _publishedAt = json['publishedAt'];
    _content = json['content'];
  }

  Source? _source;
  String? _author;
  String? _title;
  String? _description;
  String? _url;
  String? _urlToImage;
  String? _publishedAt;
  String? _content;

  Articles copyWith({
    Source? source,
    String? author,
    String? title,
    String? description,
    String? url,
    String? urlToImage,
    String? publishedAt,
    String? content,
  }) => Articles(
    source: source ?? _source,
    author: author ?? _author,
    title: title ?? _title,
    description: description ?? _description,
    url: url ?? _url,
    urlToImage: urlToImage ?? _urlToImage,
    publishedAt: publishedAt ?? _publishedAt,
    content: content ?? _content,
  );

  Source? get source => _source;

  String? get author => _author;

  String? get title => _title;

  String? get description => _description;

  String? get url => _url;

  String? get urlToImage => _urlToImage;

  String? get publishedAt => _publishedAt;

  String? get content => _content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_source != null) {
      map['source'] = _source?.toJson();
    }
    map['author'] = _author;
    map['title'] = _title;
    map['description'] = _description;
    map['url'] = _url;
    map['urlToImage'] = _urlToImage;
    map['publishedAt'] = _publishedAt;
    map['content'] = _content;
    return map;
  }
}

/// id : "wired"
/// name : "Wired"

class Source {
  Source({String? id, String? name}) {
    _id = id;
    _name = name;
  }

  Source.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }

  String? _id;
  String? _name;

  Source copyWith({String? id, String? name}) =>
      Source(id: id ?? _id, name: name ?? _name);

  String? get id => _id;

  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }
}
