import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:todo/src/data/provider/firebase_crashlytics_provider.dart';

final loggerProvider = Provider((_) => SimpleLogger()
  ..setLevel(Level.FINEST, includeCallerInfo: true)
  ..onLogged = (String log, LogInfo info) async {
    if (Level.SEVERE <= info.level) {
      final FirebaseCrashlytics _crashlytics = ProviderContainer().read(firebaseCrashlyticsProvider);
      await _crashlytics.log(log);
    }
  }
);
