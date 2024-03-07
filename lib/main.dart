import 'package:flutter/material.dart';
import 'presentation/dependency_injectors/get_it.dart';
import 'presentation/pages/home_page/home_page.dart';


void main() {
  GetItRegister.register();
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pokedex',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Google',
        brightness: Brightness.light,
      ),
      home: const HomePage(),
    );
  }
}
