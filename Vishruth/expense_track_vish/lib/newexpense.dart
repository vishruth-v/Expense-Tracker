import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';


//void main() => runApp(MyApp());

enum AttachOption { camera, gallery }

class NewExpenseMain extends StatelessWidget {
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
  String billno;
  double amount;
  bool _validate = false;
  String description;
  List<String> _categories = [
    'Select',
    'Travel',
    'Food',
    'Materials',
    'Conveyence'
  ];

  List<String> _attachOptions = ['Camera', 'Gallery'];

  String attachOption;

  File _image;
  final picker = ImagePicker();
  AttachOption _attachoption;
  //final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    //print('Bill amount is: $amount');
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Category:',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    DropdownButton(
                      underline: Container(height: 2, color: Colors.red),
                      value: dropdownValue,
                      items: _categories
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
                  ],
                ),
                Divider(),
                TextField(
                  decoration: InputDecoration(
                      labelText: 'Bill Number:',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 20)),
                  onChanged: (String text) {
                    setState(() {
                      billno = text;
                    });
                  },
                  style: TextStyle(fontSize: 22),
                ),
                Divider(
                  height: 30,
                ),

                //USE INKWELL WIDGET OR REPLACE WITH COMMENTED SECTION TO REVERT TO BUTTON SELECTION
                //INKWELL WAS USED TO PREVENT OVERFLOW
                InkWell(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Date:',
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          selectedDate == null
                              ? 'Select Date'
                              //: selectedDate.toString(),
                              : //DateFormat('d/M/yyyy')
                              DateFormat.yMMMd()
                                  .format(selectedDate)
                                  .toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        Icon(
                          Icons.calendar_today,
                          color: Colors.red,
                        )
                      ],
                    ),
                  ),
                  onTap: _datePicker,
                ),

                //USE THIS SECTION BY REPLACING INKWELL IF WANT TO REVERT TO BUTTON FOR SELECT DATE
                /*Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Date:',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          selectedDate == null
                              ? 'Select Date'
                              //: selectedDate.toString(),
                              : //DateFormat('d/M/yyyy')
                                DateFormat.yMMMd()
                                  .format(selectedDate)
                                  .toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(),
                          textColor: Colors.white,
                          child: Text('CHANGE DATE'),
                          color: Colors.red,
                          onPressed: _datePicker,
                        ),
                      ],
                    ),
                  ],
                ),*/

                Divider(height: 15),
                TextField(
                  onChanged: (text) {
                    setState(() {
                      _validate = false;
                      amount = double.tryParse(text);
                      if (amount == null) {
                        _validate = true;
                      }
                    });
                  },
                  style: TextStyle(fontSize: 22),
                  keyboardType: TextInputType.numberWithOptions(
                      decimal: true, signed: false),
                  decoration: InputDecoration(
                    labelText: 'Bill Amount:',
                    labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                    prefixText: "\u20B9  ",
                    errorText: _validate ? 'Invalid Input' : null,
                  ),
                ),
                Divider(height: 30),
                TextField(
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  decoration: InputDecoration(
                    fillColor: Colors.grey[100],
                    filled: true,
                    hintText: 'Enter Description',
                    hintStyle: TextStyle(fontSize: 18),
                  ),
                  onChanged: (String text) {
                    setState(() {
                      description = text;
                    });
                  },
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              PopupMenuButton<AttachOption>(
                child: FloatingActionButton(
                  child: Icon(Icons.attach_file),
                  onPressed: null,
                  backgroundColor: Colors.red,
                ),
                onSelected: (AttachOption result) {
                  setState(() {
                    _attachoption = result;
                  });
                  attach();
                },
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<AttachOption>>[
                  PopupMenuItem<AttachOption>(
                    value: AttachOption.camera,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.camera_alt,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Camera'),
                      ],
                    ),
                  ),
                  PopupMenuItem<AttachOption>(
                    value: AttachOption.gallery,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.photo,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('Gallery'),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(width: 30),
              FloatingActionButton(
                onPressed: _submitDialog,
                child: Icon(Icons.done),
                backgroundColor: Colors.red,
              ),
            ],
          )
        ],
      ),
    );
  }

  void _datePicker() {
    showDatePicker(
        context: context,
        initialDate: selectedDate == null ? DateTime.now() : selectedDate,
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
  }

  void _submitDialog() {
    if (_validate == false &&
        dropdownValue != 'Select' &&
        selectedDate != null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title:
                  Text('Submit New expense?', style: TextStyle(fontSize: 25)),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Bill amount is: $amount'),
                    Text('For Category $dropdownValue'),
                    Text('Do you confirm?'),
                  ],
                ),
              ),
              contentTextStyle: TextStyle(fontSize: 18, color: Colors.black),
              actions: <Widget>[
                FlatButton(
                    child: Text(
                      'CANCEL',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.red,
                      ),
                    ),
                    //color: Colors.red,
                    onPressed: () {}),
                FlatButton(
                  child: Text('SUBMIT', style: TextStyle(fontSize: 18)),
                  color: Colors.red,
                  onPressed: () {},
                )
              ],
            );
          });
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Invalid Expense Details',
                  style: TextStyle(fontSize: 25)),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('Category, Date or Bill Amount is Invalid.'),
                    Text('Try Again'),
                  ],
                ),
              ),
              contentTextStyle: TextStyle(fontSize: 18, color: Colors.black),
            );
          });
    }
  }

  Future getImageCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void attach() {
    if (_attachoption == AttachOption.camera) {
      getImageCamera();
    } else if (_attachoption == AttachOption.gallery) {
      getImageGallery();
    }
  }
}
