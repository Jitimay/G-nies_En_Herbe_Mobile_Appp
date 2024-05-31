import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'info_page.dart';
import 'team_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TeamProvider(),
      child: Consumer<TeamProvider>(
        builder: (context, teamProvider, child) {
          return MaterialApp(
            themeMode: teamProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(
              primaryColor: Colors.grey[400],
              scaffoldBackgroundColor: Colors.grey[400],
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.grey[400],
                titleTextStyle: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
              ),
              textTheme: TextTheme(
                bodyLarge: TextStyle(color: Colors.black),
                bodyMedium: TextStyle(color: Colors.black),
              ),
            ),
            darkTheme: ThemeData(
              primaryColor: Colors.grey[850],
              scaffoldBackgroundColor: Colors.grey[850],
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.grey[850],
                titleTextStyle: TextStyle(color: Colors.grey[400], fontSize: 24, fontWeight: FontWeight.bold),
              ),
              textTheme: TextTheme(
                bodyLarge: TextStyle(color: Colors.grey[400]),
                bodyMedium: TextStyle(color: Colors.grey[400]),
              ),
            ),
            home: MainPage(),
          );
        },
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [HomePage(), InfoPage(), SettingsPage()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
