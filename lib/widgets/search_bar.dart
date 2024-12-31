import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final Function(String) onSearchTextChanged;

  CustomSearchBar({required this.onSearchTextChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: (text) {
              onSearchTextChanged(text);
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0XFF11161F),
              hintText: "Search",
              contentPadding: EdgeInsets.all(18),
              hintStyle: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 14,
              ),
              suffixIcon: Icon(Icons.search, color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Color(0XFF888A8F),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.all(12),
          child: Icon(Icons.tune, color: Colors.white),
        ),
      ],
    );
  }
}
