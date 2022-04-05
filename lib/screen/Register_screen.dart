
import 'package:chatapp/cubit/cubit.dart';
import 'package:chatapp/cubit/state.dart';
import 'package:chatapp/layout_screen.dart';
import 'package:chatapp/screen/chat_screen.dart';
import 'package:chatapp/screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegisterScreen extends StatefulWidget {
  @override

  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var formKey = GlobalKey<FormState>();

  bool isPassword = false;

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var nameController = TextEditingController();

  var phoneController = TextEditingController();

  var email='';

  var password='';

  var name='';

  var phone='';

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: BlocConsumer<ChatCubit,ChatStats>(
        builder: (context,state)
        {
          return  Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
            ),
            backgroundColor: Colors.white,
            // Color(0xff2B475E),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Text(
                          'Register now  to chat ',
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
                            name=value;
                          },
                          decoration:InputDecoration(
                            errorBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)
                            ),
                            focusedErrorBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25)
                            ) ,
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
                            prefixIcon:  Icon(Icons.person),
                            labelText:
                            'User name',
                          ),
                          controller: nameController,
                          keyboardType: TextInputType.name,
                          validator: (String ? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'Enter your name';
                            }
                            return null;
                          },

                        ) ,
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
                          height: 25,
                        ),
                        TextFormField(
                          onChanged:(value)
                          {
                            password=value;
                          } ,
                          enabled: true,
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
                          height: 25,
                        ),
                        TextFormField(
                          enabled: true,
                          onChanged: (value)
                          {
                            phone=value;
                          },
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
                            prefixIcon:  Icon(Icons.phone),
                            // suffixIcon: Icon(Icons.visibility_outlined),
                            labelText:
                            'Phone',
                          ),
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (String ? value)
                          {
                            if(value!.isEmpty)
                            {
                              return 'Enter your phone number';
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
                            onPressed:() async
                            {
                              if(formKey.currentState!.validate())
                              {
                                // isLoading=true;
                                // setState(() {
                                //
                                // });
                                try {
                                  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                    email: email,
                                    password: password,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar
                                    (
                                    SnackBar
                                      (content:
                                    Text('Success'),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context)=>
                                          ChatLayout(),
                                          settings:RouteSettings(
                                              arguments: email
                                          )
                                      )
                                  );

                                }
                                on FirebaseAuthException catch (e) {
                                  if (e.code == 'weak-password') {
                                    ScaffoldMessenger.of(context).showSnackBar
                                      (
                                        SnackBar
                                          (content:
                                        Text('The password provided is too weak.'),
                                          backgroundColor: Colors.red,
                                        )
                                    );
                                    // print('The password provided is too weak.');
                                  }
                                  else if (e.code == 'email-already-in-use')
                              {
                                    ScaffoldMessenger.of(context).showSnackBar
                                      (
                                        SnackBar
                                          (content:
                                        Text('The account already exists for that email.'),
                                          backgroundColor: Colors.red,
                                        )
                                    );
                                    // print('The account already exists for that email.');
                                  }
                                } catch (e) {
                                  print(e);
                                }
                                // isLoading=false;
                                // setState(() {
                                //
                                // });

                              }else
                              {
                              }


                              // print(user.user!.email);
                              // if(formKey.currentState!.validate()) {
                              // }
                              // } catch(e)
                              // {
                              //
                              //   ScaffoldMessenger.of(context).showSnackBar
                              //     (
                              //       SnackBar
                              //         (content:
                              //       Text(
                              //         // 'there was an error , Please try again',
                              //         e.toString()
                              //       ),
                              //         backgroundColor: Colors.red,
                              //
                              //       )
                              //   );
                              // }



                            } ,
                            child: Text(
                              'Create',
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
                              'You have an account ?',
                            ),
                            TextButton(
                              child:Text(
                                'Sign in',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold
                                ),
                              ) ,
                              onPressed: ()
                              {
                                Navigator.push(context,
                                    MaterialPageRoute(
                                        builder :
                                            (context)=>ChatsScreen(),

                                    )
                                );
                              },
                            )
                          ],
                        ),
                        // SizedBox(
                        // height: 10,
                        // ),

                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context,state){}
      ),
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
