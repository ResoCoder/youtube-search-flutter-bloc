import 'package:flutter/material.dart';
import 'package:youtube_search_tutorial/ui/search/widget/search_field.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: SearchField(),
      ),
    );
  }
}
