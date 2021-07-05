import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:todo/src/ui/component/loading/loading_widget.dart';
import 'package:todo/src/ui/model/loading_state_view_model.dart';

class LoadingContainer extends StatelessWidget {
  LoadingContainer({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          child,
          HookBuilder(builder: (context) {
            final state = useProvider(loadingStateViewModelProvider);
            return state.isLoading ? const LoadingWidget() : const SizedBox();
          })
        ],
      ),
    );
  }
}
