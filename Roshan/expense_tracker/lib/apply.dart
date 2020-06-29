import 'package:expense_tracker/navbar.dart';
import 'package:flutter/material.dart';

class ApplyPage extends StatefulWidget {
  @override
  _ApplyPageState createState() => _ApplyPageState();
}

class _ApplyPageState extends State<ApplyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply For Travel'),
      ),
      body: ApplicationForm(),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: 0,
      ),
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
  bool _isDense = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 0.0),
            child: TextFormField(
              validator: (value) => value.isEmpty ? 'Cant be empty' : null,
              decoration: InputDecoration(labelText: "Employee Name"),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'Cant be empty' : null,
                    decoration: InputDecoration(labelText: "Mobile Number"),
                    keyboardType: TextInputType.phone,
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value) =>
                        FocusScope.of(context).nextFocus(),
                  ),
                ),
                SizedBox(
                  width: 8.0,
                ),
                Expanded(
                  flex: 1,
                  child: TextFormField(
                    validator: (value) =>
                        value.isEmpty ? 'Cant be empty' : null,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Employee ID"),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (value) =>
                        FocusScope.of(context).unfocus(),
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
                  child: DropdownButtonFormField<String>(
                    validator: (value) => value == 'Please Select'
                        ? 'Select a valid reason'
                        : null,
                    value: dropdownValue1,
                    decoration: InputDecoration(labelText: "Nature of Travel"),
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 2,
                    isExpanded: true,
                    isDense: _isDense,
                    onTap: () => FocusScope.of(context).unfocus(),
                    onChanged: (String newValue) {
                      setState(() {
                        _isDense = newValue.length > 15 ? false : true;
                        dropdownValue1 = newValue;
                      });
                    },
                    items: <String>[
                      'Please Select',
                      'Project Visit',
                      'Local Travel',
                      'Sales/Marketing',
                      'Home Travel Request',
                      'Services and Support',
                      'Office - Admin Expenses',
                      'Factory - Admin Expenses',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 8.0),
                Expanded(
                  flex: 1,
                  child: DropdownButtonFormField<String>(
                    validator: (value) => value == 'Please Select'
                        ? 'Select a valid code'
                        : null,
                    decoration: InputDecoration(labelText: "Project Code"),
                    value: dropdownValue2,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 24,
                    elevation: 2,
                    isExpanded: true,
                    isDense: _isDense,
                    onTap: () => FocusScope.of(context).unfocus(),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue2 = newValue;
                      });
                    },
                    items: <String>[
                      'Please Select',
                      '1',
                      '2',
                      '3',
                      '4',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
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
                    onChanged: (bool value) {
                      setState(() {
                        _isBillable = value;
                      });
                    },
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
                    onChanged: (bool value) {
                      setState(() {
                        _isBillable = value;
                      });
                    },
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
                    onChanged: (bool value) {
                      setState(() {
                        _isAccompaniedByFamily = value;
                      });
                    },
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
                    onChanged: (bool value) {
                      setState(() {
                        _isAccompaniedByFamily = value;
                      });
                    },
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
                          onChanged: (bool value) {
                            setState(() {
                              _isDomestic = value;
                            });
                          },
                        ),
                        Text('Domestic'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Radio<bool>(
                          value: false,
                          groupValue: _isDomestic,
                          onChanged: (bool value) {
                            setState(() {
                              _isDomestic = value;
                            });
                          },
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
            child: TextFormField(
              validator: (value) => value.isEmpty ? 'Cant be empty' : null,
              decoration: InputDecoration(labelText: "Approval 1"),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (value) => FocusScope.of(context).nextFocus(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: TextFormField(
              validator: (value) => value.isEmpty ? 'Cant be empty' : null,
              decoration: InputDecoration(labelText: "Approval 2"),
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (value) => FocusScope.of(context).unfocus(),
            ),
          ),
          Center(
            child: FlatButton(
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.red,
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context).showSnackBar(
                      SnackBar(content: Text('Processing Data')));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
