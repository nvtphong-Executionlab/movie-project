import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import '../home_screen/home_screen.dart';

class LoginScreen extends StatelessWidget {
  static const route = '/login';

  LoginScreen({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: const Text(
            'ExecutionLab',
            style: TextStyle(
              fontWeight:FontWeight.bold,
              fontSize: 36,
              color: Color(0xFFFFCCFF)
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: TextFormField(
            controller: nameController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
              hintText: 'Email', icon: Icon(Icons.verified_user)
            ),
            validator: (text) => text!.isEmpty ? 'Username is required !' : '',
          ),
          padding: EdgeInsets.symmetric(horizontal: 30),
        ),
        Container(
          child: TextFormField(
            controller: passController,
            keyboardType: TextInputType.text,
            decoration: const InputDecoration(
                hintText: 'Password', icon: Icon(Icons.lock)
            ),
            validator: (text) => text!.isEmpty ? 'Password is required !' : '',
          ),
          padding: EdgeInsets.symmetric(horizontal: 30),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0))),
                padding: MaterialStateProperty.all(const EdgeInsets.all(0))
            ),
            child: Container(
              alignment: Alignment.center,
              height: 50.0,
              width: size.width * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(80.0),
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 255, 136, 34),
                  Color.fromARGB(255, 255, 177, 41)
                ])
              ),
              padding: const EdgeInsets.all(0),
              child: const Text('Login', textAlign: TextAlign.center, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
            ),
            onPressed: () => Navigator.of(context).pushReplacementNamed(HomeScreen.route,),
          ),
        ),
        SizedBox(height: 20,),
        Text('Or', style: TextStyle(
          color: Color(0xFF808080),
          fontWeight: FontWeight.bold
        ),),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
                child: SignInButton(Buttons.Google, text: 'Google', onPressed: () =>{})
            ),
            SizedBox(width: 10,),
            Container(
              width: 150,
                child: SignInButton(Buttons.Facebook, text: 'Facebook', onPressed: () =>{})),
          ],
        )
      ],
    );
  }
}
