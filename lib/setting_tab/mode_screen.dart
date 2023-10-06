import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../my_theme.dart';
import '../provider/provider_screen.dart';

class ModeScreen extends StatefulWidget {
  @override
  State<ModeScreen> createState() => _ModeScreenState();
}

class _ModeScreenState extends State<ModeScreen> {
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
                provider.changTheme(ThemeMode.light);
              },
              child: provider.appTheme == ThemeMode.light
                  ? getSelectedItem(AppLocalizations.of(context)!.light)
                  : getUnSelectedItem(AppLocalizations.of(context)!.light)),
          InkWell(
            onTap: () {
              provider.changTheme(ThemeMode.dark);
            },
            child: provider.appTheme == ThemeMode.dark ?
                getSelectedItem(AppLocalizations.of(context)!.dark)
            :getUnSelectedItem(AppLocalizations.of(context)!.dark),

          ),
        ],
      ),
    );
  }

  Widget getSelectedItem(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
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

  Widget getUnSelectedItem(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text, style: Theme.of(context).textTheme.titleMedium),
    );
  }
}
