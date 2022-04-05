import 'package:chatapp/cubit/cubit.dart';
import 'package:chatapp/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StartScreen extends StatelessWidget {
  static String id ='StartScreen';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit,ChatStats>(
      builder:(context,state)
      {
        return  Scaffold(
          body: Column(
            children: [

              Image.asset('assets/images/chat-logo-removebg-previe.png',
              fit: BoxFit.fill,),
              Text(
                'Faster Chat App ',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,

                ),
              )
            ],
          ),

        );
      } ,
      listener: (context,state){},
    );
  }
}
