import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Screens/LoginScreen.dart';
import 'package:todoapp/Screens/SignupScreen.dart';
import 'package:todoapp/utills/Toast.dart';
import 'package:todoapp/utills/my_drawer_list_tile.dart';

class MyDrawer extends StatelessWidget {
  var auth = FirebaseAuth.instance;
   MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.yellow.shade400,
      child: Column(
        children: [

          // Header
          DrawerHeader(child: Icon(Icons.person,size: 100,),
          ),
          //Home list tile
          DrawerListTile(icon: Icons.home, text:('H O M E'), onTap: () {Navigator.of(context).pop();
          },),
          SizedBox(height: 20,),
          DrawerListTile(icon: Icons.perm_contact_cal, text:('Profile'), onTap: () {Navigator.of(context).pop();
          },),
          SizedBox(height: 20,),
          DrawerListTile(icon: Icons.logout, text:('Logout'), onTap: () {
            auth.signOut().then((value) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
            }).onError((error, stackTrace) {
              Tost().toastMessage(error.toString());
            });
          },)
        ],
      ),
    );
  }
}
