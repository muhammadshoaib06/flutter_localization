import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/shared_prefs.dart';

import 'home_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// for languages
  await EasyLocalization.ensureInitialized();
  await MySharedPrefs.init();
  MySharedPrefs.setLocale(langLocale: true);
  runApp(EasyLocalization(

      /// List all of the app's supported locales here
      supportedLocales: [Locale('en', 'EN'), Locale('ar', 'AR')],
      saveLocale: true,
      startLocale: Locale('en', 'EN'),
      path: 'assets/translation',
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Localization',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: HomePage(),
    );
  }
}
