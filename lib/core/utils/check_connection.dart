import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../features/presentation/bloc/countries/countries_bloc.dart';
import '../../features/presentation/bloc/countries/countries_event.dart';
import 'AppStrings.dart';

class CheckConnection {
  //This is to check the network connection before the API call
  late StreamSubscription _streamSubscription;
  bool isDeviceConnected = false;
  bool isAlert = false;

  void internetConnection(BuildContext context) {
    _streamSubscription =
        Connectivity().onConnectivityChanged.listen((result) async {
      await _checkConnectionAndProceed(context);
    });
  }

  Future<void> _checkConnectionAndProceed(BuildContext context) async {
    bool isDeviceConnected = await InternetConnectionChecker().hasConnection;

    if (isDeviceConnected) {
      if (isAlert) {
        isAlert = false;
      }

      //Call the event if connection is okay
      context.read<CountriesBloc>().add(GetAllCountriesEvent());
    } else {
      if (!isAlert) {
        _showDialogBox(context);

        isAlert = true;
      }
    }
  }

  void _showDialogBox(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text(AppStrings.connectionError),
          content: const Text(AppStrings.connectionErrorMessage),
          actions: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context);

                isAlert = false;

                //repeat the dialog until device connect the internet
                await _checkConnectionAndProceed(context);
              },
              child: const Text(AppStrings.okLabel),
            ),
          ],
        );
      },
    );
  }

  void dispose() {
    _streamSubscription.cancel();
  }
}
