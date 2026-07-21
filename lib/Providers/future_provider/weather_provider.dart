import 'package:flutter_riverpod/flutter_riverpod.dart';

final weatherProvider = FutureProvider((ref) async {
  return await Future.delayed(
    Duration(seconds: 3),
    () => "Welcome back, user!",
  );
});
