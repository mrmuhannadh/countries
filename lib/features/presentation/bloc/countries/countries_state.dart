import '../../../domain/entities/response/countries/countries_response_entity.dart';

sealed class CountriesState {}

final class CountriesInitial extends CountriesState {}

final class CountriesLoadingState extends CountriesState {}

final class GetAllCountriesSuccessState extends CountriesState {
  final List<CountriesResponseEntity> countriesResponseEntity;

  GetAllCountriesSuccessState(this.countriesResponseEntity);
}

final class CountriesFailureState extends CountriesState {
  final String message;

  CountriesFailureState(this.message);
}
