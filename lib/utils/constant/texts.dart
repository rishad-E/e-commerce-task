import 'package:flutter/material.dart';

Text customtext(String text, Color color, double size, FontWeight fontweight) {
  return Text(
    text,
    style: TextStyle(color: color, fontSize: size, fontWeight: fontweight),
  );
}

Text headingtxt(String text) {
  return Text(
    text,
    style: const TextStyle(
        color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
  );
}

Text headingtxt2(String text) {
  return Text(
    text,
    style: const TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
  );
}

Text primarytxt(String text, double size) {
  return Text(
    text,
    style: TextStyle(
        color: const Color.fromARGB(255, 115, 115, 115),
        fontSize: size,
        fontWeight: FontWeight.w800),
  );
}

Text primarytxt2(String text, double size) {
  return Text(
    text,
    style: TextStyle(
        color: Colors.black, fontSize: size, fontWeight: FontWeight.bold),
  );
}
