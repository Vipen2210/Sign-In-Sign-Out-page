import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // create user obj based on firebase
  Stream<User> get user {
    return _auth.onAuthStateChanged
        .map((FirebaseUser user) => _userFromFirebaseUser(user));
  }

  // create user obj from firebase obj
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // sign in anonyms
  Future signInAnon() async {
    try {
      AuthResult result = await _auth
          .signInAnonymously(); // awiat for getting data from firebase just like delay in arduino
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign with email and pass
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
  // register with email and pass
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
