import 'package:flutter/material.dart';
import 'package:app_demo/loginScreen.dart';
import 'package:app_demo/regScreen.dart';
import 'package:app_demo/auth_service.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final AuthService authService = AuthService(); // ✅ Create an instance

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff8e44ad),
              Color(0xffd35400),
            ],
          ),
        ),
        child: Column(
          children: [
            const Spacer(flex: 2),
            _buildAnimatedLogo(),
            const SizedBox(height: 40),
            _buildWelcomeText(),
            const SizedBox(height: 10),
            _buildSubtitleText(),
            const SizedBox(height: 40),
            _buildAnimatedButton(context, 'SIGN IN', const loginScreen(), isGradient: true),
            const SizedBox(height: 20),
            _buildAnimatedButton(context, 'SIGN UP', const RegScreen(), isGradient: false),
            const Spacer(flex: 1),
            _buildSocialMediaSection(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Animated Logo
  Widget _buildAnimatedLogo() {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 800),
      tween: Tween<double>(begin: 0.8, end: 1.0),
      curve: Curves.easeInOut,
      builder: (context, scale, child) {
        return Transform.scale(
          scale: scale,
          child: Hero(
            tag: 'logo',
            child: CircleAvatar(
              radius: 100,
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildWelcomeText() {
    return AnimatedOpacity(
      opacity: _controller.value,
      duration: const Duration(milliseconds: 800),
      child: const Text(
        'Welcome Back',
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, letterSpacing: 1.5, color: Colors.white),
      ),
    );
  }

  Widget _buildSubtitleText() {
    return AnimatedOpacity(
      opacity: _controller.value,
      duration: const Duration(milliseconds: 800),
      child: const Text(
        'Sign in or create an account to continue',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white70),
      ),
    );
  }

  Widget _buildAnimatedButton(BuildContext context, String text, Widget screen, {bool isGradient = false}) {
    return AnimatedScale(
      scale: _controller.value,
      duration: const Duration(milliseconds: 800),
      curve: Curves.easeInOut,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
        },
        child: Container(
          height: 55,
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: isGradient
                ? const LinearGradient(colors: [Color(0xff8e44ad), Color(0xffd35400)])
                : null,
            color: isGradient ? null : Colors.white,
            border: isGradient ? null : Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10, offset: const Offset(2, 4)),
            ],
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: isGradient ? Colors.white : Colors.black),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialMediaSection() {
    return Column(
      children: [
        const Text('Login with Social Media', style: TextStyle(fontSize: 16, color: Colors.white70)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon('assets/facebook.png', authService.signInWithGoogle),
            const SizedBox(width: 20),
            _buildSocialIcon('assets/google.png', authService.signInWithGoogle),
          ],
        ),
      ],
    );
  }

  Widget _buildSocialIcon(String assetPath, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(assetPath, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
