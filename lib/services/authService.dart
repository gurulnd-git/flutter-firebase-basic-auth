import 'package:firebase_auth/firebase_auth.dart';
import 'package:temp/models/user.dart';
import 'package:temp/services/dbService.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        .map(_userFromFirebaseUser);
  }

  // Sign in email/pass
  Future signInWithEmailPass() async {
    try {
      AuthResult authResult = await _auth.signInWithEmailAndPassword(email: null, password: null);
      FirebaseUser user = authResult.user;
      return _userFromFirebaseUser(user);
    } catch(e) {
        print("AuthError: " + e.toString());
    }
  }

  // Google log in
  Future signWithGoogle() async {
      try {
        //_auth
      } catch(e) {

      }
    }

  // Google log in
  Future signInAnonomusly() async {
    try {
      AuthResult authResult = await _auth.signInAnonymously();
      FirebaseUser user = authResult.user;

      return user;
    } catch(e) {
      print("Auth Error: " + e.toString());
    }
  }

    // sign in with email and password
    Future signInWithEmailAndPassword(String email, String password) async {
      try {
        AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;
        return user;
      } catch (error) {
        print(error.toString());
        return null;
      }
    }

    // register with email and password
    Future registerWithEmailAndPassword(String email, String password) async {
      try {
        AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
        FirebaseUser user = result.user;
        // create a new document for the user with the uid
        await DatabaseService(uid: user.uid).updateUserData('0','new crew member', 100);
        return _userFromFirebaseUser(user);
      } catch (error) {
        print(error.toString());
        return null;
      }
    }

    // sign out
    Future signOut() async {
      try {
        return await _auth.signOut();
      } catch (error) {
        print(error.toString());
        return null;
      }
    }
}