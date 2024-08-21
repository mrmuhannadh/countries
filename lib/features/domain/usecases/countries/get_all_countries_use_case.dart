import 'package:countries/features/domain/entities/response/countries/countries_response_entity.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/useCase.dart';
import '../../repositories.dart';

class GetAllCountriesUseCase
    implements UseCase<List<CountriesResponseEntity>, NoParams> {
  final Repositories repositories;

  GetAllCountriesUseCase(this.repositories);

  @override
  Future<Either<Failure, List<CountriesResponseEntity>>> call(
      [NoParams? params]) async {
    return await repositories.getAllCountries();
  }
}
