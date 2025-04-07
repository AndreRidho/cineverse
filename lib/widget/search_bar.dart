import 'package:cineverse/util/mixin/underline_border.dart';
import 'package:flutter/material.dart';

class MySearchBar extends StatelessWidget with UnderlineBorder {
  const MySearchBar(
      {super.key,
      required this.searchController,
      this.suffixIcon,
      this.suffixFunc,
      this.prefixFunc,
      this.showPrefix = false,
      this.lineBorder = false});

  final TextEditingController searchController;
  final IconData? suffixIcon;
  final Function()? suffixFunc;
  final Function()? prefixFunc;
  final bool showPrefix;
  final bool lineBorder;

  @override
  Widget build(BuildContext context) {
    final border = lineBorder
        ? underlineBorder()
        : OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none);

    return TextFormField(
      controller: searchController,
      decoration: InputDecoration(
        filled: !lineBorder,
        border: border,
        enabledBorder: border,
        prefixIcon: showPrefix
            ? InkWell(onTap: prefixFunc, child: const Icon(Icons.close))
            : null,
        suffixIcon: InkWell(
            onTap: suffixFunc, child: Icon(suffixIcon ?? Icons.search_rounded)),
      ),
    );
  }
}
