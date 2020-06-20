//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
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
  //String amount = '';
  double amount;
  bool _validate = false;
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
              underline: Container(height: 2, color: Colors.red),
              value: dropdownValue,
              items: <String>['Select', 'Food', 'Materials', 'Travel']
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
                      //: selectedDate.toString(),
                      : DateFormat('d/M/yyyy').format(selectedDate).toString(),
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 10,),
                RaisedButton(
                  shape: RoundedRectangleBorder(),
                  textColor: Colors.white,
                  child: Text('SELECT DATE'),
                  color: Colors.red,
                  onPressed: () {
                    showDatePicker(
                        //initialEntryMode: DatePickerEntryMode.input,
                        context: context,
                        initialDate: selectedDate == null
                            ? DateTime.now()
                            : selectedDate,
                        firstDate: DateTime(2001),
                        lastDate: DateTime(2030),
                        builder: (BuildContext context, Widget child) {
                          return Theme(
                            child: child,
                            data: ThemeData(primarySwatch: Colors.red),
                          );
                        }).then((date) {
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
                    _validate = false;
                    amount = double.tryParse(text);
                    if (amount == null) {
                      _validate = true;
                    }
                  });
                },
                style: TextStyle(fontSize: 20),
                keyboardType: TextInputType.numberWithOptions(decimal: true, signed: false),
                decoration: InputDecoration(
                  prefixText: "\u20B9  ",
                  errorText: _validate ? 'Invalid Input' : null,
                ),
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
