import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:todo/src/data/model/user/user_model.dart';
import 'package:todo/src/data/provider/firebase_auth_provider.dart';
import 'package:todo/src/data/provider/logger_provider.dart';
import 'package:todo/src/data/repository/firebase_auth_repository.dart';

class FirebaseAuthDataSource implements FirebaseAuthRepository {
  FirebaseAuthDataSource(this._reader);
  final Reader _reader;
  late final FirebaseAuth _firebaseAuth = _reader(firebaseAuthProvider);
  late final SimpleLogger _logger = _reader(loggerProvider);
  late final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  Future<UserModel?> currentUser() async {
    // TODO: implement signInWithGitHub
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> signInWithGitHub() async {
    // TODO: implement signInWithGitHub
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null)
        return throw StateError("Cancelled");

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _firebaseAuth.signInWithCredential(authCredential);
      final User? firebaseUser = userCredential.user;
      final UserModel? user = _firebaseUserToUserModel(firebaseUser);

      return Future.value(user);
    } catch (e) {
      _logger.warning(e);
      return Future.error(e);
    }
  }

  @override
  Future<bool> signOut() async => await this
      ._firebaseAuth.signOut()
      .then((_) => Future.value(true));

  UserModel? _firebaseUserToUserModel(User? firebaseUser) => (firebaseUser != null)
      ? UserModel(
          uid: firebaseUser.uid,
          name: firebaseUser.displayName,
          email: firebaseUser.email,
          phoneNumber: firebaseUser.phoneNumber,
          photoUrl: firebaseUser.photoURL,
        )
      : null;
}
