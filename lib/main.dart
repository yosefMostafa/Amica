import 'package:amica/Screens/Providers/Auth.dart';
import 'package:amica/Widgets/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:amica/Screens/Sign/Splash.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';


//flutter run --no-sound-null-safety
void main() async {
  Paint.enableDithering = true;
  await GetStorage.init();
  Firebase.initializeApp();
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider<Auth>(create: (_) => Auth())],
      child: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppstate createState() => _MyAppstate();
}

class _MyAppstate extends State<MyApp> {
  final introdate = GetStorage();
  final mycolors = Mycolors();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    introdate.writeIfNull('seen', false);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amica',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: mycolors.tangora,
      ),
      home: Splash(introdate.read('seen')),
    );
  }
}
