import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:simple_logger/simple_logger.dart';
import 'package:todo/src/app/app.dart';
import 'package:todo/src/data/provider/firebase_crashlytics_provider.dart';
import 'package:todo/src/data/provider/logger_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final ProviderContainer container = ProviderContainer();
  late final FirebaseCrashlytics _crashlytics = container.read(firebaseCrashlyticsProvider);
  late final SimpleLogger _logger = container.read(loggerProvider);

  await _crashlytics.setCrashlyticsCollectionEnabled(kDebugMode);
  FlutterError.onError = await _crashlytics.recordFlutterError;

  const String FLAVOR = String.fromEnvironment('FLAVOR', defaultValue: "production");
  _logger.info("[Flavor: ${FLAVOR}, isCrashlyticsCollectionEnabled: ${_crashlytics.isCrashlyticsCollectionEnabled}]");

  runZonedGuarded(
    () => runApp(ProviderScope(child: App(flavor: FLAVOR))),
    (err, stack) => _crashlytics.recordError(err, stack)
  );
}
