import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/src/data/usecase/impl/sign_out_usecase_impl.dart';
import 'package:todo/src/data/usecase/sign_out_usecase.dart';

final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) {
    return SignOutUseCaseImpl(ref.read);
});
