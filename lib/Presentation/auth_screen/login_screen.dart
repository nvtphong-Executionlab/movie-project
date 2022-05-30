import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:movie_project/Presentation/logic_holders/providers/auth_provider.dart';

import '../home_screen/home_screen.dart';
import '../splash_screen/splash_screen.dart';

class LoginScreen extends ConsumerWidget {
  static const route = '/login';

  LoginScreen({Key? key}) : super(key: key);
  final nameController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String _message = '';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
            onPressed: () {
              //var token = '';
              ref.read(requestTokenProvider).when(
                  data: (data){
                    tokenWithUsernameAndPassword(data, ref, nameController.text, passController.text);
                  },
                  error: (error, trace){
                    print("test");
                    _message = 'Cannot request token';
                  },
                  loading: () => {
                  }
              );
            }
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
  void tokenWithUsernameAndPassword(data, WidgetRef ref, String username, String password){
    print(data.requestToken);
    ref.read(tokenWithLogin({
      "username": username,
      "password" : password,
      "request_token": data.requestToken
    })).maybeWhen(data: (value) => print("success"),loading: (){print('Loading');},orElse: () {print('Err');});
    print("done");
  }
}
