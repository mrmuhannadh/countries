import 'package:countries/features/domain/entities/response/countries/countries_response_entity.dart';

//Using arguments to pass the value for detailed view
class CountriesArguments {
  final CountriesResponseEntity countriesResponseEntity;

  CountriesArguments({required this.countriesResponseEntity});
}
