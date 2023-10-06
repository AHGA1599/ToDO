import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../my_theme.dart';
import '../provider/provider_screen.dart';
import 'language_screen.dart';
import 'mode_screen.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text( AppLocalizations.of(context)!.language
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              ShowLanguage(context);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: MyTheme.whitecolor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.applanguage == 'en'
                      ? AppLocalizations.of(context)!.english
                      : AppLocalizations.of(context)!.arabic),

                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text( AppLocalizations.of(context)!.mode
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              ShowMode(context);
            },
            child: Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: MyTheme.whitecolor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(provider.appTheme == ThemeMode.light ?
                      AppLocalizations.of(context)!.light
                      :
                  AppLocalizations.of(context)!.dark


                  ),
                  Icon(Icons.arrow_drop_down)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void ShowLanguage(context) {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageScreen());
  }

  void ShowMode(context) {
    showModalBottomSheet(context: context, builder: (context) => ModeScreen());
  }
}
