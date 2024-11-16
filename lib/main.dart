import 'package:flutter/material.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:tranquil_admin_portal/src/app.dart';

void main() async{
  await SentryFlutter.init(
        (options) {
      options.dsn = 'https://862d0c1d603ef66424766fc388b33fdb@o4508213507588096.ingest.us.sentry.io/4508310539730944';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for tracing.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
      // The sampling rate for profiling is relative to tracesSampleRate
      // Setting to 1.0 will profile 100% of sampled transactions:
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(const App()),
  );
}
