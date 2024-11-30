import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:infoprark_api_task/controller/add_to_cart_Screen_controller.dart';
import 'package:infoprark_api_task/controller/homeScreen_controller.dart';
import 'package:infoprark_api_task/firebase_options.dart';
import 'package:infoprark_api_task/view/home_screen/home_screen.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomescreenController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AddToCartScreenController(),
        )
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
