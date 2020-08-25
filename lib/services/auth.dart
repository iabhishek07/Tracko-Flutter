import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';

//User Class
class AppUser {
  AppUser({@required this.uid});

  final String uid;
}

//Abstract Class
abstract class AuthBase {
  Future<AppUser> currentUser();

  Future<AppUser> signInAnonymously();

  Future<void> signOut();
}

//Auth Class with Firebase Auth Related Methods
class Auth implements AuthBase {
  final _firebaseAuth = FirebaseAuth.instance;

  AppUser _userFromFirebase(User user) {
    if (user == null) {
      return null;
    }
    return AppUser(uid: user.uid);
  }

  //Fetch current user
  @override
  Future<AppUser> currentUser() async {
    // ignore: await_only_futures
    final user = await _firebaseAuth.currentUser;
    return _userFromFirebase(user);
  }

  //Anonymous SignIn
  @override
  Future<AppUser> signInAnonymously() async {
    final authResult = await _firebaseAuth.signInAnonymously();
    return _userFromFirebase(authResult.user);
  }

  //SignOut User
  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
