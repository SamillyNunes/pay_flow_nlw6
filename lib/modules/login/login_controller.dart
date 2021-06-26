import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow_nlw6/models/user_model.dart';
import 'package:payflow_nlw6/shared/auth/auth_controller.dart';

class LoginController {
  final authController = AuthController();

  Future<void> googleSignOut(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    await _googleSignIn.signOut();

    await authController.resetUser(context);
    await Navigator.pushReplacementNamed(context, "/login");
    return;
  }

  Future<void> googleSignIn(BuildContext context) async {
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      final response = await _googleSignIn.signIn();
      final user = UserModel(
        name: response!.displayName!,
        imageUrl: response.photoUrl,
      );
      authController.setUser(context, user);
      print("response: $response");
    } catch (error) {
      authController.setUser(context, null);
      print(error);
    }
  }
}
