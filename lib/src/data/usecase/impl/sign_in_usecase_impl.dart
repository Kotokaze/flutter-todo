import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/src/data/model/user/user_model.dart';
import 'package:todo/src/data/provider/firebase_auth_repository_provider.dart';
import 'package:todo/src/data/repository/firebase_auth_repository.dart';
import 'package:todo/src/data/usecase/sign_in_usecase.dart';

class SignInUseCaseImpl implements SignInUseCase {
  SignInUseCaseImpl(this._reader);
  final Reader _reader;
  late final FirebaseAuthRepository _authRepo = _reader(firebaseAuthRepositoryProvider);

  @override
  Future<UserModel?> executeWithGitHub() async {
    // TODO: implement executeWithGitHub
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> executeWithGoogle() async => _authRepo.signInWithGoogle();
}
