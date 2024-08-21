import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/countries/get_all_countries_use_case.dart';
import 'countries_event.dart';
import 'countries_state.dart';

class CountriesBloc extends Bloc<CountriesEvent, CountriesState> {
  final GetAllCountriesUseCase getAllCountriesUseCase;
  CountriesBloc({
    required this.getAllCountriesUseCase,
  }) : super(CountriesInitial()) {
    on<GetAllCountriesEvent>((event, emit) async {
      emit(CountriesLoadingState());

      final res = await getAllCountriesUseCase();

      res.fold(
        (failure) => emit(CountriesFailureState(failure.message)),
        (success) => emit(GetAllCountriesSuccessState(success)),
      );
    });
  }
}
