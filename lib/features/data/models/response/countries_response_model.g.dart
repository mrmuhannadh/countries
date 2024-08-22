// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'countries_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CountriesResponseModel _$CountriesResponseModelFromJson(
        Map<String, dynamic> json) =>
    CountriesResponseModel(
      flags: FlagsResponseModel.fromJson(json['flags'] as Map<String, dynamic>),
      name: NameResponseModel.fromJson(json['name'] as Map<String, dynamic>),
      capital:
          (json['capital'] as List<dynamic>).map((e) => e as String).toList(),
      region: json['region'] as String,
      languages: Map<String, String>.from(json['languages'] as Map),
      population: (json['population'] as num).toInt(),
    );

Map<String, dynamic> _$CountriesResponseModelToJson(
        CountriesResponseModel instance) =>
    <String, dynamic>{
      'flags': instance.flags,
      'name': instance.name,
      'capital': instance.capital,
      'region': instance.region,
      'languages': instance.languages,
      'population': instance.population,
    };

FlagsResponseModel _$FlagsResponseModelFromJson(Map<String, dynamic> json) =>
    FlagsResponseModel(
      png: json['png'] as String?,
      svg: json['svg'] as String?,
      alt: json['alt'] as String?,
    );

Map<String, dynamic> _$FlagsResponseModelToJson(FlagsResponseModel instance) =>
    <String, dynamic>{
      'png': instance.png,
      'svg': instance.svg,
      'alt': instance.alt,
    };

NameResponseModel _$NameResponseModelFromJson(Map<String, dynamic> json) =>
    NameResponseModel(
      common: json['common'] as String?,
      official: json['official'] as String?,
    );

Map<String, dynamic> _$NameResponseModelToJson(NameResponseModel instance) =>
    <String, dynamic>{
      'common': instance.common,
      'official': instance.official,
    };
