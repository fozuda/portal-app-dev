import 'package:flutter/material.dart';
import 'package:portal/customeclasses/widgets.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyCustomSpace(width: 0.0, height: 30.0),
              Text(
                "Submit Application",
                style: TextStyle(fontSize: 15, color: Colors.deepPurple),
              ),
            ],
          ), //Request Application
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
              children: [
                MyCustomSpace(width: 0.0, height: 10.0),
                Container(
                  width: 36.0,
                  height: 36.0,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/request_certificate.png'),
                        fit: BoxFit.contain),
                  ),
                ),
                MyCustomSpace(width: 0.0, height: 10.0),
                Text('Certificate'),
              ],
            ),
            Column(
              children: [
                MyCustomSpace(width: 0.0, height: 10.0),
                Container(
                  width: 36.0,
                  height: 36.0,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/request_leave.png'),
                        fit: BoxFit.contain),
                  ),
                ),
                MyCustomSpace(width: 0.0, height: 10.0),
                Text('Leave'),
              ],
            ),
          ]),
          MyCustomSpace(width: 0.0, height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyCustomSpace(width: 0.0, height: 30.0),
              Text(
                "Leave Balance",
                style: TextStyle(fontSize: 15, color: Colors.deepPurple),
              ),
            ],
          ), //Leave Balance
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  MyCustomSpace(width: 0.0, height: 10.0),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      border: Border.all(
                        width: 3,
                        color: Colors.blue,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Center(
                      child: Text("20"),
                    ),
                  ),
                  MyCustomSpace(width: 0.0, height: 10.0),
                  Text("Casual"),
                ],
              ),
              Column(
                children: [
                  MyCustomSpace(width: 0.0, height: 10.0),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      border: Border.all(
                        width: 3,
                        color: Colors.deepOrange,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Center(
                      child: Text("20"),
                    ),
                  ),
                  MyCustomSpace(width: 0.0, height: 10.0),
                  Text("Earned"),
                ],
              ),
              Column(
                children: [
                  MyCustomSpace(width: 0.0, height: 10.0),
                  Container(
                    width: 50.0,
                    height: 50.0,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      border: Border.all(
                        width: 3,
                        color: Colors.green,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Center(
                      child: Text("20"),
                    ),
                  ),
                  MyCustomSpace(width: 0.0, height: 10.0),
                  Text("Sick"),
                ],
              ),
            ],
          ),
          MyCustomSpace(width: 0.0, height: 15.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyCustomSpace(width: 0.0, height: 30.0),
              Text(
                "Pending for Approval",
                style: TextStyle(fontSize: 15, color: Colors.deepPurple),
              ),
            ],
          ), //Pending For Apporval
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  MyCustomSpace(width: 0.0, height: 10.0),
                  Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/leave.png'),
                          fit: BoxFit.contain),
                    ),
                  ),
                  MyCustomSpace(width: 0.0, height: 10.0),
                  Text("Leave"),
                ],
              ),
              Column(
                children: [
                  MyCustomSpace(width: 0.0, height: 10.0),
                  Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/employee.png'),
                          fit: BoxFit.contain),
                    ),
                  ),
                  MyCustomSpace(width: 0.0, height: 10.0),
                  Text("Employee"),
                ],
              ),
              Column(
                children: [
                  MyCustomSpace(width: 0.0, height: 10.0),
                  Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/certificate_icon.png'),
                          fit: BoxFit.contain),
                    ),
                  ),
                  MyCustomSpace(width: 0.0, height: 10.0),
                  Text("Certificate"),
                ],
              ),
              Column(
                children: [
                  MyCustomSpace(width: 0.0, height: 10.0),
                  Container(
                    width: 36.0,
                    height: 36.0,
                    decoration: new BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/assigner_icon.png'),
                          fit: BoxFit.contain),
                    ),
                  ),
                  MyCustomSpace(width: 0.0, height: 10.0),
                  Text("Assigner"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
