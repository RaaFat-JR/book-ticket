import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_page.dart';
import 'registration_page.dart';
class LogoStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container (
              height:400,
              //color: kBackgroundColor,
              child: Stack(
                children: <Widget>[
                  ClipPath(
                    clipper:ClippingClass(),
                    child: Container(
                      height: 400, decoration: BoxDecoration(color: kPimaryColor,),
                    ),
                  ),
                  Positioned(
                    child:Center(
                      child:Opacity(opacity: 0.1,
                        child: Image(
                          height:500,
                          fit:BoxFit.fitHeight ,
                          image:AssetImage("assets/images/movies.png"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(child: Center(child: Text('WELCOME ',style:TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.white)
                  ),)
                  )


                ],
              ),
            ),
            Container(

             // color: kBackgroundColor,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.pop(context);
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            HomePage(),
                      ),
                    );},
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                          color:kPimaryColor),

                      margin: EdgeInsets.only(left: 20,right: 20),
                      //padding: EdgeInsets.only(bottom:20.0),
                      child: Center(
                        child: Text('Sign in',style: kMovieNameStyle,),
                      ),
                      width: double.infinity,
                      height: 50,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap:(){
                      Navigator.pop(context);
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Registar(),
                      ),
                    );},
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                          color:kPimaryColor),

                      margin: EdgeInsets.only(left: 20,right: 20),
                      //padding: EdgeInsets.only(bottom:20.0),
                      child: Center(
                        child: Text('Sign up',style: kMovieNameStyle,),
                      ),
                      width: double.infinity,
                      height: 50,
                    ),
                  ),

                ],
              ),
            )






          ],

        ),
      ),
    );
  }
}
class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height-40);
    path.quadraticBezierTo(size.width / 4, size.height,
        size.width / 2, size.height);
    path.quadraticBezierTo(size.width - (size.width / 4), size.height,
        size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}






























