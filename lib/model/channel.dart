// To parse this JSON data, do
//
//     final channel = channelFromJson(jsonString);

import 'dart:convert';

Channel channelFromJson(String str) => Channel.fromJson(json.decode(str));

String channelToJson(Channel data) => json.encode(data.toJson());

class Channel {
  Channel({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  String kind;
  String etag;
  String id;
  Snippet snippet;

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
    kind: json["kind"] == null ? null : json["kind"],
    etag: json["etag"] == null ? null : json["etag"],
    id: json["id"] == null ? null : json["id"],
    snippet: json["snippet"] == null ? null : Snippet.fromJson(json["snippet"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind == null ? null : kind,
    "etag": etag == null ? null : etag,
    "id": id == null ? null : id,
    "snippet": snippet == null ? null : snippet.toJson(),
  };
}

class Snippet {
  Snippet({
    this.title,
    this.description,
    this.customUrl,
    this.publishedAt,
    this.thumbnails,
    this.localized,
    this.country,
  });

  String title;
  String description;
  String customUrl;
  DateTime publishedAt;
  Thumbnails thumbnails;
  Localized localized;
  String country;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    customUrl: json["customUrl"] == null ? null : json["customUrl"],
    publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
    thumbnails: json["thumbnails"] == null ? null : Thumbnails.fromJson(json["thumbnails"]),
    localized: json["localized"] == null ? null : Localized.fromJson(json["localized"]),
    country: json["country"] == null ? null : json["country"],
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "customUrl": customUrl == null ? null : customUrl,
    "publishedAt": publishedAt == null ? null : publishedAt.toIso8601String(),
    "thumbnails": thumbnails == null ? null : thumbnails.toJson(),
    "localized": localized == null ? null : localized.toJson(),
    "country": country == null ? null : country,
  };
}

class Localized {
  Localized({
    this.title,
    this.description,
  });

  String title;
  String description;

  factory Localized.fromJson(Map<String, dynamic> json) => Localized(
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "description": description == null ? null : description,
  };
}

class Thumbnails {
  Thumbnails({
    this.thumbnailsDefault,
    this.medium,
    this.high,
  });

  Default thumbnailsDefault;
  Default medium;
  Default high;

  factory Thumbnails.fromJson(Map<String, dynamic> json) => Thumbnails(
    thumbnailsDefault: json["default"] == null ? null : Default.fromJson(json["default"]),
    medium: json["medium"] == null ? null : Default.fromJson(json["medium"]),
    high: json["high"] == null ? null : Default.fromJson(json["high"]),
  );

  Map<String, dynamic> toJson() => {
    "default": thumbnailsDefault == null ? null : thumbnailsDefault.toJson(),
    "medium": medium == null ? null : medium.toJson(),
    "high": high == null ? null : high.toJson(),
  };
}

class Default {
  Default({
    this.url,
    this.width,
    this.height,
  });

  String url;
  int width;
  int height;

  factory Default.fromJson(Map<String, dynamic> json) => Default(
    url: json["url"] == null ? null : json["url"],
    width: json["width"] == null ? null : json["width"],
    height: json["height"] == null ? null : json["height"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "width": width == null ? null : width,
    "height": height == null ? null : height,
  };
}
