import 'package:flutter/material.dart';

class TeamProvider with ChangeNotifier {
  int _team1Score = 0;
  int _team2Score = 0;
  bool _isDarkMode = false;
  String _team1Name = 'Team 1';
  String _team2Name = 'Team 2';

  int get team1Score => _team1Score;
  int get team2Score => _team2Score;
  bool get isDarkMode => _isDarkMode;
  String get team1Name => _team1Name;
  String get team2Name => _team2Name;

  void updateScore(bool isTeam1, int points) {
    if (isTeam1) {
      _team1Score += points;
    } else {
      _team2Score += points;
    }
    notifyListeners();
  }

  void toggleDarkMode() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void setTeamNames(String team1, String team2) {
    _team1Name = team1;
    _team2Name = team2;
    notifyListeners();
  }
}
