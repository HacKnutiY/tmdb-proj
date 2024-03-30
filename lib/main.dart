import 'package:flutter/material.dart';
import 'package:my_app/routes/example.dart';
import 'package:my_app/routes/home_screen.dart';
import 'package:my_app/routes/sign_screen.dart';
import 'package:my_app/themes/app_colors.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: AppColors.basicGrey),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.basicGrey,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
          )),
      routes: {
        'signScreen/': (context) => SignScreen(),
        'homeScreen/': (context) => HomeScreen(),
      },
      initialRoute: 'homeScreen/',
    );
  }
}
