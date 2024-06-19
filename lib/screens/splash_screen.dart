import 'package:flutter/material.dart';
import 'package:levelupirl/services/auth_service.dart';
import 'package:levelupirl/utils/app_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<bool> checkIfUserIsSignedIn() async {
    return await AuthService.instance.isLoggedIn();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(
        future: checkIfUserIsSignedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Show loading indicator while waiting for auth check
            return const Center(child: CircularProgressIndicator());
          } else {
            // Check if user is signed in
            if (snapshot.data == true) {
              // If signed in, navigate to HomeScreen
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AppNavigation.goHome(context);
              });
            } else {
              // If not signed in, navigate to LoginScreen
              WidgetsBinding.instance.addPostFrameCallback((_) {
                AppNavigation.goToLogin(context);
              });
            }
            // Return an empty container to avoid widget tree errors
            return Container();
          }
        },
      ),
    );
  }
}