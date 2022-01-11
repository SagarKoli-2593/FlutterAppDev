import 'package:flutter/material.dart';
import 'package:wordpair_generator/custom_card.dart';
import 'package:wordpair_generator/employee_details.dart';
import 'form_screen.dart';
import 'homepage_listview.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple[900]),
        home: new MyHomePage());
  }
}

class DynamicListView extends StatefulWidget {
  @override
  _MyStateList createState() => _MyStateList();
}

class _MyStateList extends State<DynamicListView> {
  List<EmployeeDetails>? employeeDetails;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();


  @override
  Widget build(BuildContext context) {

    if(employeeDetails == null){
      employeeDetails = [];
    }

    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text("Dynamic ListView"),
      ),
      body: new ListView.builder(
        itemCount: employeeDetails!.length,
        itemBuilder: (context, index) {

          return CardListItem(employeeDetails![index]);
          //print('sss' + employeeDetails![index].email);
          return ListTile(
            title: new Text(employeeDetails![index].name),
            subtitle: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(child: ListTile(title: Text(employeeDetails![index].email),),),
                Card(child: ListTile(title: Text(employeeDetails![index].city),),),
                Card(child: ListTile(title: Text(employeeDetails![index].age),),),
                Card(child: ListTile(title: Text(employeeDetails![index].phoneNum),),),
                //Text(employeeDetails![index].name),
                /*Text(employeeDetails![index].email),
                Text(employeeDetails![index].city),
                Text(employeeDetails![index].age),
                Text(employeeDetails![index].phoneNum),*/
              ],
            ),
          );
        },
        /*separatorBuilder: (context, index) {
          return Divider();
        },*/
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
        onPressed: () {
          /*Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FormScreen()));*/
          _navtigateAndDisplayResult(context);
        },
      ),
    );
  }

  _navtigateAndDisplayResult(BuildContext context) async {
    // Navigator.push returns a Future that will complete after we call Navigator.pop on the SecondScreenForResult!
    final result = await Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new FormScreen()))
        .then((value) {
      setState(() {
        var detais = value as EmployeeDetails;
        employeeDetails!.add(detais);
        print(detais.phoneNum);
        print(detais.name);
        print(detais.city);
        print(detais.age);
        print(detais.email);

        // After the Selection Screen returns a result, show it in a Snackbar!
        _scaffoldKey.currentState!.showSnackBar(new SnackBar(
            content: new Text("Resilt : ${detais.phoneNum}"),
            duration: new Duration(seconds: 5),
            action: new SnackBarAction(label: "OK", onPressed: () {})));
      });
    });

    setState(() {});
  }
}
