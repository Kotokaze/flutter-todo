import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loadingStateViewModelProvider = ChangeNotifierProvider<LoadingStateViewModel>((ref) {
    return LoadingStateViewModel();
});

class LoadingStateViewModel extends ChangeNotifier {
  bool isLoading = false;

  Future whileLoading(Future Function() futureFunc) {
    return Future.microtask(() {
      isLoading = true;
      notifyListeners();
    }).then((_) => futureFunc()).whenComplete(() {
      isLoading = false;
      notifyListeners();
    });
  }
}
