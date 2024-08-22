import 'package:countries/features/data/models/response/countries_response_model.dart';
import 'package:countries/features/data/remote_data_source.dart';
import 'package:countries/features/domain/repositories.dart';
import 'package:fpdart/fpdart.dart';

import '../../core/error/exceptions.dart';
import '../../core/error/failure.dart';

class RepositoriesImpl implements Repositories {
  final RemoteDataSource remoteDataSource;

  RepositoriesImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<CountriesResponseModel>>>
      getAllCountries() async {
    try {
      final response = await remoteDataSource.getAllCountries();

      return right(response);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
