
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/search_bar.dart';
import 'package:movie_ticket_app/const.dart';
import 'package:movie_ticket_app/welcome_page.dart';
class MovieAppBar extends StatelessWidget {
  const MovieAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // todo: convert this to it's own widget 
        Container(
          width: MediaQuery.of(context).size.width * .15,
          height: 60.0,
          decoration: kRoundedFadedBorder,
          child:
              IconButton(icon: Icon(Icons.keyboard_arrow_left), onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          LogoStack()),
                );
              }),
        ),
        SearchBar(hint: 'Search Movies..'),
      ],
    );
  }
}
