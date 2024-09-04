import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app/app_widget.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(const AppWidget());

  Sentry.configureScope((scope) => scope.setTag('CLIENET_PEC', 'PANATTOS'));

  await SentryFlutter.init(
    (options) {
      options.dsn = 'https://a6ed52f0720a42798d85bab764927500@o1287716.ingest.sentry.io/6503284';
      options.tracesSampleRate = 1.0;
      options.maxBreadcrumbs = 1000;
    },
    appRunner: () => runApp(const AppWidget()),
  );
}
