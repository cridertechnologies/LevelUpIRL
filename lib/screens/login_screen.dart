import 'package:flutter/material.dart';
import 'package:levelupirl/services/auth_service.dart';
import 'package:levelupirl/utils/app_navigation.dart';
import 'package:levelupirl/utils/app_theme.dart';
import 'package:social_login_buttons/social_login_buttons.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordVerifyController = TextEditingController();
  bool _isObscure = true;

  void _redirectIfLoggedIn() async {
    if (await AuthService.instance.isLoggedIn()) {
      if(!mounted) return;
      // Let the user know they're logged in
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Logged in!'),
          backgroundColor: AppTheme.primary,
          duration: const Duration(seconds: 2),
        )
      );
      AppNavigation.goHome(context);
    }
  }

  Widget _buildSignInTab(){
    return Column(
      children: [
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
        ),
        TextField(
          controller: _passwordController,
          obscureText: _isObscure,
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            await AuthService.instance.signIn(
              _emailController.text,
              _passwordController.text,
            );
            _redirectIfLoggedIn();
          },
          child: const Text('Sign In'),
        ),
        const SizedBox(height: 10),
        TextButton(
          onPressed: (){
            AuthService.instance.resetPassword(_emailController.text);
          },
          child: const Text('Forgot Password?'),
        ),
      ],
    );
  }

  Widget _buildSignUpTab(){
    return Column(
      children: [
        TextField(
          controller: _emailController,
          decoration: const InputDecoration(
            labelText: 'Email',
          ),
        ),
        TextField(
          controller: _passwordController,
          obscureText: _isObscure,
          decoration: InputDecoration(
            labelText: 'Password',
            suffixIcon: IconButton(
              icon: Icon(_isObscure ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            ),
          ),
        ),
        TextField(
          controller: _passwordVerifyController,
          obscureText: _isObscure,
          decoration: const InputDecoration(
            labelText: 'Verify Password',
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            await AuthService.instance.register(
              _emailController.text,
              _passwordController.text,
            );
            _redirectIfLoggedIn();
          },
          child: const Text('Sign Up'),
        ),
      ],
    );
  }

  Widget _buildSocialSignInButtons(){
    return Column(
      children: [
        const Text('Or sign in with'),
        const SizedBox(height: 10),
        SocialLoginButton(
          buttonType: SocialLoginButtonType.google,
          onPressed: AuthService.instance.signInWithGoogle,
        ),
        const SizedBox(height: 10),
        SocialLoginButton(
          buttonType: SocialLoginButtonType.apple,
          onPressed: AuthService.instance.signInWithApple,
        ),
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TabBar(
                indicatorColor: AppTheme.primary,
                tabs: const [
                  Tab(text: 'Sign In'),
                  Tab(text: 'Sign Up'),
                ]
              ),
              TabBarView(
                children: [
                  _buildSignInTab(),
                  _buildSignUpTab(),
                ]
              ),
              const SizedBox(height: 15),
              _buildSocialSignInButtons(),
            ]
          ),
        ),
      )
    );
  }
}