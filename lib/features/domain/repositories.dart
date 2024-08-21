import 'package:fpdart/fpdart.dart';

import '../../core/error/failure.dart';
import 'entities/response/countries/countries_response_entity.dart';

abstract interface class Repositories {
  Future<Either<Failure, List<CountriesResponseEntity>>> getAllCountries();
}
