// import "dart:async";
//
// import "package:flutter/material.dart";
//
// import "../Home_Screen.dart";
//
// class Splash extends StatefulWidget{
//   const Splash({super.key});
//   @override
//   State<Splash> createState() => _SplashState();
// }
//
// class _SplashState extends State<Splash>{
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     Timer(Duration(seconds: 3), () {
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()),);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context){
//     return
//        Scaffold(
//          body: Container(
//           child: Text('Lavlesh'),
//            color:Colors.blue
//          ),
//        );
//        // Center(
//        //   child: Column(
//        //     children: [
//        //       AnimatedCrossFade(
//        //           firstChild: Container(
//        //             color: Colors.black,
//        //             height: double.infinity,
//        //             width: double.infinity,
//        //           ),
//        //           secondChild: Container(
//        //             color: Colors.yellow,
//        //             height: 200,
//        //             width: 200,
//        //           ),
//        //           crossFadeState:isFirst ? CrossFadeState .showFirst : CrossFadeState.showSecond,
//        //           duration: Duration(seconds: 3))
//        //     ],
//        //   ),
//        // );
//   }
// }
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Home_Screen.dart';

import 'LoginScreen.dart';



class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}
var auth = FirebaseAuth.instance;
var user = auth.currentUser;

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(user != null){
      Timer(Duration(seconds: 3),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
      });
    }else{
     Timer(Duration(seconds: 3),(){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
     });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Lavlesh'),
            ],
          ),
        ),
      ),
    );

  }
}
