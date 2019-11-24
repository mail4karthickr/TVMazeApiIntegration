// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowInfo _$ShowInfoFromJson(Map<String, dynamic> json) {
  return ShowInfo(
      id: json['id'] as int,
      url: json['url'] as String,
      name: json['name'] as String,
      language: json['language'] as String,
      status: json['status'] as String,
      runTime: (json['runTime'] as num)?.toDouble(),
      officialSite: json['officialSite'] as String,
      rating: json['rating'] == null
          ? null
          : Rating.fromJson(json['rating'] as Map<String, dynamic>),
      image: json['image'] == null
          ? null
          : Image.fromJson(json['image'] as Map<String, dynamic>),
      summary: json['summary'] as String)
    ..network = json['network'] == null
        ? null
        : Network.fromJson(json['network'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ShowInfoToJson(ShowInfo instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'language': instance.language,
      'status': instance.status,
      'runTime': instance.runTime,
      'officialSite': instance.officialSite,
      'rating': instance.rating?.toJson(),
      'image': instance.image?.toJson(),
      'summary': instance.summary,
      'network': instance.network?.toJson()
    };

Rating _$RatingFromJson(Map<String, dynamic> json) {
  return Rating(average: (json['average'] as num)?.toDouble());
}

Map<String, dynamic> _$RatingToJson(Rating instance) =>
    <String, dynamic>{'average': instance.average};

Network _$NetworkFromJson(Map<String, dynamic> json) {
  return Network(
      id: json['id'] as int,
      name: json['name'] as String,
      country: json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>));
}

Map<String, dynamic> _$NetworkToJson(Network instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'country': instance.country?.toJson()
    };

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
      name: json['name'] as String,
      code: json['code'] as String,
      timeZone: json['timeZone'] as String);
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'timeZone': instance.timeZone
    };

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
      medium: json['medium'] as String, original: json['original'] as String);
}

Map<String, dynamic> _$ImageToJson(Image instance) =>
    <String, dynamic>{'medium': instance.medium, 'original': instance.original};
