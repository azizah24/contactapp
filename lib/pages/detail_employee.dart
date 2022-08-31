import 'package:contactapp/theme.dart';
import 'package:flutter/material.dart';

class DetailEmployee extends StatefulWidget {
  dynamic dataEmploye;
  DetailEmployee(this.dataEmploye, {Key? key}) : super(key: key);

  @override
  State<DetailEmployee> createState() => _DetailEmployeeState();
}

class _DetailEmployeeState extends State<DetailEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary400,
        elevation: 0,
      ),
      body: ListView(children: [
        Container(
            decoration: BoxDecoration(color: primary400),
            padding: EdgeInsets.all(50),
            child: Column(
              children: [
                Image.network(
                  '${widget.dataEmploye.avatar}',
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  '${widget.dataEmploye.firstName} ${widget.dataEmploye.lastName}',
                  style: blackMed600.copyWith(color: neutral100, fontSize: 20),
                )
              ],
            )),
        SizedBox(
          height: 12,
        ),
        Container(
          margin: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(color: neutral100, boxShadow: [
            BoxShadow(
                color: neutral500.withOpacity(0.12),
                blurRadius: 4,
                spreadRadius: 0,
                offset: Offset(0, 1)),
          ]),
          child: Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.dataEmploye.firstName} ${widget.dataEmploye.lastName}',
                  style: blackMed600,
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  '${widget.dataEmploye.email}',
                  style: blacklight500,
                ),
              ],
            )
          ]),
        )
      ]),
    );
  }
}
