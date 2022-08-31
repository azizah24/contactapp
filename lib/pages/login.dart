import 'package:contactapp/api_service/api-service.dart';
import 'package:contactapp/pages/home_page.dart';
import 'package:contactapp/theme.dart';
import 'package:flutter/material.dart';

class LoginAct extends StatefulWidget {
  const LoginAct({Key? key}) : super(key: key);

  @override
  State<LoginAct> createState() => _LoginActState();
}

class _LoginActState extends State<LoginAct> {
  TextEditingController email = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    email.text = 'eve.holt@reqres.in';
    pass.text = 'cityslicka';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                readOnly: true,
                controller: email,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                readOnly: true,
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: () async {
                  await APIService().login(email.text, pass.text).whenComplete(
                      () => Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomePage())));
                },
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: primary400,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(
                    'Login',
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
