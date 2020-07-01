import 'package:flutter/material.dart';
import 'package:expense_tracker/main.dart';
import 'package:expense_tracker/apply.dart';
import 'approve.dart';

class MyBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final void Function(int) updatePageIndex;

  const MyBottomNavigationBar(
      {Key key, this.currentIndex, this.updatePageIndex})
      : super(key: key);

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      currentIndex: widget.currentIndex,
      // elevation: 20.0,
      // type: BottomNavigationBarType.shifting,
      iconSize: 28.0,
      onTap: (index) {
        widget.updatePageIndex(index);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                switch (index) {
                  case 0:
                    return ApplyPage();
                    break;
                  case 1:
                    return MyHomePage();
                    break;
                  case 2:
                    return ApprovePage();
                    break;
                  default:
                    return Scaffold();
                    break;
                }
              },
            ));
      },
      selectedItemColor: Colors.redAccent,
      unselectedItemColor: Color(0xcc52545b),
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          title: Text('Apply'),
          icon: Icon(Icons.border_color),
        ),
        BottomNavigationBarItem(
          title: Text('Projects'),
          icon: Icon(Icons.assessment), //Icons.event?
        ),
        BottomNavigationBarItem(
          title: Text('Approve'),
          icon: Icon(Icons.assignment_turned_in),
        ),
      ],
    );
  }
}
