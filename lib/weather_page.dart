import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/Providers/future_provider/weather_provider.dart';

class WeatherPage extends ConsumerWidget {
  const WeatherPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Weather Page")),
      body: ref
          .watch(weatherProvider)
          .when(
            data: (data) {
              return Center(child: Text(data));
            },
            error: (error, stackTrace) {
              return Text(error.toString());
            },
            loading: () {
              return Center(child: CircularProgressIndicator());
            },
          ),
    );
  }
}
