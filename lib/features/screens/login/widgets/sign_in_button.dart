import 'package:flutter/material.dart';

/// Sign in button with loading state
class SignInButton extends StatelessWidget {
  final bool isLoading;
  final VoidCallback? onPressed;

  const SignInButton({super.key, required this.isLoading, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            )
          : const Text('Sign In'),
    );
  }
}
