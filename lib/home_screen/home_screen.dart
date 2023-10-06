import 'package:atodo/home_screen/taske_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../list_tab/list_screen.dart';
import '../setting_tab/settings_screen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'toDoList';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.titel,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: selectedindex,
          onTap: (index) {
            selectedindex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: AppLocalizations.of(context)!.list),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: AppLocalizations.of(context)!.setting,
            ),
          ],
        ),
      ),
      body: tabs[selectedindex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAddBottomSheet(context);
        },
        child: Icon(Icons.add, size: 40),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  List<Widget> tabs = [
    ListScreen(),
    SettingScreen(),
  ];
}

void showAddBottomSheet(context) {
  showModalBottomSheet(context: context, builder: (context) => TaskeScreen());
}
