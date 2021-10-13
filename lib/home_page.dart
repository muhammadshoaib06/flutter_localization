import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localization/shared_prefs.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Localization'.tr(),
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: MySharedPrefs.getLocale() == true
                  ? Alignment.centerLeft
                  : Alignment.centerRight,
              child: InkWell(
                  //onTap: onTapLanguage(context),
                  onTap: () {
                    bool? setLocale = MySharedPrefs.getLocale();
                    if (setLocale == true) {
                      EasyLocalization.of(context)!
                          .setLocale(Locale('ar', 'AR'));

                      MySharedPrefs.setLocale(langLocale: false);
                    } else {
                      EasyLocalization.of(context)!
                          .setLocale(Locale('en', 'EN'));
                      MySharedPrefs.setLocale(langLocale: true);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    margin: EdgeInsets.only(
                        left: MySharedPrefs.getLocale() != true ? 250 : 20,
                        right: MySharedPrefs.getLocale() == true ? 250 : 20),
                    decoration: BoxDecoration(
                        border: Border.all(
                      color: Colors.grey,
                      width: 1.5,
                    )),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.language,
                          size: 25,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'English'.tr(),
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          Expanded(
              child: Align(
            alignment: MySharedPrefs.getLocale() == true
                ? Alignment.topLeft
                : Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Hello'.tr(),
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
          )),
          Expanded(
              flex: 6,
              child: Align(
                alignment: MySharedPrefs.getLocale() == true
                    ? Alignment.topLeft
                    : Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Now you can convert text to different languages.'.tr(),
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
