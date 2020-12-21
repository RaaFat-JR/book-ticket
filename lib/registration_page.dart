import 'package:flutter/material.dart';
import 'Animation/FadeAnimation.dart';
import 'const.dart';
import 'film_lists.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
class Registar extends StatefulWidget {
  @override
  _RegistarState createState() => _RegistarState();
}

class _RegistarState extends State<Registar> {
 final  auth= FirebaseAuth.instance;


  String email;

  String password;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 400,
                  decoration: BoxDecoration(

                  ),
                  child: Stack(
                    children: <Widget>[


                      Positioned(
                        //left: 0,
                        right: 0,
                        top: 80,
                        width: 400,
                        height: 300,
                        child: FadeAnimation(1.5, Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/23.png'),
                                  fit: BoxFit.fill
                              )
                          ),
                        )),
                      ),
                      Positioned(
                        child: FadeAnimation(1.6, Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Center(
                            child: Text("Sign up", style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),),
                          ),
                        )),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      FadeAnimation(1.8, Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(143, 148, 251, .2),
                                  blurRadius: 20.0,
                                  offset: Offset(0, 10)
                              )
                            ]
                        ),
                        child: Column(
                          children: <Widget>[


                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[100]))
                              ),
                              child: TextField(
                                keyboardType: TextInputType.emailAddress,
                                onChanged: (value){
                                  email=value;
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Email ",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(color: Colors.grey[100]))
                              ),
                              child: TextField(
                                obscureText: true,
                                onChanged: (value){
                                  password=value;
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "password",
                                    hintStyle: TextStyle(color: Colors.grey[400])
                                ),
                              ),
                            ),

                      SizedBox(height: 30,),
                      RaisedButton(
                        color: Colors.yellow.shade700,
                        onPressed: ()async{
                          try {
                            final newUser = await auth
                                .createUserWithEmailAndPassword(email: email,
                                password: password);
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                          }
                          catch(e){print(e);}
                          },

                        child: FadeAnimation(2, Container(
                          height: 50,

                          decoration:

                          BoxDecoration(
                              borderRadius: BorderRadius.circular(13),
                            color: Colors.yellow.shade700
                          ),
                          child: Center(
                            child: Text("Sign up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 20),),
                          ),
                        )),
                      ),

                    ],
                  ),
                ),),
              ],
            ),
          ),
        ]
        )
    ),
    ),
    )   ;
  }
}

