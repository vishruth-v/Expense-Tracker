import 'package:flutter/material.dart';
//MUST INCLUDE my_flutter_app_icons.dart for custom ICON
//import 'assetscripts/my_flutter_app_icons.dart';

//void main() => runApp(MyApp());

class AllProjectsMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
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
                icon: Icon(Icons.add_box),
                title: Text('Apply'),
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.assessment), title: Text('Requests')),
              BottomNavigationBarItem(
                  icon: Icon(Icons.assignment_turned_in),
                  title: Text('Approve')),
            ],
          ),

          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {},
            backgroundColor: Colors.red,
          ),
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
  //List<Map<int, int>> _numbers = [];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      pageSnapping: true,
      scrollDirection: Axis.horizontal,
      onPageChanged: (int index) {
        setState(() {
          _index = index;
        });
      },
      controller: PageController(viewportFraction: 0.8),
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Transform.scale(
          scale: index == _index ? 1 : 0.9,
          child: ProjectCard(
            index: _index + 1,
          ),
        );
      },
    );
  }
}

class ProjectCard extends StatelessWidget {
  //final Map <int, int> number;

  ProjectCard({Key key, this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[50],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: <Widget>[
          SummaryCard(
            index: index,
          ),
          //SizedBox(height:20),
          Text(
            'Expenses',
            style: TextStyle(fontSize: 20),
          ),
          // SizedBox(height:20),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ListTile(title: Text('Expense $index'));
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  SummaryCard({Key key, this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: Colors.white,
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: <Widget>[
          Text('Project ID: $index'),
          Text('Location: sndjs'),
          Divider(
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    'Budget',
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  Text(
                    '\u20B9 12345',
                    style: TextStyle(color: Colors.green, fontSize: 20),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    'Spent',
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  ),
                  Text(
                    '\u20B9 123',
                    style: TextStyle(color: Colors.red, fontSize: 20),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
