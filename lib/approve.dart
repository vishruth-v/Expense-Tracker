import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApprovePage extends StatelessWidget {
  const ApprovePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Approve Request'),
        backgroundColor: Colors.red,
      ),
      body: Approvals(),
    );
  }
}

class Approvals extends StatefulWidget {
  @override
  _ApprovalsState createState() => _ApprovalsState();
}

class _ApprovalsState extends State<Approvals> {
  List<Widget> project = [];
  String employeeName = 'abc';
  String projectName = 'def';
  String location = 'ghi';
  int amount = 100;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (_, int index) {
          // project.add(ProjectCard(employeeName, projectName, location, amount));
          return ProjectCard(employeeName, projectName, location, amount);
        },
        itemCount: 10,
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String employeeName;
  final String projectName;
  final String location;
  final int amount;

  ProjectCard(this.employeeName, this.projectName, this.location, this.amount);
  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/details'),
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
                        '${widget.employeeName}',
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
                        '${widget.projectName}',
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
                        '${widget.location}',
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
                      Text('${widget.amount}'),
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
