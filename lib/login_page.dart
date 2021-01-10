import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatelessWidget {

  String email;
  String password;

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
                    'Login',
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
                      child: Column(
                        children: [
                          Container(
                            padding:EdgeInsets.all(10),
                            decoration:BoxDecoration(
                              border: Border(bottom:BorderSide(color:Colors.grey[200]),),
                            ),
                            child:TextField(
                              onChanged: (value){
                                email = value;
                              },
                              decoration:InputDecoration(
                                hintText: 'Phone or Email',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color:Colors.grey,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            padding:EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border:Border(bottom:BorderSide(color:Colors.grey[200]),),
                            ),
                            child:TextField(
                              onChanged: (value){
                                password = value;
                              },
                              decoration: InputDecoration(
                                hintText: 'Password',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                  color:Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height:30),
                  Center(
                    child:GestureDetector(
                      onTap: (){
                        print('Forgot Password got pressed!');
                      },
                      child: Text(
                        'Forgot Password?',
                        style:TextStyle(
                          color:Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:20),
                  GestureDetector(
                    onTap: ()async{
                      try{
                        final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                        if(user !=null){
                          Navigator.pushNamed(context, 'home_page');
                        }
                      }catch(e){
                        print(e);
                      }
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
                            'Login',
                            style:TextStyle(
                              color:Colors.white,
                              fontWeight:FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:20),
                  Center(
                    child:Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, 'signup_page');
                        },
                        child: Text(
                          'Create Account',
                          style:TextStyle(
                            color:Colors.grey,
                            fontWeight:FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height:20),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child:GestureDetector(
                            onTap: (){
                              print('facebook button got pressed');
                            },
                            child: Container(
                              height:50,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color:Colors.blue,
                              ),
                              child:Center(
                                child:Text(
                                  'facebook',
                                  style:TextStyle(
                                    fontWeight:FontWeight.bold,
                                    color:Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width:20),
                        Expanded(
                          child:GestureDetector(
                            onTap: (){
                              print('google button got pressed!');
                            },
                            child: Container(
                              height:50,
                              decoration:BoxDecoration(
                                color:Colors.lightBlueAccent,
                                borderRadius:BorderRadius.circular(50),
                              ),
                              child:Center(
                                child:Text(
                                  'Google',
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}




