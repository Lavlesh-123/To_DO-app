import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  bool loading = false;
  VoidCallback onpressed;
   Button({
    Key? key,
    required this.text,
    required this.onpressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onpressed,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color: Colors.yellow,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Center(
          child:loading?CircularProgressIndicator(color:Colors.white,strokeWidth: 3,): Text(text,style: TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}
