import 'package:flutter/material.dart';
import 'package:app/theme/app_colors.dart';
import 'package:app/theme/app_themes.dart';
import 'package:flutter/services.dart';
import 'package:app/constants/Constants.dart';
import 'package:app/screen/home/saved/saved_screen.dart';
import 'package:app/screen/home/search/search_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  var _currentTab = Constants.SEARCH_SCREEN;

  void _selectTab(int tab) {
    setState(() => _currentTab = tab);
  }

  final List<Widget> _screens = <Widget>[SearchScreen(), SavedScreen()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.appTheme,
      title: "Home screen",
      debugShowCheckedModeBanner: false,
      home: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(child: _screens.elementAt(_currentTab)),
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 16,
              selectedItemColor: AppColors.primary,
              unselectedItemColor: AppColors.black,
              backgroundColor: AppColors.backgroundHome,
              currentIndex: _currentTab,
              onTap: (index) => _selectTab(index),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.save), label: 'Saved'),
              ],
            )),
      ),
    );
  }
}
