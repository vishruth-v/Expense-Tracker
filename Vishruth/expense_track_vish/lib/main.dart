import 'package:flutter/material.dart';
//import 'package:intl/intl.dart';
//import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

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
    return Column(
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
        ),
      ],
    );
  }
}
