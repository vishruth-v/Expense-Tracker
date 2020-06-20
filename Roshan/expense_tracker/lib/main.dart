import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Expense Track'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;
  int _id = 0;

  List<Map<String, String>> _expenseList = [];

  void _addExpense() {
    _expenseList.insert(0, {
      'id': _id.toString(),
      'amount': '100',
      'date': DateTime.now().toString(),
    });
  }

  void _incrementCounter() {
    setState(() {
      _id++;
      _addExpense();
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          PopupMenuButton<String>(
              onSelected: (value) {
                if (value == 'finish') {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('End Project'),
                        content: Text(
                          'Are you sure you want to end tracking expenses of this project?',
                        ),
                        actions: <Widget>[
                          FlatButton(
                            // Pop Alert dialog
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text('CANCEL'),
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop(); //Pop Alert dialog
                              Navigator.of(context).pop(); //Pop MyApp
                              // Add new instance of MyApp (to create new project)
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyApp(),
                                  ));
                            },
                            child: Text('CONFIRM'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                    const PopupMenuItem<String>(
                      value: 'finish',
                      child: Text('End Project'),
                    ),
                  ]),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return SummaryCard();
          } else {
            return ExpenseCard(expense: _expenseList[index - 1]);
          }
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: _counter,
      ),
      floatingActionButton: MyFloatingActionButton(
        incrementCounter: _incrementCounter,
      ),
    );
  }
}

class MyFloatingActionButton extends StatelessWidget {
  final VoidCallback incrementCounter;

  MyFloatingActionButton({Key key, this.incrementCounter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        // incrementCounter();
        showModalBottomSheet(
            context: context,
            // backgroundColor: Colors.red[50],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            builder: (context) => Container(
                  height: 150,
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Text(
                            "Upload New Expense",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        flex: 2,
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RawMaterialButton(
                                  onPressed: () {},
                                  shape: CircleBorder(
                                    side: BorderSide(
                                      color: Colors.redAccent[100],
                                      width: 0.5,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(12.0),
                                  child: Icon(
                                    Icons.camera_alt,
                                    size: 30,
                                    color: Color.fromRGBO(0, 0, 0, 0.7),
                                  ),
                                ),
                                Text(
                                  "Scan",
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.7),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RawMaterialButton(
                                  onPressed: () {},
                                  shape: CircleBorder(
                                    side: BorderSide(
                                      color: Colors.redAccent[100],
                                      width: 0.5,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(12.0),
                                  child: Icon(
                                    Icons.mic,
                                    size: 30,
                                    color: Color.fromRGBO(0, 0, 0, 0.7),
                                  ),
                                ),
                                Text(
                                  "Voice",
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.7),
                                  ),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                RawMaterialButton(
                                  onPressed: () {},
                                  shape: CircleBorder(
                                    side: BorderSide(
                                      color: Colors.redAccent[100],
                                      width: 0.5,
                                    ),
                                  ),
                                  padding: EdgeInsets.all(12.0),
                                  child: Icon(
                                    Icons.assignment,
                                    size: 30,
                                    color: Color.fromRGBO(0, 0, 0, 0.7),
                                  ),
                                ),
                                Text(
                                  "Manual",
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 0.7),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        flex: 3,
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 1,
                        ),
                        flex: 1,
                      ),
                    ],
                  ),
                )).then((value) => incrementCounter());
      },
      tooltip: 'Add Expense',
      child: Icon(Icons.add),
    );
  }
}

class SummaryCard extends StatefulWidget {
  @override
  _SummaryCardState createState() => _SummaryCardState();
}

class _SummaryCardState extends State<SummaryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 0.1,
            color: Colors.grey.shade400,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 1.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Budget',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Rs. 1000',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Spent',
                  style: TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Rs. 500',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ExpenseCard extends StatefulWidget {
  final Map<String, String> expense;

  ExpenseCard({Key key, this.expense}) : super(key: key);

  @override
  _ExpenseCardState createState() => _ExpenseCardState();
}

class _ExpenseCardState extends State<ExpenseCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(15.0),
      child: Container(
        height: 70,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 0.1,
            color: Colors.grey.shade400,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 1.0,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(widget.expense["id"]),
            Text(widget.expense["amount"]),
            Text(widget.expense["date"]),
          ],
        ),
      ),
    );
  }
}
