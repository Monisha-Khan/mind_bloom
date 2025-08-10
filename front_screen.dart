import 'package:flutter/material.dart';

class FrontScreen extends StatelessWidget {
  const FrontScreen({super.key});

  // Mock Google Sign-In
  Future<void> signInWithGoogle(BuildContext context) async {
    // Simulate success and go to onboarding
    await Future.delayed(const Duration(seconds: 1));
    if (context.mounted) {
      Navigator.pushNamed(context, '/onboarding');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 80),
            // Top illustration
            Image.asset('assets/mind_bloom_logo.png', height: 280),

            const SizedBox(height: 20),
            const Text(
              "Your safe space for\nmind and soul.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              "Guided meditations, mood tracking, and\ncommunity support — all in one app.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),

            const SizedBox(height: 30),

            // Login with Email Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4CAF50),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () => Navigator.pushNamed(context, '/login'),
                child: const Text("Log in with email", style: TextStyle(fontSize: 16)),
              ),
            ),

            const SizedBox(height: 16),
            const Text("or", style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),

            // Mock Google Login Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  minimumSize: const Size(double.infinity, 50),
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                icon: Image.asset('assets/google_logo.png', height: 24),
                label: const Text("Continue with Google"),
                onPressed: () => signInWithGoogle(context), // mock method
              ),
            ),

            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "By continuing, you agree to Mind Bloom’s Terms & Conditions and Privacy Policy.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
