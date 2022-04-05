import 'package:chatapp/cubit/cubit.dart';
import 'package:chatapp/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen/chat_screen.dart';

class ChatLayout extends StatefulWidget {



  @override
  State<ChatLayout> createState() => _ChatLayoutState();
}

class _ChatLayoutState extends State<ChatLayout> {
  @override
  Widget build(BuildContext context) {
   String email= ModalRoute.of(context)!.settings.arguments as String;

    return BlocConsumer<ChatCubit,ChatStats>(
       listener: (context,state){},
      builder: (context,state)
      {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title:
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Icon(Icons.chat_bubble_outline_outlined),
                SizedBox(
                  width: 10,
                ),
                Text(
                  'Chating',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                Spacer(),
                IconButton(
                    onPressed:()
                    {
                      ChatCubit.get(context).ChangeMode();

                    } ,
                    icon: Icon(
                        Icons.nights_stay_outlined
                    )
                ),
              ],
            ),
            // centerTitle: true,
          ),
          body: ChatCubit.get(context).Screen[ChatCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: ChatCubit.get(context).currentIndex,
            onTap: (index)
            {
              ChatCubit.get(context).ChangeIndex(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon:(Icon(Icons.multiple_stop)
                  ),
                  label: 'Start'),
              BottomNavigationBarItem(
                  icon:(
                      IconButton(
              icon:Icon(Icons.chat ,
          ),
            onPressed: ()
            {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(),settings:RouteSettings(
                arguments: email
              ) ),);
            }
          )
                      // Icon(Icons.chat)
              //     onPressed: ()
              //
              // {
              //   Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
              //
              //
              // }
            ),
                  label: 'Chats'),
              BottomNavigationBarItem(
                  icon:(Icon(Icons.account_box)
              ),
                  label: 'Profile'),
            ],
            showSelectedLabels: true,
          ),
        );
      },
    );
  }
}
