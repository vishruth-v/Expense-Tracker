import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  String employeeName = 'Vishruth Veerendranath';
  String projectName = 'P&G Japan';
  String location = 'Osaka, Japan';
  double amount = 100000;
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
  final double amount;

  ProjectCard(this.employeeName, this.projectName, this.location, this.amount);
  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  // final numberformatter = NumberFormat.currency(
  //     locale: 'en_GB', symbol: '\u20B9', customPattern: '##,##,##0.#');

  final numberformatter = NumberFormat('\u20B9##,##,##0', 'en_GB');

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 150.0,
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, '/details'),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
            //color: Colors.white,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Requested By: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      //  SizedBox(
                      //     width: 20.0,
                      //   ),
                      Text(
                        '${widget.employeeName}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Project Name: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      // SizedBox(
                      //   width: 20.0,
                      // ),
                      Text(
                        '${widget.projectName}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Location: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                      // SizedBox(
                      //   width: 20.0,
                      // ),
                      Text(
                        '${widget.location}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        'Amount:  ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                      // SizedBox(
                      //   width: 20.0,
                      // ),
                      Text(
                        numberformatter.format(widget.amount).toString(),
                        style:
                            TextStyle(fontSize: 22, color: Colors.green[600]),
                      ),
                    ],
                  ),
                  ButtonBar(
                    buttonPadding: EdgeInsets.all(0),
                    alignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FlatButton(
                        child: Row(
                          children: <Widget>[
                            Text(
                              'DECLINE',
                              style: TextStyle(
                                  color: Colors.red[400], fontSize: 17.5),
                            ),
                            Icon(
                              Icons.close,
                              color: Colors.red[400],
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                      FlatButton(
                        child: Row(
                          children: <Widget>[
                            Text(
                              'APPROVE',
                              style: TextStyle(
                                  color: Colors.green[400], fontSize: 17.5),
                            ),
                            Icon(
                              Icons.done,
                              color: Colors.green[400],
                            ),
                          ],
                        ),
                        onPressed: () {},
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
