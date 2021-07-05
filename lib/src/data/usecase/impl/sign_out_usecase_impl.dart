import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/src/data/provider/firebase_auth_repository_provider.dart';
import 'package:todo/src/data/repository/firebase_auth_repository.dart';
import 'package:todo/src/data/usecase/sign_out_usecase.dart';

class SignOutUseCaseImpl implements SignOutUseCase {
  SignOutUseCaseImpl(this._reader);
  final Reader _reader;
  late final FirebaseAuthRepository _authRepo = _reader(firebaseAuthRepositoryProvider);

  @override
  Future<bool> execute() => _authRepo.signOut();
}
