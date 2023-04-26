import 'package:flutter/material.dart';

const columnHeadingStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  fontFamily: 'WorkSans',
);

const itemStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.w500,
  fontFamily: 'WorkSans',
  color: Colors.black,
);

const addButtonStyle = TextStyle(
  fontSize: 25,
  fontWeight: FontWeight.bold,
  fontFamily: 'WorkSans',
  color: Colors.black,
);

const searchFieldDecoration = InputDecoration(
  prefixIcon: Icon(
    Icons.search,
    size: 50,
    color: Colors.black,
  ),
  prefixIconConstraints: BoxConstraints(minWidth: 80),
  contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
  filled: true,
  fillColor: Color(
    0x40ffffff,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        50,
      ),
    ),
  ),
  focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2,
        color: Colors.black,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(
          50,
        ),
      )),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(
        50,
      ),
    ),
    borderSide: BorderSide(
      color: Colors.black,
    ),
  ),
  label: Text(
    'Search for',
    style: TextStyle(color: Colors.white),
  ),
);
