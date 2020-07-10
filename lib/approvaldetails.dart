import 'package:flutter/material.dart';

//void main() => runApp(ApprovalDetailsPage());

class ApprovalDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details for Approval'),
      ),
      body: ApplicationForm(),
    );
  }
}

class ApplicationForm extends StatefulWidget {
  @override
  _ApplicationFormState createState() => _ApplicationFormState();
}

class _ApplicationFormState extends State<ApplicationForm> {
  final _formKey = GlobalKey<FormState>();
  String dropdownValue1 = 'Please Select';
  String dropdownValue2 = 'Please Select';
  bool _isBillable = false;
  bool _isAccompaniedByFamily = false;
  bool _isDomestic = true;
  int _journeyCount = 1;
  List<Widget> _journeyDetails;

  @override
  void initState() {
    _journeyDetails = <Widget>[myExpandableTile(_journeyCount)];
    super.initState();
  }

  Widget myExpandableTile(int itemKey) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 0.1,
          color: Colors.grey,
        ),
      ),
      child: ExpansionTile(
        initiallyExpanded: true,
        title: Text('Details'),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 3.0, 8.0, 0.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: InputDecorator(
                        decoration: InputDecoration(labelText: "From Country"),
                        child: Text('India')),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: InputDecorator(
                      decoration: InputDecoration(labelText: "To Country"),
                      child: Text('Japan'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: InputDecorator(
                      decoration: InputDecoration(labelText: "From City"),
                      child: Text('Bangalore'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: InputDecorator(
                      decoration: InputDecoration(labelText: "To City"),
                      child: Text('Osaka'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.0),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
            child: InkWell(
              child: InputDecorator(
                  decoration: InputDecoration(labelText: "Employee Name"),
                  child: Text('Vishruth Veerendranath')),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: InkWell(
                    child: InputDecorator(
                      decoration: InputDecoration(labelText: "Mobile Number"),
                      child: Text('12456789'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: InputDecorator(
                      decoration: InputDecoration(labelText: "Employee ID"),
                      child: Text('ACH 123'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: InputDecorator(
                      decoration:
                          InputDecoration(labelText: "Nature of Travel"),
                      child: Text('Project Visit'),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    child: InputDecorator(
                      decoration: InputDecoration(labelText: "Project Code"),
                      child: Text('1'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Text(
                    ' Billable Travel',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Radio<bool>(
                    value: true,
                    groupValue: _isBillable,
                    onChanged: (_) {},
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text('Yes'),
                ),
                Expanded(
                  flex: 1,
                  child: Radio<bool>(
                    value: false,
                    groupValue: _isBillable,
                    onChanged: (_) {},
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text('No'),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            padding: const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
            ),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 5,
                  child: Text(
                    ' Accompanied by Family',
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Radio<bool>(
                    value: true,
                    groupValue: _isAccompaniedByFamily,
                    onChanged: (_) {},
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text('Yes'),
                ),
                Expanded(
                  flex: 1,
                  child: Radio<bool>(
                    value: false,
                    groupValue: _isAccompaniedByFamily,
                    onChanged: (_) {},
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text('No'),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 4.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                width: 1,
                color: Colors.grey,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Type of Travel',
                  style: TextStyle(fontSize: 16.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Radio<bool>(
                          value: true,
                          groupValue: _isDomestic,
                          onChanged: (_) {},
                        ),
                        Text('Domestic'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio<bool>(
                          value: false,
                          groupValue: _isDomestic,
                          onChanged: (_) {},
                        ),
                        Text('International'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: InkWell(
              child: InputDecorator(
                decoration: InputDecoration(labelText: "Approval 1"),
                child: Text('Name 1'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: InkWell(
              child: InputDecorator(
                decoration: InputDecoration(labelText: "Approval 2"),
                child: Text('Name 2'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: Divider(
              thickness: 1.0,
              indent: 5.0,
              endIndent: 5.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(14.0, 8.0, 8.0, 8.0),
            child: Center(
              child: Text(
                'Journey Details',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          ..._journeyDetails,
          // Center(
          //   child: FlatButton.icon(
          //     onPressed: () {
          //       setState(() {
          //         _journeyCount++;
          //         _journeyDetails.add(myExpandableTile(_journeyCount));
          //       });
          //     },
          //     icon: Icon(
          //       Icons.add,
          //       color: Colors.white,
          //     ),
          //     label: Text(
          //       'Add',
          //       style: TextStyle(color: Colors.white),
          //     ),
          //     color: Colors.red,
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: Divider(
              thickness: 1.0,
              indent: 5.0,
              endIndent: 5.0,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.fromLTRB(14.0, 8.0, 8.0, 8.0),
          //   child: Center(
          //     child: Text(
          //       'Journey Details',
          //       style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          //     ),
          //   ),
          // ),
          // Center(
          //   child: FlatButton(
          //     child: Text(
          //       'Submit',
          //       style: TextStyle(color: Colors.white),
          //     ),
          //     color: Colors.red,
          //     onPressed: () {
          //       if (_formKey.currentState.validate()) {
          //         // If the form is valid, display a Snackbar.
          //         Scaffold.of(context)
          //             .showSnackBar(SnackBar(content: Text('Processing Data')));
          //       }
          //     },
          //   ),
          // ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                child: Row(
                  children: <Widget>[
                    Text('DECLINE'),
                    Icon(Icons.close),
                  ],
                ),
                color: Colors.red,
                onPressed: () {},
              ),
              RaisedButton(
                child: Row(
                  children: <Widget>[
                    Text('APPROVE'),
                    Icon(Icons.done),
                  ],
                ),
                color: Colors.green,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}

class MyExpandableTile extends StatefulWidget {
  final String itemKey;

  const MyExpandableTile({Key key, @required this.itemKey}) : super(key: key);

  @override
  _MyExpandableTileState createState() => _MyExpandableTileState();
}

class _MyExpandableTileState extends State<MyExpandableTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(6),
        border: Border.all(
          width: 0.1,
          color: Colors.grey,
        ),
      ),
      child: ExpansionTile(
        title: Text('Journey ' + widget.itemKey),
        children: <Widget>[
          Text('abc'),
          Text('abc'),
          Text('abc'),
        ],
      ),
    );
  }
}
