import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';

class SignupPage extends StatelessWidget {

  String email;
  String password;

  final _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithTwitter() async {
    // Create a TwitterLogin instance
    final TwitterLogin twitterLogin = new TwitterLogin(
      consumerKey: '<your consumer key>',
      consumerSecret:' <your consumer secret>',
    );

    // Trigger the sign-in flow
    final TwitterLoginResult loginResult = await twitterLogin.authorize();

    // Get the Logged In session
    final TwitterSession twitterSession = loginResult.session;

    // Create a credential from the access token
    final AuthCredential twitterAuthCredential =
    TwitterAuthProvider.credential(accessToken: twitterSession.token, secret: twitterSession.secret);

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
  }


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
                    'SignUp',
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
                  SizedBox(height:20),
                  GestureDetector(
                    onTap: ()async{
                      try{
                        final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                        if(newUser != null){
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
                            'Register',
                            style:TextStyle(
                              color:Colors.white,
                              fontWeight:FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height:30),
                  Center(
                    child:Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Continue with Social Media',
                        style:TextStyle(
                          color:Colors.grey,
                          fontWeight:FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        Expanded(
                          child:GestureDetector(
                            onTap: (){
                              signInWithTwitter();
                            },
                            child: Container(
                              height:50,
                              decoration:BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color:Colors.blue,
                              ),
                              child:Center(
                                child:Text(
                                  'twitter',
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
                               final user =  signInWithGoogle();
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



