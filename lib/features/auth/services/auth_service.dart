import 'package:e_commerce_app/constants/error_handling.dart';
import 'package:e_commerce_app/constants/utils.dart';
import 'package:e_commerce_app/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../../constants/global_varialbles.dart';

class AuthService {
  //sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );

      http.Response res =
          await http.post(Uri.parse('$uri/api/signup'), body: user.toJson(),

              //express.json
              headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Account Created Proceed to Login');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
