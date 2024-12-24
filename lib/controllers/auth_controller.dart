import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxString email = ''.obs;
  RxString password = ''.obs;
  Future<void> registerUser() async {
    print('Email: ${email.value}, Password: ${password.value}');
    final trimmedEmail = email.value.trim();
    final trimmedPassword = password.value.trim();
    try {
      print('Email: $trimmedEmail, Password: $trimmedPassword');

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
      if (trimmedEmail.isEmpty || trimmedPassword.isEmpty) {
        throw Exception('Email or Password cannot be empty.');
      }
      print('Error: $e');
      Get.snackbar('Error', e.toString());
    }
  }
}
