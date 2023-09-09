import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Home_Screen.dart';
import 'package:todoapp/Screens/LoginScreen.dart';
import 'package:todoapp/utills/Login&SignupButton.dart';
import 'package:todoapp/utills/Toast.dart';

class Signup extends StatefulWidget{
  const Signup({super.key});

  @override
  State <Signup> createState() => _SignupState();
}
class _SignupState extends State<Signup>{

  final emailController =TextEditingController();
  final passwordController = TextEditingController();
   bool loading = false;
  final formkey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;

  Signup(){
    setState(() {
      loading = true;
    });
    auth.createUserWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()).then((value) {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
          setState(() {
            loading = false;
          });
    }).onError((error, stackTrace){
      Tost().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign up'),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Form(
              key: formkey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller:emailController ,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: 'email',
                          suffixIcon: Icon(Icons.email)
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Enter email address';
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 50,),
                    TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: 'password',
                          suffixIcon: Icon(Icons.password),
                        ),
                        validator: (value){
                          if (value!.isEmpty){
                            return
                              'Enter the password';
                          }else{
                            return   null;

                          }

                        }
                    ),
                    SizedBox(height: 70,),
                    Button(text: 'Sign up', onpressed: (){

                      if(formkey.currentState!.validate()){
                        Signup();
                      }
                    }),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text('Allready have an account'),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                        }, child: Text('Login'))
                      ],
                    )
                  ],
                ),
              ),


            ),

          ],
        ),
      ),
    );
  }

}
