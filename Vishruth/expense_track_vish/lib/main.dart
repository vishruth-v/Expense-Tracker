import 'package:flutter/material.dart';
//import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('New Expense'),
          backgroundColor: Colors.red,
        ),
        body: SafeArea(
          child: NewExpense(),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}

class NewExpense extends StatefulWidget {
  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  String dropdownValue = 'Select';
  DateTime selectedDate = DateTime.now();
  String amount = '';
  //final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    print('Bill amount is: $amount');
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              'Category:',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            trailing: DropdownButton(
              value: dropdownValue,
              items: <String>['Select', 'Food', 'Materials']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                });
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(),
          ListTile(
            title: Text(
              'Date:',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  selectedDate == null
                      ? 'Select Date'
                      : selectedDate.toString(),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(),
                  textColor: Colors.white,
                  child: Text('SELECT DATE'),
                  color: Colors.red,
                  onPressed: () {
                    showDatePicker(
                      //initialEntryMode: DatePickerEntryMode.input,
                      context: context,
                      initialDate:
                          selectedDate == null ? DateTime.now() : selectedDate,
                      firstDate: DateTime(2001),
                      lastDate: DateTime(2030),
                    ).then((date) {
                      setState(() {
                        selectedDate = date;
                      });
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(),
          ListTile(
            title: Text(
              'Bill Amount:',
              style: TextStyle(fontSize: 20),
            ),
            trailing: Container(
              width: 200,
              child: TextField(
                onChanged: (text) {
                  setState(() {
                    amount = text;
                  });
                },
              ),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: null,
                  child: Icon(Icons.attach_file),
                  backgroundColor: Colors.red,
                ),
                SizedBox(width: 30),
                FloatingActionButton(
                  onPressed: null,
                  child: Icon(Icons.done),
                  backgroundColor: Colors.red,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
