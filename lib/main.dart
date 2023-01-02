import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todoist/view/create_task.dart';
import 'package:todoist/view/home_screen.dart';
import 'package:todoist/view/splash_screen.dart';

void main() async {
  await GetStorage.init();
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: Colors.transparent, // navigation bar color bar color
  // ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () =>  SplashScreen()),
        GetPage(name: '/home', page: () =>  HomeScreen()),
        GetPage(name: '/createTask', page: () => CreateTask()),
      ],
    );
  }
}
