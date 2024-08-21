import 'package:equatable/equatable.dart';

class CountriesResponseEntity extends Equatable {
  @override
  final FlagsResponseEntity flags;

  @override
  final NameResponseEntity name;

  @override
  final List<String> capital;

  @override
  final String region;

  @override
  final Map<String, String> languages;

  @override
  final int population;

  const CountriesResponseEntity({
    required this.flags,
    required this.name,
    required this.capital,
    required this.region,
    required this.languages,
    required this.population,
  });

  @override
  List<Object?> get props => [
        flags,
        name,
        capital,
        region,
        languages,
        population,
      ];
}

class FlagsResponseEntity extends Equatable {
  @override
  final String? png;

  @override
  final String? svg;

  @override
  final String? alt;

  const FlagsResponseEntity({
    this.png,
    this.svg,
    this.alt,
  });

  @override
  List<Object?> get props => [
        png,
        svg,
        alt,
      ];
}

class NameResponseEntity extends Equatable {
  @override
  final String? common;

  @override
  final String? official;

  const NameResponseEntity({
    this.common,
    this.official,
  });

  @override
  List<Object?> get props => [
        common,
        official,
      ];
}
