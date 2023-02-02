import 'package:flutter/material.dart';
import 'package:hangman/ui/colors.dart';

Widget letter(String character, bool hidden) {
  return Container(
    height: 65,
    width: 50,
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppColor.primaryColorDark,
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Visibility(
      visible: !hidden,
      child: Text(
        character,
        style: const TextStyle(
          fontSize: 40,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
