import 'package:countries/core/utils/AppStrings.dart';
import 'package:countries/core/utils/CommonFunctions.dart';
import 'package:countries/features/domain/entities/response/countries/countries_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CommonFunctions commonFunctions;

  setUp(() {
    commonFunctions = CommonFunctions();
  });

  //sort by population
  group('Sort countries by population', () {
    final countries = [
      const CountriesResponseEntity(
        flags: FlagsResponseEntity(),
        name: NameResponseEntity(common: 'Country A', official: 'Official A'),
        capital: ['Capital A'],
        region: 'Region A',
        languages: {'en': 'English'},
        population: 200,
      ),
      const CountriesResponseEntity(
        flags: FlagsResponseEntity(),
        name: NameResponseEntity(common: 'Country B', official: 'Official B'),
        capital: ['Capital B'],
        region: 'Region B',
        languages: {'en': 'English'},
        population: 100,
      ),
    ];

    //success scenario
    test('Sort countries by population success scenario', () {
      final sortedCountries =
          commonFunctions.sortCountries(countries, AppStrings.sortByPopulation);

      expect(sortedCountries[0].population, 100);
      expect(sortedCountries[1].population, 200);
    });

    //failure scenario
    test('Sort countries by population failure scenario', () {
      final sortedCountries =
          commonFunctions.sortCountries(countries, AppStrings.sortByPopulation);

      expect(sortedCountries[0].population, 200);
      expect(sortedCountries[1].population, 100);
    });
  });

  //sort by common name
  group('Sort countries by common name', () {
    final countries = [
      const CountriesResponseEntity(
        flags: FlagsResponseEntity(),
        name: NameResponseEntity(common: 'Country B', official: 'Official B'),
        capital: ['Capital B'],
        region: 'Region B',
        languages: {'en': 'English'},
        population: 100,
      ),
      const CountriesResponseEntity(
        flags: FlagsResponseEntity(),
        name: NameResponseEntity(common: 'Country A', official: 'Official A'),
        capital: ['Capital A'],
        region: 'Region A',
        languages: {'en': 'English'},
        population: 200,
      ),
    ];

    //success scenario
    test('Sort countries by common name success scenario', () {
      final sortedCountries =
          commonFunctions.sortCountries(countries, AppStrings.sortByName);

      expect(sortedCountries[0].name.common, 'Country A');
      expect(sortedCountries[1].name.common, 'Country B');
    });

    //failure scenario
    test('Sort countries by common name failure scenario', () {
      final sortedCountries =
          commonFunctions.sortCountries(countries, AppStrings.sortByName);

      expect(sortedCountries[0].name.common, 'Country B');
      expect(sortedCountries[1].name.common, 'Country A');
    });
  });

  //Sort by capital
  group('Sort countries by capital', () {
    final countries = [
      const CountriesResponseEntity(
        flags: FlagsResponseEntity(),
        name: NameResponseEntity(common: 'Country A', official: 'Official A'),
        capital: ['Capital B'],
        region: 'Region A',
        languages: {'en': 'English'},
        population: 200,
      ),
      const CountriesResponseEntity(
        flags: FlagsResponseEntity(),
        name: NameResponseEntity(common: 'Country B', official: 'Official B'),
        capital: ['Capital A'],
        region: 'Region B',
        languages: {'en': 'English'},
        population: 100,
      ),
    ];

    //success scenario
    test('Sort countries by capital success scenario', () {
      final sortedCountries =
          commonFunctions.sortCountries(countries, AppStrings.sortByCapital);

      expect(sortedCountries[0].capital[0], 'Capital A');
      expect(sortedCountries[1].capital[0], 'Capital B');
    });

    //failure scenario
    test('Sort countries by capital failure scenario', () {
      final sortedCountries =
          commonFunctions.sortCountries(countries, AppStrings.sortByCapital);

      expect(sortedCountries[0].capital[0], 'Capital B');
      expect(sortedCountries[1].capital[0], 'Capital A');
    });
  });
}
