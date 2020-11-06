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
    this.pageInfo,
    this.items,
  });

  String kind;
  String etag;
  PageInfo pageInfo;
  List<Item> items;

  factory Channel.fromJson(Map<String, dynamic> json) => Channel(
    kind: json["kind"] == null ? null : json["kind"],
    etag: json["etag"] == null ? null : json["etag"],
    pageInfo: json["pageInfo"] == null ? null : PageInfo.fromJson(json["pageInfo"]),
    items: json["items"] == null ? null : List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind == null ? null : kind,
    "etag": etag == null ? null : etag,
    "pageInfo": pageInfo == null ? null : pageInfo.toJson(),
    "items": items == null ? null : List<dynamic>.from(items.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.kind,
    this.etag,
    this.id,
    this.snippet,
    this.contentDetails,
  });

  String kind;
  String etag;
  String id;
  Snippet snippet;
  ContentDetails contentDetails;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    kind: json["kind"] == null ? null : json["kind"],
    etag: json["etag"] == null ? null : json["etag"],
    id: json["id"] == null ? null : json["id"],
    snippet: json["snippet"] == null ? null : Snippet.fromJson(json["snippet"]),
    contentDetails: json["contentDetails"] == null ? null : ContentDetails.fromJson(json["contentDetails"]),
  );

  Map<String, dynamic> toJson() => {
    "kind": kind == null ? null : kind,
    "etag": etag == null ? null : etag,
    "id": id == null ? null : id,
    "snippet": snippet == null ? null : snippet.toJson(),
    "contentDetails": contentDetails == null ? null : contentDetails.toJson(),
  };
}

class ContentDetails {
  ContentDetails({
    this.relatedPlaylists,
  });

  RelatedPlaylists relatedPlaylists;

  factory ContentDetails.fromJson(Map<String, dynamic> json) => ContentDetails(
    relatedPlaylists: json["relatedPlaylists"] == null ? null : RelatedPlaylists.fromJson(json["relatedPlaylists"]),
  );

  Map<String, dynamic> toJson() => {
    "relatedPlaylists": relatedPlaylists == null ? null : relatedPlaylists.toJson(),
  };
}

class RelatedPlaylists {
  RelatedPlaylists({
    this.likes,
    this.favorites,
    this.uploads,
  });

  String likes;
  String favorites;
  String uploads;

  factory RelatedPlaylists.fromJson(Map<String, dynamic> json) => RelatedPlaylists(
    likes: json["likes"] == null ? null : json["likes"],
    favorites: json["favorites"] == null ? null : json["favorites"],
    uploads: json["uploads"] == null ? null : json["uploads"],
  );

  Map<String, dynamic> toJson() => {
    "likes": likes == null ? null : likes,
    "favorites": favorites == null ? null : favorites,
    "uploads": uploads == null ? null : uploads,
  };
}

class Snippet {
  Snippet({
    this.title,
    this.description,
    this.publishedAt,
    this.thumbnails,
    this.defaultLanguage,
    this.localized,
  });

  String title;
  String description;
  DateTime publishedAt;
  Thumbnails thumbnails;
  String defaultLanguage;
  Localized localized;

  factory Snippet.fromJson(Map<String, dynamic> json) => Snippet(
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    publishedAt: json["publishedAt"] == null ? null : DateTime.parse(json["publishedAt"]),
    thumbnails: json["thumbnails"] == null ? null : Thumbnails.fromJson(json["thumbnails"]),
    defaultLanguage: json["defaultLanguage"] == null ? null : json["defaultLanguage"],
    localized: json["localized"] == null ? null : Localized.fromJson(json["localized"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "publishedAt": publishedAt == null ? null : publishedAt.toIso8601String(),
    "thumbnails": thumbnails == null ? null : thumbnails.toJson(),
    "defaultLanguage": defaultLanguage == null ? null : defaultLanguage,
    "localized": localized == null ? null : localized.toJson(),
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

class PageInfo {
  PageInfo({
    this.totalResults,
    this.resultsPerPage,
  });

  int totalResults;
  int resultsPerPage;

  factory PageInfo.fromJson(Map<String, dynamic> json) => PageInfo(
    totalResults: json["totalResults"] == null ? null : json["totalResults"],
    resultsPerPage: json["resultsPerPage"] == null ? null : json["resultsPerPage"],
  );

  Map<String, dynamic> toJson() => {
    "totalResults": totalResults == null ? null : totalResults,
    "resultsPerPage": resultsPerPage == null ? null : resultsPerPage,
  };
}
