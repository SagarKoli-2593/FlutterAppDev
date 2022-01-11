import 'package:flutter/material.dart';
import 'package:wordpair_generator/employee_details.dart';

class CardListItem extends StatefulWidget {
  final EmployeeDetails employeeDetails;

  CardListItem(this.employeeDetails);

  @override
  _CardListItemState createState() => _CardListItemState(employeeDetails);
}

class _CardListItemState extends State<CardListItem> {
  EmployeeDetails employeeDetails;

  _CardListItemState(this.employeeDetails);

  Widget get empCard {
    return new Container(
      padding: EdgeInsets.only(right: 4, left: 4, top: 4, bottom: 4),
      child: new Card(
          //margin: const EdgeInsets.only(top: 10),
          color: (Colors.blue),
          child: new Container(
            padding: EdgeInsets.only(bottom: 4, top: 1, right: 1, left: 1),
            child: Card(
                margin: const EdgeInsets.only(bottom: 4),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                        subtitle: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text("Name: ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(employeeDetails.name)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("City: ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(employeeDetails.city)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("Age: ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(employeeDetails.age)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("PhoneNumber: ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(employeeDetails.phoneNum)
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("Email: ",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(employeeDetails.email)
                          ],
                        ),
/*
                    Text(nameTxt.toString()),
                    Text(cityTxt.toString()),
                    Text(ageTxt.toString()),
                    Text(phoneNumTxt.toString()),
                    Text(emailTxt.toString()),*/
                      ],
                    ))
                  ],
                )),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: empCard,
    );
  }
}
