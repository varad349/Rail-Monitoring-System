
import 'package:flutter/material.dart';
import 'dart:ui'; 

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onSearch;

  const CustomSearchBar({
    Key? key,
    required this.controller,
    required this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0), 
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0), 
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3), // Blurry dark background
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: TextField(
              controller: controller,
              onChanged: onSearch,
              decoration: InputDecoration(
                hintText: 'Type station name',
                hintStyle: TextStyle(color: Colors.white70), // Hint text color changed to white
                prefixIcon: Icon(Icons.search, color: Colors.greenAccent), // Updated icon color
                contentPadding: EdgeInsets.symmetric(vertical: 14.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent), // Updated border color
                  borderRadius: BorderRadius.circular(30.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent), // Updated border color
                  borderRadius: BorderRadius.circular(30.0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.greenAccent), // Updated border color
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              style: TextStyle(color: Colors.greenAccent), // Text color changed to suit dark theme
            ),
          ),
        ),
      ),
    );
  }
}
