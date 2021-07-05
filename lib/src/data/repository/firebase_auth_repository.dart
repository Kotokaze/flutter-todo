import 'package:todo/src/data/model/user/user_model.dart';

abstract class FirebaseAuthRepository {
  Future<UserModel?> currentUser();
  Future<UserModel?> signInWithGoogle();
  Future<UserModel?> signInWithGitHub();
  Future<bool> signOut();
}
