import 'package:chatapp/app/helpers/snack_bar_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chatapp/app/services/base_service.dart';

class UserService extends BaseService {
  Future<void> login({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'user-not-found') {
        message = 'No user found for that email!';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provived for that user!';
      }
      SnackBarHelper.errorSnackBar(message);
    } catch (e) {
      SnackBarHelper.errorSnackBar(e.toString());
    }
  }

  Future<void> signup(
      {required String email,
      required String password,
      required String confirmPassword}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak!';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exist with that email!';
      }
      SnackBarHelper.errorSnackBar(message);
    } catch (e) {
      SnackBarHelper.errorSnackBar(e.toString());
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
