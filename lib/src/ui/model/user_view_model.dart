import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/src/data/model/user/user_model.dart';
import 'package:todo/src/data/provider/sign_in_usecase_provider.dart';
import 'package:todo/src/data/usecase/sign_in_usecase.dart';

final userViewModelProvider = ChangeNotifierProvider<UserViewModel>((ref) {
    return UserViewModel(ref.read);
});

class UserViewModel extends ChangeNotifier {
  UserViewModel(this._reader);
  final Reader _reader;
  late final SignInUseCase _signInUseCase = _reader(signInUseCaseProvider);
  UserModel? _user;

  UserModel? get user => _user;
  bool get isAuthenticated => (_user != null);

  Future<void> handleSignInWithGoogle() => _signInUseCase.executeWithGoogle()
      .then((user) {
        if (user != null) {
          _user = user;
          notifyListeners();
      }});
}
