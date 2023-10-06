import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../my_theme.dart';
import '../provider/provider_screen.dart';

class LanguageScreen extends StatefulWidget {
  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          InkWell(
            onTap: () {
              provider.changLanguage('en');
            },
            child: provider.applanguage=='en'?
                getSelectedItem(AppLocalizations.of(context)!.english)
                :getUnSelectedItem(AppLocalizations.of(context)!.english)

            ,
          ),
          InkWell(
            onTap: () {
              provider.changLanguage('ar');

            },
            child:provider.applanguage=='ar'?
            getSelectedItem(AppLocalizations.of(context)!.arabic)
                :getUnSelectedItem(AppLocalizations.of(context)!.arabic) ,
          ),
        ],
      ),
    );
  }

  Widget getSelectedItem(String text){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: MyTheme.primarylight),
          ),
          Icon(
            Icons.check_outlined,
            size: 30,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
  Widget getUnSelectedItem (String text){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text,
          style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
