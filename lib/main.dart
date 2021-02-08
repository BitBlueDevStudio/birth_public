import 'package:birth_days_app/src/presentation/bloc/app_bloc.dart';
import 'package:birth_days_app/src/presentation/ui/screens/home_screen.dart';
import 'package:birth_days_app/src/presentation/ui/screens/menu_screen.dart';
import 'package:birth_days_app/src/utils/app_helpers.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:birth_days_app/src/utils/locale_helper/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(BirthApp());
}


class BirthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //Intl.defaultLocale="en_US";
    //S.load(Locale('en', 'US'));

    return BlocProvider(
        create: (context) => AppBloc(Intl.defaultLocale)
         // ..initTestData()
        ,
        child: BlocBuilder<AppBloc,AppBlocState>( builder: (cont,state) {
          return MaterialApp(
            //title: S.of(cont).appName,
            onGenerateTitle: (context) {
              return S.of(context).appName;
            },
            /*localeResolutionCallback: (deviceLocale, supportedLocales) {
              Intl.defaultLocale=deviceLocale.scriptCode;
              return deviceLocale;
            },*/
            localizationsDelegates: [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: ThemeData(

              primarySwatch: Colors.blue,
              visualDensity: VisualDensity.adaptivePlatformDensity,
            ),
            initialRoute: RoutesHelper.routeHome,
            routes: {
              RoutesHelper.routeHome: (ctx) => HomeScreen(),
              RoutesHelper.routeMenu: (ctx) => MenuScreen(),
            },
            //home: HomeScreen()
          );
        }
        ));
  }
}