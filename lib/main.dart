import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:marvel_characters/constants/colors.dart';
import 'package:marvel_characters/screens/characters_screen.dart';
import 'package:marvel_characters/screens/movies_screen.dart';
import 'package:marvel_characters/view_models/character_list_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _selectedIndex = 0;
  final List<Widget> _children = const [
    CharactersScreen(),
    MoviesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CharacterListViewModel(),
      child: MaterialApp(
        title: 'Marvel Universe',
        debugShowCheckedModeBanner: false,
        home: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            body: _children[_selectedIndex],
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[300]!,
                    offset: const Offset(0, -2),
                    blurRadius: 5,
                  ),
                ],
              ),
              child: BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    label: "Characters",
                    icon: Icon(Icons.groups),
                  ),
                  BottomNavigationBarItem(
                    label: "Movies",
                    icon: Icon(Icons.videocam),
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: kPrimaryColor,
                onTap: _onItemTapped,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
