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
  final int projectid = 0;
  final String location = 'Bangalore';
  final String travelnature = 'Project Visit';
  final DateTime appdate = DateTime.now();
  final double budget = 12345;
  final double spent = 123;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (BuildContext context, int index) {
        return NewCard(
          projectid: index + 1,
          location: location,
          travelnature: travelnature,
          appdate: appdate,
          budget: budget,
          spent: spent,
        );
      },
    );
  }
}

class NewCard extends StatelessWidget {
  //Constructor to get project id/number when called
  NewCard(
      {Key key,
      this.projectid,
      this.location,
      this.travelnature,
      this.appdate,
      this.budget,
      this.spent})
      : super(key: key);

  final int projectid;
  final String location;
  final String travelnature;
  final DateTime appdate;
  final double budget;
  final double spent;

  Approval status = Approval.approved; //Optional to keep status
  final numberformatter = NumberFormat('\u20B9##,##,##0', 'en_GB');

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 3,
        margin: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          children: <Widget>[
            Text('Project ID:\t$projectid'),
            Text('Location:\t$location'),
            Text('Travel Nature:\t$travelnature'),

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
              'Date of Application: ${DateFormat('d/M/yyyy').format(appdate).toString()}',
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
                    Text(numberformatter.format(budget).toString(),
                        style: TextStyle(color: Colors.green, fontSize: 20)),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('Spent',
                        style: TextStyle(color: Colors.red, fontSize: 15)),
                    Text(numberformatter.format(spent).toString(),
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
