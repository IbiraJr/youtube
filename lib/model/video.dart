// To parse this JSON data, do
//
//     final video = videoFromJson(jsonString);

import 'dart:convert';

List<Video> videoFromJson(String str) => List<Video>.from(json.decode(str).map((x) => Video.fromJson(x)));

String videoToJson(List<Video> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Video {
  Video({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
  });

  String kind;
  String etag;
  Id id;
  Snippet snippet;

  factory Video.fromJson(Map<String, dynamic> json) => Video(
    kind: json["kind"] == null ? null : json["kind"],
    etag: json["etag"] == null ? null : json["etag"],
    id: json["id"] == null ? null : Id.fromJson(json["id"]),
    snippet: json["snippet"] == null ? null : Snippet.fromJson(json["snippet"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind == null ? null : kind,
    "etag": etag == null ? null : etag,
    "id": id == null ? null : id.toJson(),
    "snippet": snippet == null ? null : snippet.toJson(),
  };
}

class Id {
  Id({
    this.kind,
    this.videoId,
  });

  String kind;
  String videoId;

  factory Id.fromJson(Map<String, dynamic> json) => Id(
    kind: json["kind"] == null ? null : json["kind"],
    videoId: json["videoId"] == null ? null : json["videoId"],
  );

  Map<String, dynamic> toJson() => {
    "kind": kind == null ? null : kind,
    "videoId": videoId == null ? null : videoId,
  };
}

class Snippet {
  Snippet({
    this.publishedAt,
    this.channelId,
    this.title,
    this.description,
    this.thumbnails,
    this.channelTitle,
    this.liveBroadcastContent,
    this.publishTime,
  });

  DateTime publishedAt;
  String channelId;
  String title;
  String description;
  Thumbnails thumbnails;
  String channelTitle;
  String liveBroadcastContent;
  DateTime publishTime;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
    publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
    channelId: json["channelId"] == null ? null : json["channelId"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    thumbnails: json["thumbnails"] == null ? null : Thumbnails.fromJson(json["thumbnails"]),
    channelTitle: json["channelTitle"] == null ? null : json["channelTitle"],
    liveBroadcastContent: json["liveBroadcastContent"] == null ? null : json["liveBroadcastContent"],
    publishTime: json["publishTime"] == null ? null : DateTime.parse(json["publishTime"]),
  );

  Map<String, dynamic> toJson() => {
    "publishedAt": publishedAt == null ? null : publishedAt.toIso8601String(),
    "channelId": channelId == null ? null : channelId,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "thumbnails": thumbnails == null ? null : thumbnails.toJson(),
    "channelTitle": channelTitle == null ? null : channelTitle,
    "liveBroadcastContent": liveBroadcastContent == null ? null : liveBroadcastContent,
    "publishTime": publishTime == null ? null : publishTime.toIso8601String(),
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
