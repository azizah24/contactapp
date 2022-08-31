import 'package:contactapp/model/view_model_user.dart';
import 'package:contactapp/pages/detail_employee.dart';
import 'package:flutter/material.dart';

class CardUser extends StatefulWidget {
  List<UserViewModels>? listUser;
  CardUser(this.listUser, {Key? key}) : super(key: key);

  @override
  State<CardUser> createState() => _CardUserState();
}

class _CardUserState extends State<CardUser> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.listUser?.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, snap) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailEmployee(widget.listUser?[snap])),
              );
            },
            child: Container(
              padding: EdgeInsets.all(12),
              child: Row(children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image:
                            NetworkImage('${widget.listUser?[snap].avatar}')),
                  ),
                ),
                SizedBox(
                  width: 12,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        '${widget.listUser?[snap].firstName} ${widget.listUser?[snap].lastName}'),
                    Text('${widget.listUser?[snap].email}')
                  ],
                )
              ]),
            ),
          );
        });
  }
}
