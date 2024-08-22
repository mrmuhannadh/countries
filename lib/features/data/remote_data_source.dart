import 'package:countries/features/data/models/response/countries_response_model.dart';
import 'package:dio/dio.dart';

abstract interface class RemoteDataSource {
  Future<List<CountriesResponseModel>> getAllCountries();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final dio = Dio();

  @override
  Future<List<CountriesResponseModel>> getAllCountries() async {
    try {
      final res = await dio.get(
        'https://restcountries.com/v3.1/region/europe?fields=name,capital,flags,region,languages,population,capital',
      );

      final List<dynamic> dataList = res.data;

      final List<CountriesResponseModel> response = dataList.map((data) {
        return CountriesResponseModel.fromJson(data as Map<String, dynamic>);
      }).toList();

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
