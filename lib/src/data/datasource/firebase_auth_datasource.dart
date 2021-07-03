import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/src/data/model/user/user_model.dart';
import 'package:todo/src/data/provider/firebase_auth_provider.dart';
import 'package:todo/src/data/repository/firebase_auth_repository.dart';

class FirebaseAuthDataSource implements FirebaseAuthRepository {
  FirebaseAuthDataSource(this._reader);
  final Reader _reader;
  late final FirebaseAuth _firebaseAuth = _reader(firebaseAuthProvider);

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
    // TODO: implement signInWithGitHub
    throw UnimplementedError();
  }

  @override
  Future<bool> signOut() async {
    // TODO: implement signOut
    throw UnimplementedError();
  }

}
