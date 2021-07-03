import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/src/data/datasource/firebase_auth_datasource.dart';
import 'package:todo/src/data/repository/firebase_auth_repository.dart';

final firebaseAuthrepositoryProvider = Provider<FirebaseAuthRepository>((ref) {
    return FirebaseAuthDataSource(ref.read);
});
