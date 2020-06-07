import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<String> get onAuthStateChanged =>
      _auth.onAuthStateChanged.map(
            (FirebaseUser user) => user?.uid,
      );

  Future<String> createUserWithEmailAndPassword(String email, String password,
      String name) async {
    final currentUser = await _auth.createUserWithEmailAndPassword(
      email: email, password: password,);

    await updateUserName(name, currentUser.user);
    return currentUser.user.uid;
  }

  Future updateUserName(String name, FirebaseUser currentUser) async {
    var userUpdateInfo = UserUpdateInfo();
    userUpdateInfo.displayName = name;
    await currentUser.updateProfile(userUpdateInfo);
    await currentUser.reload();
  }

  Future<String> signInWithEmailAndPassword(String email,
      String password) async {
    return (await _auth.signInWithEmailAndPassword(
        email: email, password: password)).user.uid;
  }
}
