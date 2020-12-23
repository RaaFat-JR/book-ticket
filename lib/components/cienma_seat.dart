
import 'package:flutter/material.dart';

import '../const.dart';
import 'package:movie_ticket_app/model.dart';

import '../model.dart';


class CienmaSeat extends StatefulWidget {
  int movieId ;
  int id;
  bool isReserved;
  bool firstPress = true;
  bookSeat(int idd,int movieIdd){
    movies[movieIdd].seats[idd] = 1 ;
  }

  CienmaSeat({@required this.id , @required this.isReserved,@required this.movieId });

  @override
  _CienmaSeatState createState() => _CienmaSeatState();
}

class _CienmaSeatState extends State<CienmaSeat> {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          if (! widget.isReserved){
            widget.firstPress = false;
          widget.isReserved = true;
          widget.bookSeat(widget.id, widget.movieId);
          print(movies[widget.movieId].title);
          print(movies[widget.movieId].seats);
        }});
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
          width: MediaQuery.of(context).size.width / 15,
          height: MediaQuery.of(context).size.width / 15,
          decoration: BoxDecoration(
              color: widget.isReserved
                  ? kPimaryColor
                  :  null,
              border: !widget.isReserved
                  ? Border.all(color: Colors.white, width: 1.0)
                  : null,
              borderRadius: BorderRadius.circular(5.0))),
    );

  }
}