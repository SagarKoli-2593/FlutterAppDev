import 'package:flutter/material.dart';
import 'package:wordpair_generator/employee_details.dart';
import 'package:wordpair_generator/main.dart';

class FormScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormScreenState();
  }
}

class _FormScreenState extends State<FormScreen> {
  late String name = "";
  late String age = "";
  late String city = "";
  late String email = "";
  late String phoneNumber = "";

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Widget _buildNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Name is required';
        }

        return null;
      },
      onSaved: (String? value) {
        name = value!;
      },
    );
  }

  Widget _buildAgeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Age'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Age is required';
        }
        return null;
      },
      onSaved: (String? value) {
        age = value!;
      },
    );
  }

  Widget _buildCityField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'City'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'City is required';
        }
        return null;
      },
      onSaved: (String? value) {
        city = value!;
      },
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Email is required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String? value) {
        email = value!;
      },
    );
  }

  Widget _buildPhoneNumField() {
    return TextFormField(
      maxLength: 10,
      decoration: InputDecoration(labelText: 'Phone number'),
      validator: (String? value) {
        if (value!.isEmpty) {
          return 'Phone Number is required';
        }

        if (value.length != 10) {
          return 'Please input valid phone number';
        }

        return null;
      },
      onSaved: (String? value) {
        phoneNumber = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("User Form")),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildNameField(),
              _buildAgeField(),
              _buildCityField(),
              _buildEmailField(),
              _buildPhoneNumField(),
              SizedBox(height: 100),
              TextButton(
                child: Text(
                  'Add User',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
                onPressed: () {
                  if (!formKey.currentState!.validate()) {
                    return;
                  }

                  formKey.currentState!.save();
/*
                  print(name);
                  print(age);
                  print(city);
                  print(email);
                  print(phoneNumber);*/

                  EmployeeDetails emp =
                      EmployeeDetails(name, city, age, phoneNumber, email);
                  //Navigator.of(context).push(MaterialPageRoute(builder: (context) => DynamicListView(empDetails: emp,)));
                  Navigator.pop(context, emp);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
