import 'package:firebase_auth/firebase_auth.dart';
import 'register_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> registerUser(RegisterModel model) async {
    try {
      // Create user in Firebase Authentication
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

      print("User registered and details added to Firestore");
    } catch (e) {
      print("Error during registration: ${e.toString()}");
      // Handle errors appropriately (e.g., show a message to the user)
    }
  }
}
