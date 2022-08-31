import 'package:contactapp/api_service/api-service.dart';
import 'package:contactapp/model/model_user.dart';
import 'package:flutter/material.dart';

class UsersViewModel extends ChangeNotifier {
  List<UserViewModels>? current;

  Future<void> getalldata() async {
    final current = await APIService().getListUsers();
    this.current =
        current!.map((data) => UserViewModels(modelUsers: data)).toList();
    notifyListeners();
    (current);
  }
}

class UserViewModels {
  final ModelUsers? modelUsers;

  UserViewModels({this.modelUsers});

  String? get firstName {
    return this.modelUsers?.firstName;
  }

  String? get lastName {
    return this.modelUsers?.lastName;
  }

  String? get avatar {
    return this.modelUsers?.avatar;
  }

  String? get email {
    return this.modelUsers?.email;
  }

  int? get id {
    return this.modelUsers?.id;
  }
}
