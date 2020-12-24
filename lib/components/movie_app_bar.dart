
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/search_bar.dart';
import 'package:movie_ticket_app/const.dart';
import 'package:movie_ticket_app/welcome_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_ticket_app/welcome_page.dart';
class MovieAppBar extends StatelessWidget {
  final auth= FirebaseAuth.instance;
  //const MovieAppBar({
    //Key key,
  //}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // todo: convert this to it's own widget 
        Container(
          //width: MediaQuery.of(context).size.width * .15,
          height: 50.0,
          decoration: kRoundedFadedBorder,

          child:
            FlatButton(

              color: kPimaryColor,
              child: Text('Log out',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                onPressed: () {
                auth.signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      LogoStack()),

                );

                }
            )
        ),
        SearchBar(hint: 'Search Movies..'),
      ],
    );
  }
}
