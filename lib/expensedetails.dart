import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:photo_view/photo_view.dart';

void main() => runApp(ExpenseDetailsPage());

class ExpenseDetailsPage extends StatelessWidget {
  final String dropdownValue = 'Lodging';
  final DateTime selectedDate = DateTime.now();
  final String billno = 'UV12364';
  final String vendor = 'M/S InfoTech Pvt Ltd';
  final double amount = 10000;
  final String description = 'Bought some services for factory work';
  final String imgpath =
      'https://5.imimg.com/data5/NI/BH/MY-3360774/gst-bill-2finvoice-book-500x500.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Details'),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: ExpenseDetails(
          dropdownValue: dropdownValue,
          selectedDate: selectedDate,
          billno: billno,
          vendor: vendor,
          amount: amount,
          description: description,
          imagepath: imgpath,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}

class ExpenseDetails extends StatelessWidget {
  final String dropdownValue;
  final DateTime selectedDate;
  final String billno;
  final String vendor;
  final double amount;
  final String description;
  final String imagepath;

  final numberformatter = NumberFormat('\u20B9##,##,##0', 'en_GB');

  ExpenseDetails(
      {this.dropdownValue,
      this.selectedDate,
      this.billno,
      this.vendor,
      this.amount,
      this.description,
      this.imagepath});

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
                if (imagepath != null)
                  FlatButton(
                    padding: EdgeInsets.all(0),
                    child: Container(
                      //constraints: BoxConstraints.expand(
                      //height: MediaQuery.of(context).size.height * 0.5),
                      child: Image.network(
                        imagepath,
                        fit: BoxFit.contain,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, '/image');
                    },
                  )
                else
                  Center(
                    child: Container(
                      child: Text('IMAGE NOT FOUND'),
                    ),
                  ),
                Divider(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Category:   $dropdownValue',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ),
                Divider(
                  height: 15,
                ),
                InkWell(
                  child: InputDecorator(
                    decoration: InputDecoration(
                        labelText: 'Bill No:',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 20)),
                    child: Text(
                      billno,
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                Divider(
                  height: 15,
                ),
                InkWell(
                  child: InputDecorator(
                    decoration: InputDecoration(
                        labelText: 'Vendor:',
                        labelStyle:
                            TextStyle(color: Colors.black, fontSize: 20)),
                    child: Text(
                      vendor,
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ),
                Divider(
                  height: 15,
                ),
                InkWell(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Date:',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 20),
                    ),
                    child: Text(
                      selectedDate == null
                          ? 'Select Date'
                          //: selectedDate.toString(),
                          : //DateFormat('d/M/yyyy')
                          DateFormat.yMMMd().format(selectedDate).toString(),
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Divider(height: 15),
                InkWell(
                  child: InputDecorator(
                    child: Text(
                      numberformatter.format(amount).toString(),
                      //'$amount',
                      style: TextStyle(fontSize: 22),
                    ),
                    decoration: InputDecoration(
                      labelText: 'Bill Amount:',
                      labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                      //prefixText: "\u20B9  ",
                    ),
                  ),
                ),
                Divider(height: 15),
                InkWell(
                  child: InputDecorator(
                    decoration: InputDecoration(
                      fillColor: Colors.grey[100],
                      filled: true,
                      labelText: 'Description:',
                      labelStyle: TextStyle(fontSize: 18),
                    ),
                    child: Text(
                      description,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageFullScreenPage extends StatelessWidget {
  final String imagepath =
      'https://5.imimg.com/data5/NI/BH/MY-3360774/gst-bill-2finvoice-book-500x500.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bill Image'),
        backgroundColor: Colors.red,
      ),
      body: PhotoView(
        imageProvider: NetworkImage(imagepath),
      ),
    );
  }
}
