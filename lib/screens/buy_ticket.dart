import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/calendar_day.dart';
import 'package:movie_ticket_app/components/cienma_seat.dart';
import 'package:movie_ticket_app/components/show_time.dart';
import 'package:movie_ticket_app/film_lists.dart';
import '../const.dart';

class BuyTicket extends StatelessWidget {
  var title;
  int movieId ;
  List <int> seats;
  BuyTicket(this.title,this.movieId,this.seats);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top:15.0 , left:0.0),
              child: Row(
                children: <Widget>[
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
                      MyHomePage()),

                      );
                    }),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .75,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              width: MediaQuery.of(context).size.width * .9,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25.0),
                  topLeft: Radius.circular(25.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: <Widget>[
                      CalendarDay(
                        dayNumber: '9',
                        dayAbbreviation: 'TH',
                      ),
                      CalendarDay(
                        dayNumber: '10',
                        dayAbbreviation: 'FR',
                      ),
                      CalendarDay(
                        dayNumber: '11',
                        dayAbbreviation: 'SA',
                      ),
                      CalendarDay(
                        dayNumber: '12',
                        dayAbbreviation: 'SU',
                        isActive: true,
                      ),
                      CalendarDay(
                        dayNumber: '13',
                        dayAbbreviation: 'MO',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  ShowTime(
                    time: '11:00',
                    price: 5,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: true,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: false,
                  ),
                  ShowTime(
                    time: '12:30',
                    price: 10,
                    isActive: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.tv,
                    color: kPimaryColor,
                    size: 25.0,
                  ),
                  SizedBox(width: 20.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Star Cineplex Bangladesh', style: kMainTextStyle),
                      Text('panthapath , 1205 Dhaka',
                          style:
                              TextStyle(color: Colors.white30, fontSize: 18.0)),
                      SizedBox(height: 10.0),
                      Row(
                        children: <Widget>[
                          Text('2D', style: kMainTextStyle),
                          SizedBox(width: 10.0),
                          Text('3D',
                              style: TextStyle(
                                  color: Colors.white30,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold)),
                        ],
                      )
                    ],
                  ),
                  SizedBox(width: 20.0),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 30.0,
                    color: Colors.white38,
                  )
                ],
              ),
            ),
            Center(child: Image.asset('assets/images/screen.png')),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                children: <Widget>[
                  // First Seat Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                      CienmaSeat(id : 0,movieId: movieId,isReserved: seats[0]==0 ? false : true),
                      CienmaSeat(id :1,movieId: movieId,isReserved: seats[1]==0 ? false : true),
                      CienmaSeat(id :2,movieId: movieId,isReserved: seats[2]==0 ? false : true),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(id :3,movieId: movieId,isReserved: seats[3]==0 ? false : true),
                      CienmaSeat(id :4,movieId: movieId,isReserved: seats[4]==0 ? false : true),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                    ],
                  ),
                  // Second Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(id :5,movieId: movieId,isReserved: seats[5]==0 ? false : true),
                      CienmaSeat(id :6,movieId: movieId,isReserved: seats[6]==0 ? false : true),
                      CienmaSeat(id :7,movieId: movieId,isReserved: seats[7]==0 ? false : true),
                      CienmaSeat(id :8,movieId: movieId,isReserved: seats[8]==0 ? false : true),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(
                          id :9,movieId: movieId,isReserved: seats[9]==0 ? false : true
                      ),
                      CienmaSeat(id :10,movieId: movieId,isReserved: seats[10]==0 ? false : true),
                      CienmaSeat(id :11,movieId: movieId,isReserved: seats[11]==0 ? false : true),
                    ],
                  ),
                  // Third  Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(id :12,movieId: movieId,isReserved: seats[12]==0 ? false : true),
                      CienmaSeat(id :13,movieId: movieId,isReserved: seats[13]==0 ? false : true),
                      CienmaSeat(id :14,movieId: movieId,isReserved: seats[14]==0 ? false : true),
                      CienmaSeat(id :15,movieId: movieId,isReserved: seats[15]==0 ? false : true),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(id :16,movieId: movieId,isReserved: seats[16]==0 ? false : true),
                      CienmaSeat(id :17,movieId: movieId,isReserved: seats[17] ==0 ? false : true),
                      CienmaSeat(id :18,movieId: movieId,isReserved: seats[18]==0 ? false : true),
                    ],
                  ),
                  // 4TH Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(id :19,movieId: movieId,isReserved: seats[19]==0 ? false : true),
                      CienmaSeat(id :20,movieId: movieId,isReserved: seats[20]==0 ? false : true),
                      CienmaSeat(id :21,movieId: movieId,isReserved: seats[21]==0 ? false : true),
                      CienmaSeat(id :22,movieId: movieId,isReserved: seats[22]==0 ? false : true ),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(id :23,movieId: movieId,isReserved: seats[23]==0 ? false : true),
                      CienmaSeat(id :24,movieId: movieId,isReserved: seats[24]==0 ? false : true),
                      CienmaSeat(id :25,movieId: movieId,isReserved: seats[25]==0 ? false : true),
                    ],
                  ),
                  // 5TH Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(id :26,movieId: movieId,isReserved: seats[26]==0 ? false : true),
                      CienmaSeat(id :27,movieId: movieId,isReserved: seats[27]==0 ? false : true),
                      CienmaSeat(id :28,movieId: movieId,isReserved: seats[28]==0 ? false : true),
                      CienmaSeat(id :29,movieId: movieId,isReserved: seats[29]==0 ? false : true),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(id :30,movieId: movieId,isReserved: seats[30]==0 ? false : true),
                      CienmaSeat(id :31,movieId: movieId,isReserved: seats[31]==0 ? false : true),
                      CienmaSeat(id :32,movieId: movieId,isReserved: seats[32]==0 ? false : true),
                    ],
                  ),
                  // 6TH Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CienmaSeat(id :33,movieId: movieId,isReserved: seats[33]==0 ? false : true),
                      CienmaSeat(id :34,movieId: movieId,isReserved: seats[34]==0 ? false : true),
                      CienmaSeat(id :35,movieId: movieId,isReserved: seats[35]==0 ? false : true),
                      CienmaSeat(id :36,movieId: movieId,isReserved: seats[36]==0 ? false : true),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(id :37,movieId: movieId,isReserved: seats[37]==0 ? false : true),
                      CienmaSeat(id :38,movieId: movieId,isReserved: seats[38]==0 ? false : true),
                      CienmaSeat(id :39,movieId: movieId,isReserved: seats[39]==0 ? false : true),
                    ],
                  ),
                  // final Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                      CienmaSeat(id :40,movieId: movieId,isReserved: seats[40]==0 ? false : true),
                      CienmaSeat(id :41,movieId: movieId,isReserved: seats[41]==0 ? false : true),
                      CienmaSeat(id :42,movieId: movieId,isReserved: seats[42]==0 ? false : true),
                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20) * 2,
                      ),
                      CienmaSeat(id :43,movieId: movieId,isReserved: seats[43]==0 ? false : true),
                      CienmaSeat(id :44,movieId: movieId,isReserved: seats[44]==0 ? false : true),
                      CienmaSeat(id :45,movieId: movieId,isReserved: seats[45]==0 ? false : true),
                      CienmaSeat(id :46,movieId: movieId,isReserved: seats[46]==0 ? false : true),

                      SizedBox(
                        width: (MediaQuery.of(context).size.width / 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
                          child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0),
                    child: Text(
                      '30\$',
                      style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                  Container(
          padding: EdgeInsets.symmetric(horizontal:40.0 , vertical:10.0),
          decoration: BoxDecoration(color:  kActionColor , borderRadius: BorderRadius.only(topLeft: Radius.circular(25.0))),
          child: InkWell(child: Text('Pay' , style: TextStyle(color: Colors.white ,fontSize: 25.0 , fontWeight:FontWeight.bold))),
        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

