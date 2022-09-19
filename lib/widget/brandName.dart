import 'dart:ui';

import 'package:flutter/material.dart';

Widget brandName() {
  return RichText(
      text: const TextSpan(
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          children: <TextSpan>[
        TextSpan(
          text: "Final",
          style: TextStyle(color: Colors.black),
        ),
        TextSpan(
          text: "News",
          style: TextStyle(color: Colors.blue),
        )
      ]));
}
