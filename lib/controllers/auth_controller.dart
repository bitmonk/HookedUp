import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  Future<void> registerUser() async {
    try {
      final trimmedEmail = email.value.trim();
      final trimmedPassword = password.value.trim();

      if (trimmedEmail.isEmpty || trimmedPassword.isEmpty) {
        throw Exception('Email or Password cannot be empty.');
      }

      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: trimmedEmail,
        password: trimmedPassword,
      );

      print('User registered successfully: ${userCredential.user}');
    } on FirebaseAuthException catch (e) {
      print('Firebase Auth Error: $e');
      Get.snackbar('Error', e.message ?? 'Something went wrong.');
    } catch (e) {
      print('Error: $e');
      Get.snackbar('Error', e.toString());
    }
  }
}
