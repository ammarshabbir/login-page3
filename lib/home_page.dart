import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {

  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height:400,
              child:Stack(
                children: [
                  Positioned(
                    top:-40,
                    height:400,
                    width: width,
                    child: Container(
                      decoration: BoxDecoration(
                          image:DecorationImage(
                            image:AssetImage('assets/images/background.png'),
                            fit:BoxFit.fill,
                          )
                      ),
                    ),
                  ),
                  Positioned(
                    width: width+20,
                    height:400,
                    child:Container(
                      decoration:BoxDecoration(
                        image:DecorationImage(
                          image:AssetImage('assets/images/background-2.png'),
                          fit:BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height:30),
            Padding(
              padding:EdgeInsets.symmetric(horizontal: 30),
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back',
                    style:TextStyle(
                      fontSize:30,
                      color: Color.fromRGBO(49, 39, 79, 1),
                    ),
                  ),
                  SizedBox(height:10),
                  Text(
                    'Home',
                    style:TextStyle(
                      fontSize:30,
                      color: Color.fromRGBO(49, 39, 79, 1),
                    ),
                  ),
                  Padding(
                    padding:EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        color:Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 20,
                            color: Color.fromRGBO(196, 135, 198, .3),
                            offset: Offset(0,20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height:20),
            GestureDetector(
              onTap: ()async{
                _auth.signOut();
                Navigator.pop(context);
              },
              child: Center(
                child:Container(
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  height:50,
                  decoration:BoxDecoration(
                    color: Color.fromRGBO(49, 39, 79, 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child:Text(
                      'Log Out',
                      style:TextStyle(
                        color:Colors.white,
                        fontWeight:FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
