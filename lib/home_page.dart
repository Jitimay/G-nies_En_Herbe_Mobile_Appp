import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'team_provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var teamProvider = Provider.of<TeamProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Génies en Herbe',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TeamBox(
              teamName: teamProvider.team1Name,
              score: teamProvider.team1Score,
              onUpdateScore: (int points) {
                teamProvider.updateScore(true, points);
              },
            ),
            SizedBox(height: 20),
            TeamBox(
              teamName: teamProvider.team2Name,
              score: teamProvider.team2Score,
              onUpdateScore: (int points) {
                teamProvider.updateScore(false, points);
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => ChangeTeamNamesDialog(),
          );
        },
        child: Icon(Icons.edit),
      ),
    );
  }
}

class TeamBox extends StatelessWidget {
  final String teamName;
  final int score;
  final Function(int) onUpdateScore;

  const TeamBox({
    Key? key,
    required this.teamName,
    required this.score,
    required this.onUpdateScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 8.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            teamName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Score: $score',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 8),
          PointsSelector(onUpdateScore: onUpdateScore),
        ],
      ),
    );
  }
}

class PointsSelector extends StatelessWidget {
  final Function(int) onUpdateScore;

  const PointsSelector({
    Key? key,
    required this.onUpdateScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => onUpdateScore(10),
          child: Text('+10'),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: () => onUpdateScore(20),
          child: Text('+20'),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: () => onUpdateScore(-10),
          child: Text('-10'),
        ),
        SizedBox(width: 8),
        ElevatedButton(
          onPressed: () => onUpdateScore(-15),
          child: Text('-15'),
        ),
      ],
    );
  }
}

class ChangeTeamNamesDialog extends StatefulWidget {
  @override
  _ChangeTeamNamesDialogState createState() => _ChangeTeamNamesDialogState();
}

class _ChangeTeamNamesDialogState extends State<ChangeTeamNamesDialog> {
  final _team1Controller = TextEditingController();
  final _team2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Change Team Names'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _team1Controller,
            decoration: InputDecoration(
              labelText: 'Team 1 Name',
            ),
          ),
          TextField(
            controller: _team2Controller,
            decoration: InputDecoration(
              labelText: 'Team 2 Name',
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            Provider.of<TeamProvider>(context, listen: false).setTeamNames(
              _team1Controller.text,
              _team2Controller.text,
            );
            Navigator.of(context).pop();
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}
