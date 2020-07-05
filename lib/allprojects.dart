import 'package:flutter/material.dart';
//MUST INCLUDE my_flutter_app_icons.dart for custom ICON
import 'assetscripts/my_flutter_app_icons.dart';
import 'package:intl/intl.dart';

enum Approval { approved, rejected, pending }

class AllProjectsPage extends StatelessWidget {
  const AllProjectsPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Track'),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: AllProjects(),
      ),
    );
  }
}

class AllProjects extends StatefulWidget {
  @override
  _AllProjectsState createState() => _AllProjectsState();
}

class _AllProjectsState extends State<AllProjects> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return NewCard(
          number: index + 1,
        );
      },
    );
  }
}

class NewCard extends StatelessWidget {
  //Constructor to get project id/number when called
  NewCard({Key key, this.number}) : super(key: key);

  final int number;
  Approval status = Approval.approved; //Optional to keep status

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          children: <Widget>[
            Text('Project ID:\t$number'),
            Text('Location:\tBangalore'),
            Text('Travel Nature:\tProject Visit'),

            //TO SHOW STATUS OF REQUEST APPROVAL
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     Text('Status:\t'),
            //     ApprovalStatus(
            //       status: status,
            //     ),
            //   ],
            // ),
            Text(
              'Date of Application: ${DateFormat('d/M/yyyy').format(DateTime.now()).toString()}',
            ),
            Divider(
              thickness: 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Budget',
                        style: TextStyle(color: Colors.green, fontSize: 15)),
                    Text('\u20B9 12345',
                        style: TextStyle(color: Colors.green, fontSize: 20)),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('Spent',
                        style: TextStyle(color: Colors.red, fontSize: 15)),
                    Text('\u20B9 123',
                        style: TextStyle(color: Colors.red, fontSize: 20)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      //ONLY if staus == Approval.approved, user should be able to add expense
      onPressed: () {
        Navigator.pushNamed(context, '/current');
      },
    );
  }
}

//THIS CLASS TO SHOW STATUS IN CARD WHETHER REQUEST APPROVED OR REJECTED OR PENDING

// class ApprovalStatus extends StatelessWidget {
//   ApprovalStatus({Key key, this.status}) : super(key: key);
//   Approval status;

//   @override
//   Widget build(BuildContext context) {
//     if (status == Approval.approved) {
//       return Text('Approved',
//           style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold));
//     } else if (status == Approval.rejected) {
//       return Text('Rejected',
//           style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold));
//     } else if (status == Approval.pending) {
//       return Text('Rejected',
//           style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold));
//     }
//     else {
//       return Text('');
//     }
//   }
// }
