import 'package:flutter/material.dart';

mixin UnderlineBorder {
  underlineBorder({bool faded = false}) => UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.white.withOpacity(faded ? 0.5 : 1)));
}
