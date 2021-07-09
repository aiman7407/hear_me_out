import 'package:firebase_auth/firebase_auth.dart';
import 'package:hear_me_out/models/user.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  AppUser _userFromFirebase(User user) {
    return user != null ? AppUser(userId: user.uid) : null;
  }

  Future signupWithEmail({String email, String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return _userFromFirebase(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future signinwithEmai({String email, String password}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      return _userFromFirebase(user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future resetPassword({String email}) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signout() async {
    return await FirebaseAuth.instance.signOut();
  }
}
