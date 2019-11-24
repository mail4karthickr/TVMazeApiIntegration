import 'package:json_annotation/json_annotation.dart';
part 'show_info.g.dart';

@JsonSerializable(explicitToJson: true)
class ShowInfo {
  int id;
  String url;
  String name;
  String language;
  String status;
  double runTime;
  String officialSite;
  Rating rating;
  Image image;
  String summary;
  Network network;

  ShowInfo({this.id, this.url, this.name,
    this.language, this.status, this.runTime,
    this.officialSite, this.rating, this.image, this.summary});

  factory ShowInfo.fromJson(Map<String, dynamic> json) => _$ShowInfoFromJson(json);

  Map<String, dynamic> toJson() => _$ShowInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Rating {
  double average;

  Rating({this.average});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Network {
  int id;
  String name;
  Country country;

  Network({this.id, this.name, this.country});

  factory Network.fromJson(Map<String, dynamic> json) => _$NetworkFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Country {
  String name;
  String code;
  String timeZone;

  Country({this.name, this.code, this.timeZone});

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Image {
  String medium;
  String original;

  Image({this.medium, this.original});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}