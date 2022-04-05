import 'dart:ui';
import 'package:chatapp/cubit/cubit.dart';
import 'package:chatapp/cubit/state.dart';
import 'package:chatapp/layout_screen.dart';
import 'package:chatapp/screen/Register_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ChatsScreen extends StatefulWidget {
  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  bool isPassword = false;

  var emailController= TextEditingController();

  var passwordController= TextEditingController();

  var formKey = GlobalKey<FormState>();

  var email = '';

  var password = '';


  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ChatCubit,ChatStats>(
      listener:(context,state){} ,
      builder: (context,state)
      {
        return Scaffold(
          appBar:
          AppBar(
            backgroundColor: Colors.blue,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.blue
            ),
            title: Text(
                'Chat App'
            ),
          ),
          backgroundColor: Colors.white,
          // Color(0xff2B475E),
          body:
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Image.asset('assets/images/loginimage.png'),
                      Text(
                        'Welcom in Chat App',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        enabled: true,
                        onChanged: (value)
                        {
                          email=value;
                        },
                        decoration:InputDecoration(
                          // fillColor:,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(25),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),

                          ),
                          errorBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)
                          ),
                          focusedErrorBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)
                          ) ,
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          floatingLabelStyle: TextStyle(
                            color:Colors.blue,
                          ),
                          prefixIconColor: Colors.blue,
                          filled: true,
                          prefixIcon: Icon(Icons.email_outlined),
                          labelText:
                          'Email Address',
                        ),
                        keyboardType: TextInputType.emailAddress,
                        controller: emailController,
                        validator: (String ? value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'Enter your email address';
                          }
                          return null;
                        },

                      ) ,
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        enabled: true,
                        onChanged: (value)
                        {
                          password=value;
                        },
                        obscureText: !isPassword,
                        decoration:InputDecoration(
                          errorBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)
                          ),
                          focusedErrorBorder:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)
                          ) ,
                          // fillColor:,
                          focusedBorder: OutlineInputBorder(
                            borderRadius:BorderRadius.circular(25),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),

                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          floatingLabelStyle: TextStyle(
                            color:Colors.blue,
                          ),
                          prefixIconColor: Colors.blue,
                          filled: true,
                          prefixIcon:  Icon(Icons.lock),
                          suffixIcon: passicon(),
                          // suffixIcon: Icon(Icons.visibility_outlined),
                          labelText:
                          'Password',
                        ),
                        controller: passwordController,
                        keyboardType: TextInputType.text,
                        validator: (String ? value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'Enter your password ';
                          }
                          return null;
                        },

                      ) ,
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue
                        ),
                        width: double.infinity,
                        child: MaterialButton(
                          onPressed:()
                          async {
                            if(formKey.currentState!.validate()) {
                              try {
                                UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                  email: email,
                                  password:password,

                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content:
                                    Text(
                                        'Success'
                                    ),
                                      backgroundColor: Colors.green,
                                    )
                                );
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context)=> ChatLayout(),settings:RouteSettings(
                                      arguments: email
                                    ) ),

                                );
                                // print(password);
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'user-not-found') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content:
                                      Text(
                                          'user-not-found'
                                      ),
                                        backgroundColor: Colors.red,

                                      )
                                  );
                                  // print('No user found for that email.');
                                } else if (e.code == 'wrong-password') {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content:
                                      Text(
                                          'wrong-password'
                                      ),
                                        backgroundColor: Colors.red,
                                      )
                                  );
                                  // print('Wrong password provided for that user.');
                                }
                              }
                            }else
                            {

                            }
                          } ,
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              backgroundColor: Colors.blue,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'don\'t have an account ?',
                          ),
                          TextButton(
                            child:Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ) ,
                            onPressed: ()
                            {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>
                                      RegisterScreen())
                              );
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 70,
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget passicon()=>IconButton
    (
    onPressed:()
    {
      isPassword = !isPassword;
      setState(
              (){}
      );
    } ,
    icon:Icon(
      isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined,
    )
  );
}


