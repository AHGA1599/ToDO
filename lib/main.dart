import 'package:atodo/provider/provider_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen/home_screen.dart';
import 'list_tab/edit_list.dart';
import 'my_theme.dart';
//import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();

  runApp(ChangeNotifierProvider(
    create: (context) => AppConfigProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<AppConfigProvider>(context);
    intiShared();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        EditList.routeName: (context) => EditList(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.applanguage),
      theme: MyTheme.LightMode,
      themeMode: provider.appTheme,
      darkTheme: MyTheme.darkMode,
    );
  }

  intiShared() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String lang = prefs.getString('lang') ?? 'en';
    String theme= prefs.getString('theme')?? 'light';
    provider.changLanguage(lang);
    provider.changTheme(theme== 'light'? ThemeMode.light:ThemeMode.dark);
  }
}
