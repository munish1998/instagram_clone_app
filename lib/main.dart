
import 'package:demo_projectapp/Provider/Like_Provider.dart';
import 'package:demo_projectapp/Routes/Routes.dart';
import 'package:demo_projectapp/Routes/Routes_Name.dart';
import 'package:demo_projectapp/View_Model/Auth_View_Model.dart';
import 'package:demo_projectapp/View_Model/User_View_Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

late Size mq;
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
 
  @override
  Widget build(BuildContext context) {
    return   MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthViewModel()),
          ChangeNotifierProvider(create: (_) => UserViewModel()),
          ChangeNotifierProvider(create: (_) => LikeProvider()),
          
        ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: RoutesName.SplashScreen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
