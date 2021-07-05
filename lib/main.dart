import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:todo/src/app/app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(kDebugMode);
  FlutterError.onError = (errDetails) async
      => await FirebaseCrashlytics.instance.recordFlutterError(errDetails);

  SimpleLogger logger = SimpleLogger();
  const String FLAVOR = String.fromEnvironment('FLAVOR', defaultValue: "production");
  logger.info(FLAVOR);

  runZonedGuarded(
    () => runApp(ProviderScope(child: App())),
    (err, stack) => FirebaseCrashlytics.instance.recordError(err, stack)
  );
}
