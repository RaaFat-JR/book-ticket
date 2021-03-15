import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movie_ticket_app/components/red_rounded_action_button.dart';
import 'package:movie_ticket_app/const.dart';
import 'package:movie_ticket_app/screens/buy_ticket.dart';
import 'components/dark_borderless_button.dart';
import 'components/movie_app_bar.dart';
import 'components/primary_rounder_button.dart';
import 'model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'model.dart';

class MyHomePage extends StatefulWidget {
  int index = 1;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final auth = FirebaseAuth.instance;
  final _fStore = FirebaseFirestore.instance;
  String result;

  // ignore: deprecated_member_use
  FirebaseUser loggedInUser;
  @override
  void initSate() {
    super.initState();
    getCurrentUser();
  }


  void getCurrentUser() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String age = movies[widget.index].age;
    final String rating = movies[widget.index].rating.toString();

    final String categories = movies[widget.index].categories;
    final String technology = movies[widget.index].technology;

    Future<List<Movie>> getData() async {
      final QuerySnapshot item = await _fStore.collection('movies').get();
      List<Movie> movies = [];
      item.docs.forEach((element) {
        movies.add(
            Movie(
              title: element.data()['title'],
              imageURL: element.data()['image'],
              categories: element.data()['description'],
              date: element.data()['time'],
            ));
      });
      return movies;
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kBackgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          SafeArea(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10.0)),
                MovieAppBar(),
                Padding(padding: EdgeInsets.symmetric(vertical: 50.0)),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('•', style: kPromaryColorTextStyle),
                      Text(categories, style: kSmallMainTextStyle),
                      Text('•', style: kPromaryColorTextStyle),
                      Text(technology, style: kSmallMainTextStyle),
                    ],
                  ),
                ),
                Image.asset('assets/images/divider.png'),

                Expanded(
                  child: FutureBuilder(
                    future: getData(), // function where you call your api
                    builder: (BuildContext context, snapshot) {
                      // AsyncSnapshot<Your object type>
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                            child: Text('Please wait its loading...'));
                      } else {
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              return MovieCard(
                                  title: snapshot.data[index].title,
                                  imageLink: snapshot.data[index].imageURL,
                                  active: index == widget.index ? true : false,
                                  callBack: () {
                                    setState(() {
                                      widget.index = index;
                                    });
                                  });
                            }); // snapshot.data  :- get your object which is pass from your downloadData() function
                      }
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 50.0)),
                RedRoundedActionButton(
                    text: 'BOOK SEAT',
                    callback: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BuyTicket(
                              movies[widget.index].title,
                              movies[widget.index].id,
                              movies[widget.index].seats),
                        ),
                      );
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String imageLink;

  final String title;

  final Function callBack;

  final bool active;

  MovieCard(
      {@required this.title,
      @required this.imageLink,
      @required this.callBack,
      @required this.active});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: InkWell(
            onTap: callBack,
            child: SizedBox(
              width: active
                  ? MediaQuery.of(context).size.width / 3
                  : MediaQuery.of(context).size.width / 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25.0),
                child: Image.network(
                    imageLink,
                width: 80,
                height: 220,
                fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Text(active ? title : '',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
      ],
    );
  }
}


