import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/config/biometric_config.dart';

part 'biometric_config_provider.g.dart';

@riverpod
BiometricConfig biometricConfig(Ref ref) => const BiometricConfig();
