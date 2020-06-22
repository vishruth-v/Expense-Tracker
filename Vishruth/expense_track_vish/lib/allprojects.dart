import 'package:flutter/material.dart';
//MUST INCLUDE my_flutter_app_icons.dart for custom ICON
import 'assetscripts/my_flutter_app_icons.dart';

//void main() => runApp(MyApp());

class AllProjectsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker'),
          backgroundColor: Colors.red,
        ),
        body: SafeArea(
          child: AllProjects(),
        ),
        backgroundColor: Colors.white,

        //BOTTOM NAVIGATION BAR
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.red,
          iconSize: 28,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(MyFlutterApp.addchart_24px),
                title: Text('Apply')),
            BottomNavigationBarItem(
                icon: Icon(Icons.assessment), title: Text('Projects')),
            BottomNavigationBarItem(
                icon: Icon(Icons.work), title: Text('Approve')),
          ],
        ),
      ),
    );
  }
}

class AllProjects extends StatefulWidget {
  @override
  _AllProjectsState createState() => _AllProjectsState();
}

class _AllProjectsState extends State<AllProjects> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        //Card(child: ,)
      ],
    );
  }
}
