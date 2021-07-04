import 'package:todo/src/data/model/user/user_model.dart';

abstract class SignInUseCase {
  Future<UserModel?> executeWithGoogle();
  Future<UserModel?> executeWithGitHub();
}
