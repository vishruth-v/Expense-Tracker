import 'package:flutter/material.dart';
import 'navbar.dart';

class ApprovePage extends StatefulWidget {
  @override
  _ApprovePageState createState() => _ApprovePageState();
}

class _ApprovePageState extends State<ApprovePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Approve Projects'),
      ),
      body: Container(),
      bottomNavigationBar: MyBottomNavigationBar(currentIndex: 2,),
    );
  }
}

// class MyBottomNavigationBar extends StatefulWidget {
//   final int currentIndex;
//   final void Function(int) updatePageIndex;

//   const MyBottomNavigationBar({Key key, this.currentIndex, this.updatePageIndex}) : super(key: key);

//   @override
//   _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
// }

// class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       backgroundColor: Colors.white,
//       currentIndex: widget.currentIndex,
//       // elevation: 20.0,
//       // type: BottomNavigationBarType.shifting,
//       iconSize: 28.0,
//       onTap: (index) {
//         widget.updatePageIndex(index);
//       },
//       selectedItemColor: Colors.redAccent,
//       unselectedItemColor: Color(0xcc52545b),
//       items: <BottomNavigationBarItem>[
//         BottomNavigationBarItem(
//           title: Text('Apply'),
//           icon: Icon(Icons.border_color),
//         ),
//         BottomNavigationBarItem(
//           title: Text('Projects'),
//           icon: Icon(Icons.assessment), //Icons.event?
//         ),
//         BottomNavigationBarItem(
//           title: Text('Approve'),
//           icon: Icon(Icons.assignment_turned_in),
//         ),
//       ],
//     );
//   }
// }
