import 'package:countries/core/utils/AppNavigation.dart';
import 'package:countries/features/domain/usecases/countries/get_all_countries_use_case.dart';
import 'package:countries/features/presentation/pages/countires/counties_list_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'core/utils/AppStrings.dart';
import 'features/data/remote_data_source.dart';
import 'features/data/repositories_impl.dart';
import 'features/presentation/bloc/countries/countries_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final remoteDataSource = RemoteDataSourceImpl();
    final repos = RepositoriesImpl(remoteDataSource);
    final getAllCountriesUseCase = GetAllCountriesUseCase(repos);
    return ScreenUtilInit(
      designSize: const Size(393, 851),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<CountriesBloc>(
            create: (context) => CountriesBloc(
              getAllCountriesUseCase: getAllCountriesUseCase,
            ),
          ),
        ],
        child: GlobalLoaderOverlay(
          child: MaterialApp(
            title: AppStrings.appTitle,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.generateRoute,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const CountiesListScreen(),
          ),
        ),
      ),
    );
  }
}
