import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:levelupirl/firebase_options.dart';
import 'package:levelupirl/screens/splash_screen.dart';
import 'package:levelupirl/services/auth_service.dart';
import 'package:levelupirl/utils/app_theme.dart';

void main() async {
  // This must be called before anything else
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize services
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize Crashlytics
  // Synchronous errors
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  // Asynchronous errors
  PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };

  // Check if already logged in
  final isLoggedIn = await AuthService.instance.isLoggedIn();

  runApp(MainApp(isLoggedIn: isLoggedIn));
}

class MainApp extends StatelessWidget {
  final bool isLoggedIn;
  const MainApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.theme,
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
