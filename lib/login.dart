import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:validators/validators.dart' as validator;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
//          appBar: AppBar(
//              backgroundColor: Colors.red,
//              title: Center(child: Text('Sign Up'))),
          body: Center(child: TestForm())),
    );
  }
}

class TestForm extends StatefulWidget {
  @override
  _TestFormState createState() => _TestFormState();
}

class _TestFormState extends State<TestForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String password = '';
    const double padding = 16.0;
    final halfMediaWidth =
        (MediaQuery.of(context).size.width - (padding * 2)) / 2.0;

    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(padding),
        child: ListView(
          children: <Widget>[
            Image(
              image: AssetImage('images/sample.jpg'),
              height: 200.0,
            ),
            SizedBox(
              height: 30.0,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'First Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter First Name';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'Last Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter Last Name';
                      }
                      return null;
                    },
                  ),
                ),
              ],
            ),
            Container(
              child: MyTextFormField(
                hintText: 'Email Address',
                isEmail: true,
                validator: (String value) {
                  if (!validator.isEmail(value)) {
                    return 'Enter valid Email';
                  }
                  return null;
                },
              ),
            ),
            Container(
              child: MyTextFormField(
                hintText: 'Password',
                isPassword: true,
                validator: (String value) {
                  if (value.length < 7) {
                    return 'Password must contain atleast 7 characters ';
                  }
                  password = value;
                  return null;
                },
              ),
            ),
            Container(
              child: MyTextFormField(
                hintText: 'Confirm Password',
                isPassword: true,
                validator: (String value) {
                  if (value.length < 7) {
                    return 'Password must contain atleast 7 characters ';
                  } else if (value != password) {
                    return 'Password does not match';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              color: Colors.redAccent,
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  print('all valid inputs');
                }
              },
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Text('Aldready have an existing account?'),
                  FlatButton(
                    textColor: Colors.redAccent,
                    child: Text(
                      'Log in',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      //Log in screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login_page()),
                      );
                    },
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Login_page extends StatefulWidget {
  @override
  _Login_pageState createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  final _formKey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(
            child: Text('Log In'),
          ),
        ),
        body: Center(
          child: Form(
            key: _formKey1,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    child: MyTextFormField(
                      hintText: 'Email Address',
                      isEmail: true,
                      validator: (String value) {
                        if (!validator.isEmail(value)) {
                          return 'Enter valid Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    child: MyTextFormField(
                      hintText: 'Password',
                      isPassword: true,
                      validator: (String value) {
                        if (value.length < 7) {
                          return 'Incorrect password';
                        }
                        //password = value;
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    color: Colors.redAccent,
                    child: Text(
                      'Log In',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      if (_formKey1.currentState.validate()) {
                        print('all valid inputs');
                      }
                    },
                  ),
                  FlatButton(
                    onPressed: () {
                      //forgot password screen
                    },
                    textColor: Colors.redAccent,
                    child: Text('Forgot Password'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Conditions for the form part
class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  //final Function onSaved;
  final bool isPassword;
  final bool isEmail;

  //constructor
  MyTextFormField({
    this.hintText,
    this.validator,
    //this.onSaved,
    this.isPassword = false,
    this.isEmail = false,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: OutlineInputBorder(),
          //border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        obscureText: isPassword ? true : false,
        validator: validator,
        //onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}
