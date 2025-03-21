import 'package:flutter/material.dart';
import 'screens/travelguide_chatbot_screen.dart';
import 'screens/home_screen.dart';
import 'screens/translator_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: 'AI Travel Guide',
      theme: ThemeData( 
        primarySwatch: Colors.teal,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(secondary: Colors.lightBlueAccent),
        scaffoldBackgroundColor: Colors.lightBlue[50],
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
    // Controller for the destination entered on the Home Screen.
  final TextEditingController _destinationController = TextEditingController();

  
  int _selectedIndex = 0;


  List<Widget> get _screens => [
    HomeScreen(destinationController: _destinationController),
   ChatScreen(destinationController: _destinationController),
   TranslatorScreen(destinationController: _destinationController),
  ];

  void _onItemTapped(int index){
    setState((){
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:  AppBar(
        title: Text("AI Travel Guide"),
        ),
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.teal,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home),
            label: 'Home',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.chat),
            label: 'Chat',
            ),BottomNavigationBarItem(icon: Icon(Icons.translate),
            label: 'Translator',
            )
          ],),);
  }
}