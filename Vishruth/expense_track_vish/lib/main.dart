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
  //final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:25),
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
                  selectedDate == null ? 'Select Date' : selectedDate.toString(),
                ),
                RaisedButton(
                  shape: RoundedRectangleBorder(),
                  textColor: Colors.white,
                  child: Text('SELECT DATE'),
                  color: Colors.red,
                  onPressed: () {
                    showDatePicker(
                      initialEntryMode: DatePickerEntryMode.input,
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
              child: TextField(),
            ),
          )
        ],
      ),
    );
  }
}

// trailing: Row(
//   children: <Widget>[
//     // DateTimeField(
//     //   format: format,
//     //   onShowPicker: (context, currentValue) {
//     //     return showDatePicker(
//     //         context: context,
//     //         firstDate: DateTime(1900),
//     //         initialDate: currentValue ?? DateTime.now(),
//     //         lastDate: DateTime(2100));
//     //   },
//     // ),
//   ],
// ),

// trailing: RaisedButton(
//             onPressed: () {
//               showDatePicker(
//                 context: context,
//                 initialDate: DateTime.now(),
//                 firstDate: DateTime(2001),
//                 lastDate: DateTime(2030),
//                 fieldLabelText: selectedDate.toString(),
//               ).then((date) {
//                 setState(() {
//                   selectedDate = date;
//                 });
//               });
//             },
//           ),
