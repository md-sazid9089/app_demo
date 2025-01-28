import 'package:flutter/material.dart';
import 'regScreen.dart';
import 'loginScreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the animation controller with a delay for smoother flow
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800), // Increased duration slightly for smoother animation
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
              Color(0xff8e44ad), // Modern purple
              Color(0xffd35400), // Modern orange
            ],
          ),
        ),
        child: Column(
          children: [
            const Spacer(flex: 2),

            // Animated Logo Section
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 800), // Increased duration for smoother animation
              tween: Tween<double>(begin: 0.8, end: 1.0),
              curve: Curves.easeInOut, // Smoother transition
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
            ),

            const SizedBox(height: 40),

            // Welcome Text with Fade-in Animation
            AnimatedOpacity(
              opacity: _controller.value,
              duration: const Duration(milliseconds: 800), // Increased duration for smoother fade-in
              child: const Text(
                'Welcome Back',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Subtitle Text with Fade-in Animation
            AnimatedOpacity(
              opacity: _controller.value,
              duration: const Duration(milliseconds: 800), // Increased duration for smoother fade-in
              child: const Text(
                'Sign in or create an account to continue',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Buttons
            _buildAnimatedButton(
              context,
              'SIGN IN',
              const loginScreen(),
              isGradient: true,
            ),
            const SizedBox(height: 20),
            _buildAnimatedButton(
              context,
              'SIGN UP',
              const RegScreen(),
              isGradient: false,
            ),

            const Spacer(flex: 1),

            // Social Media Section with Scaling Animation
            AnimatedOpacity(
              opacity: _controller.value,
              duration: const Duration(milliseconds: 800), // Increased duration for smoother opacity
              child: const Text(
                'Login with Social Media',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Social Media Icons with Faster Scaling
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon('assets/facebook.png'),
                const SizedBox(width: 20),
                _buildSocialIcon('assets/twitter.png'),
                const SizedBox(width: 20),
                _buildSocialIcon('assets/github.png'),
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // Animated Button
  Widget _buildAnimatedButton(BuildContext context, String text, Widget screen, {bool isGradient = false}) {
    return AnimatedScale(
      scale: _controller.value,
      duration: const Duration(milliseconds: 800), // Increased duration for smoother scaling
      curve: Curves.easeInOut, // Smoother scaling effect
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Container(
          height: 55,
          width: 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: isGradient
                ? const LinearGradient(
              colors: [Color(0xff8e44ad), Color(0xffd35400)],
            )
                : null,
            color: isGradient ? null : Colors.white,
            border: isGradient ? null : Border.all(color: Colors.white, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: const Offset(2, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isGradient ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Social Media Icon with Smoother Scaling
  Widget _buildSocialIcon(String assetPath) {
    return GestureDetector(
      onTap: () {
        // Handle social media login
      },
      child: MouseRegion(
        onEnter: (_) => setState(() {}),
        onExit: (_) => setState(() {}),
        child: AnimatedScale(
          scale: _controller.value,
          duration: const Duration(milliseconds: 600), // Increased duration for smoother scaling
          curve: Curves.easeInOut, // Smoother scaling effect
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(2, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(assetPath, fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}
