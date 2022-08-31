import 'package:contactapp/model/view_model_user.dart';
import 'package:contactapp/pages/add_employee.dart';
import 'package:contactapp/theme.dart';
import 'package:contactapp/widget/card_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<UserViewModels>? userViewModel;
  bool loading = true;

  getData() async {
    Provider.of<UsersViewModel>(context, listen: false).getalldata();
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget buildUI(UsersViewModel users) {
    if (users.current != null) {
      return users.current!.isEmpty
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 120,
                  ),
                  Icon(Icons.hourglass_empty),
                  SizedBox(
                    height: 20,
                  ),
                  Text("No employee data, let's make your report",
                      style: blacklight400),
                ],
              ),
            )
          : CardUser(users.current);
    } else {
      return Padding(
        padding: const EdgeInsets.all(40),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
                color: neutral100,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: neutral500.withOpacity(0.25),
                    blurRadius: 4,
                    spreadRadius: 0,
                    offset: Offset(1, 1),
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      child: CircularProgressIndicator(
                    color: Colors.blue,
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Sedang mengunduh data\nmohon tunggu sebentar',
                    style: blackMed,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var dataView = Provider.of<UsersViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Employees'),
        centerTitle: false,
        backgroundColor: primary400,
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () => setState(() {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddEmployee()),
            );
          }),
          elevation: 4,
          tooltip: 'Tambahkan',
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 24,
          ),
          backgroundColor: primary500,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      body: ListView(children: [buildUI(dataView)]),
    );
  }
}
