import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../core/theme/colors.dart';
import '../../auth/auth.dart';
import 'widgets/widgets.dart';

/// Login screen with email and password authentication
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) return;

    await ref
        .read(authControllerProvider.notifier)
        .login(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final isLoading = authState is Authenticating;

    // Show error if auth failed
    ref.listen<AuthState>(authControllerProvider, (previous, next) {
      if (next is AuthError) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.message),
              backgroundColor: kRedColor,
              duration: const Duration(seconds: 4),
              action: SnackBarAction(
                label: 'Dismiss',
                textColor: kTextLight,
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ref.read(authControllerProvider.notifier).clearError();
                },
              ),
            ),
          );
        }
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const LoginHeader(),
                  const SizedBox(height: 48),
                  EmailField(controller: _emailController),
                  const SizedBox(height: 16),
                  PasswordField(
                    controller: _passwordController,
                    obscurePassword: _obscurePassword,
                    onToggleVisibility: _togglePasswordVisibility,
                    onFieldSubmitted: _handleLogin,
                  ),
                  const SizedBox(height: 8),
                  // Forgot password link
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => context.push('/forgot-password'),
                      child: const Text('Forgot Password?'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Show error message if present
                  if (authState is AuthError)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: kRedColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: kRedColor),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.error_outline, color: kRedColor),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              authState.message,
                              style: const TextStyle(color: kRedColor),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.close, color: kRedColor),
                            onPressed: () {
                              ref
                                  .read(authControllerProvider.notifier)
                                  .clearError();
                            },
                          ),
                        ],
                      ),
                    ),
                  if (authState is AuthError) const SizedBox(height: 16),
                  SignInButton(isLoading: isLoading, onPressed: _handleLogin),
                  const SizedBox(height: 24),
                  FutureBuilder<PackageInfo>(
                    future: PackageInfo.fromPlatform(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Center(
                          child: Text(
                            'Version ${snapshot.data!.version}',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(color: Colors.grey),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
