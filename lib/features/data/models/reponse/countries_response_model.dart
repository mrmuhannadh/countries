import 'package:countries/features/domain/entities/response/countries/countries_response_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'countries_response_model.g.dart';

@JsonSerializable()
class CountriesResponseModel extends CountriesResponseEntity {
  @JsonKey(name: "flags")
  final FlagsResponseModel flags;

  @JsonKey(name: "name")
  final NameResponseModel name;

  @JsonKey(name: "capital")
  final List<String> capital;

  @JsonKey(name: "region")
  final String region;

  @JsonKey(name: "languages")
  final Map<String, String> languages;

  @JsonKey(name: "population")
  final int population;

  const CountriesResponseModel({
    required this.flags,
    required this.name,
    required this.capital,
    required this.region,
    required this.languages,
    required this.population,
  }) : super(
          flags: flags,
          name: name,
          capital: capital,
          region: region,
          languages: languages,
          population: population,
        );

  factory CountriesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CountriesResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CountriesResponseModelToJson(this);
}

@JsonSerializable()
class FlagsResponseModel extends FlagsResponseEntity {
  @JsonKey(name: "png")
  final String? png;

  @JsonKey(name: "svg")
  final String? svg;

  @JsonKey(name: "alt")
  final String? alt;

  const FlagsResponseModel({
    this.png,
    this.svg,
    this.alt,
  }) : super(
          png: png,
          svg: svg,
          alt: alt,
        );

  factory FlagsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$FlagsResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$FlagsResponseModelToJson(this);
}

@JsonSerializable()
class NameResponseModel extends NameResponseEntity {
  @JsonKey(name: "common")
  final String? common;

  @JsonKey(name: "official")
  final String? official;

  const NameResponseModel({
    this.common,
    this.official,
  }) : super(
          common: common,
          official: official,
        );

  factory NameResponseModel.fromJson(Map<String, dynamic> json) =>
      _$NameResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$NameResponseModelToJson(this);
}
