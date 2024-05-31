import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'team_provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var teamProvider = Provider.of<TeamProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: SwitchListTile(
          title: Text('Dark Mode'),
          value: teamProvider.isDarkMode,
          onChanged: (bool value) {
            teamProvider.toggleDarkMode();
          },
        ),
      ),
    );
  }
}
