import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Home_Screen.dart';
import 'package:todoapp/Screens/SignupScreen.dart';
import 'package:todoapp/utills/Login&SignupButton.dart';
import 'package:todoapp/utills/Toast.dart';

class Login extends StatefulWidget{
  const Login({super.key});

  @override
  State <Login> createState() => _LoginState();
}
class _LoginState extends State<Login>{

  final emailController =TextEditingController();
  final passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool loading = false;
  FirebaseAuth auth =FirebaseAuth.instance;
  Login(){
    setState(() {
      loading = true;
    });
    auth.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString()).then((value) {
          Tost().toastMessage(value.user!.email.toString());
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
          setState(() {
            loading= false;
          });
    }).onError((error, stackTrace) {
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
      title: Text('Login'),
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
                     if(value!.isEmpty){
                       return
                         'Enter the password';
                     }else{
                       return null;
                     }
                      }
                    ),
                    SizedBox(height: 70,),
                    Button(text: 'Login',
                        onpressed:( ){
                      if(formkey.currentState!.validate()){
                        Login();
                      }
                    }),
                    Row(
                      children: [
                        Text("Don't have an account"),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()));
                      }, child: Text('Sign up'))],
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