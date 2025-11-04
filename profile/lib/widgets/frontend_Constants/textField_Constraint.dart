import 'package:flutter/material.dart';

InputDecoration getBorderDetails(String userLabel) {
  return InputDecoration(
    labelText: userLabel,
    labelStyle: TextStyle(color: Colors.amberAccent),
    focusedBorder: getSubBorderDetails(getColors: Colors.tealAccent),
    border: getSubBorderDetails(),
    enabledBorder: getSubBorderDetails(),
    disabledBorder: getSubBorderDetails()
  );
}

OutlineInputBorder getSubBorderDetails({getColors=Colors.amberAccent}) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(color: getColors)
  );
}
