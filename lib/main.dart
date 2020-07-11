import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:expense_track/login.dart';
import 'package:expense_track/apply.dart';
import 'package:expense_track/allprojects.dart';
import 'package:expense_track/approve.dart';
import 'package:expense_track/currentproject.dart';
import 'package:expense_track/newexpense.dart';
import 'package:expense_track/approvaldetails.dart';
import 'package:expense_track/expensedetails.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Track',
      routes: {
        '/login': (context) => SignUpPage(),
        '/home': (context) => AppRootPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
      initialRoute: '/login',
    );
  }
}

class AppRootPage extends StatefulWidget {
  @override
  _AppRootPageState createState() => _AppRootPageState();
}

class _AppRootPageState extends State<AppRootPage> {
  int index = 1;
  List<int> visited = [];

  static final _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  List<Widget> pages = [
    Navigator(
      key: _navigatorKeys[0],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ApplyPage(),
        );
      },
    ),
    Navigator(
      key: _navigatorKeys[1],
      onGenerateRoute: (settings) {
        WidgetBuilder builder;

        switch (settings.name) {
          case '/':
            builder = (context) => AllProjectsPage();
            break;
          case '/current':
            builder = (context) => CurrentProjectPage();
            break;
          case '/new':
            builder = (context) => NewExpensePage();
            break;
          case '/expense':
            builder = (context) => ExpenseDetailsPage();
            break;
          case '/image':
            builder = (context) => ImageFullScreenPage();
            break;
          default:
            break;
        }

        return MaterialPageRoute(
          builder: builder,
          settings: settings,
        );
      },
    ),
    Navigator(
      key: _navigatorKeys[2],
      onGenerateRoute: (settings) {
        WidgetBuilder builder;

        switch (settings.name) {
          case '/':
            builder = (context) => ApprovePage();
            break;
          case '/details':
            builder = (context) => ApprovalDetailsPage();
            break;
          default:
            break;
        }

        return MaterialPageRoute(
          builder: builder,
          settings: settings,
        );
      },
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        if (_navigatorKeys[index].currentState.canPop()) {
          _navigatorKeys[index].currentState.pop();
          return Future<bool>.value(false);
        }
        if (visited.isEmpty) {
          if (index != 1) {
            setState(() {
              index = 1;
            });
            return Future<bool>.value(false);
          } else {
            return Future<bool>.value(true);
          }
        } else {
          setState(() {
            index = visited.removeLast();
          });
          return Future<bool>.value(false);
        }
      },
      child: Scaffold(
        body: IndexedStack(
          index: index,
          children: pages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            if (value != index) {
              setState(() {
                visited.remove(value);
                visited.add(index);
                index = value;
              });
            }
          },
          selectedItemColor: Colors.red,
          iconSize: 28,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              //Use if custom icon to be used
              //icon: Icon(MyFlutterApp.addchart_24px), title: Text('Apply')),
              icon: Icon(Icons.add_box),
              title: Text('Apply'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assessment),
              title: Text('Requests'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.assignment_turned_in),
              title: Text('Approve'),
            ),
          ],
        ),
      ),
    );
  }
}
