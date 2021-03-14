import 'package:flutter/material.dart';
import 'package:recipe_app/config/palette.dart' as palette;

class Search extends StatelessWidget {
  const Search({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Search.',
        hintStyle: TextStyle(color: Colors.white.withOpacity(.3), fontSize: 15),
        prefixIcon: Icon(Icons.search, color: Colors.white.withOpacity(.7)),
        fillColor: palette.secondary,
        filled: true,
        border: new OutlineInputBorder(
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
        ),
        focusedBorder: new OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white.withOpacity(.1)),
          borderRadius: const BorderRadius.all(const Radius.circular(10.0)),
        ),
        // enabledBorder: InputBorder.none,
        contentPadding: EdgeInsets.only(left: 15, top: 13, right: 15),
      ),
    );
  }
}
