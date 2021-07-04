import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/src/data/usecase/impl/sign_in_usecase_impl.dart';
import 'package:todo/src/data/usecase/sign_in_usecase.dart';

final signInUseCaseProvider = Provider<SignInUseCase>((ref) {
    return SignInUseCaseImpl(ref.read);
});
