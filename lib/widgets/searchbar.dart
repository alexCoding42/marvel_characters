import 'dart:async';

import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  final Function(String) fetchCharacters;

  const SearchBar({super.key, required this.fetchCharacters});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  Color iconColor = Colors.grey;
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Focus(
        onFocusChange: (hasFocus) {
          if (hasFocus) {
            setState(() {
              iconColor = Colors.red[800] ?? Colors.red;
            });
          } else {
            setState(() {
              iconColor = Colors.grey;
            });
          }
        },
        child: TextField(
          onSubmitted: (newValue) {
            setState(() {
              name = newValue;
            });
            if (name.trim().isNotEmpty) {
              widget.fetchCharacters(name);
            }
          },
          decoration: InputDecoration(
            icon: Icon(
              Icons.search,
              color: iconColor,
            ),
            hintText: "Search...",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
