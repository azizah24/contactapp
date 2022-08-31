import 'package:contactapp/api_service/api-service.dart';
import 'package:contactapp/pages/home_page.dart';
import 'package:contactapp/theme.dart';
import 'package:flutter/material.dart';

class AddEmployee extends StatefulWidget {
  const AddEmployee({Key? key}) : super(key: key);

  @override
  State<AddEmployee> createState() => _AddEmployeeState();
}

class _AddEmployeeState extends State<AddEmployee> {
  TextEditingController name = new TextEditingController();
  TextEditingController job = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Employee'),
        backgroundColor: primary400,
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              TextField(
                controller: name,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: job,
                decoration: InputDecoration(labelText: 'Job'),
              ),
              SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () async {
                  await APIService().addEmployee(name.text, job.text);
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: primary400,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(
                    'Add Employee',
                    style: blackMed.copyWith(color: neutral100),
                  )),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
