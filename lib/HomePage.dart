// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practice/Providers/cart_quantity_provider.dart';
import 'package:riverpod_practice/Providers/theme_provider.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isDarkMode = ref.watch(themeProvider);

    return Scaffold(
      backgroundColor: isDarkMode == true ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text(
          "State - Provider Practice",
          style: TextStyle(
            color: isDarkMode == true ? Colors.white : Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: isDarkMode == true ? Colors.black : Colors.white,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 120),
          Consumer(
            builder: (context, ref, child) {
              int quantity = ref.watch(cartQuantityProvider);
              return Text(
                quantity.toString(),
                style: TextStyle(
                  color: isDarkMode == true ? Colors.white : Colors.black,
                  fontSize: 30,
                ),
              );
            },
          ),
          SizedBox(height: 20),
          MaterialButton(
            color: isDarkMode == true ? Colors.white : Colors.black,
            onPressed: () {
              if (ref.read(cartQuantityProvider) < 10) {
                ref.read(cartQuantityProvider.notifier).state++;
              }
            },
            child: Text(
              "+",
              style: TextStyle(
                color: isDarkMode == true ? Colors.black : Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(height: 10),
          MaterialButton(
            color: isDarkMode == true ? Colors.white : Colors.black,
            onPressed: () {
              if (ref.read(cartQuantityProvider) > 1) {
                ref.read(cartQuantityProvider.notifier).state--;
              }
            },
            child: Text(
              "-",
              style: TextStyle(
                color: isDarkMode == true ? Colors.black : Colors.white,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(height: 10),
          MaterialButton(
            color: isDarkMode == true ? Colors.white : Colors.black,
            onPressed: () {
              ref.read(cartQuantityProvider.notifier).state = 1;
            },
            child: Text(
              "Reset",
              style: TextStyle(
                color: isDarkMode == true ? Colors.black : Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: FloatingActionButton(
              backgroundColor: isDarkMode ? Colors.white : Colors.black,
              child: Icon(
                isDarkMode ? Icons.nightlight_round : Icons.wb_sunny,
                color: isDarkMode ? Colors.black : Colors.white,
              ),
              onPressed: () {
                ref.read(themeProvider.notifier).update((state) => !state);
              },
            ),
          ),
        ],
      ),
    );
  }
}
