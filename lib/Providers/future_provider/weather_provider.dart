import 'package:flutter_riverpod/flutter_riverpod.dart';

final weatherProvider = FutureProvider<String>((ref) => fetchWeatherReport());

Future<String> fetchWeatherReport() async {
  return await Future.delayed(const Duration(seconds: 3), () => '33 C ');
}
