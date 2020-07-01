import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Widget> project = [];

  String employeeName = 'abc';
  String projectName = 'def';
  String location = 'ghi';
  int amount = 100;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Approve Request')),
          backgroundColor: Colors.red,
        ),
        body: new Container(
          child: new ListView.builder(
            itemBuilder: (_, int index) {
              project.add(
                  ProjectCard(employeeName, projectName, location, amount));
              return ProjectCard(employeeName, projectName, location, amount);
            },
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  String employeeName;
  String projectName;
  String location;
  int amount;

  ProjectCard(this.employeeName, this.projectName, this.location, this.amount);
  @override
  _ProjectCardState createState() =>
      _ProjectCardState(employeeName, projectName, location, amount);
}

class _ProjectCardState extends State<ProjectCard> {
  String employeeName;
  String projectName;
  String location;
  int amount;

  _ProjectCardState(
      this.employeeName, this.projectName, this.location, this.amount);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: GestureDetector(
        onTap: () => {},
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 25.0),
            //color: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        'Requested By: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        '$employeeName',
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Project Name: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        '$projectName',
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Location:  ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text(
                        '$location',
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Amount:   ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      Text('$amount'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
