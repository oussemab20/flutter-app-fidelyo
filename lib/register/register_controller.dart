import 'package:firebase_auth/firebase_auth.dart';
import 'register_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser(RegisterModel model) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      );

      // After successful registration, add user details to Firestore
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'fullName': model.fullName,
        'email': model.email,
        'phoneNumber': model.phoneNumber,
        'address': model.address,
        'location': model.location,
        'zipCode': model.zipCode,
      });
    } catch (e) {
      print(e.toString());
      // Handle errors appropriately
    }
  }
}
