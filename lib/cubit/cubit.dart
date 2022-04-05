import 'package:chatapp/Network/cash_helper.dart';
import 'package:chatapp/cubit/state.dart';
import 'package:chatapp/screen/chat_screen.dart';
import 'package:chatapp/screen/profile_screen.dart';
import 'package:chatapp/screen/start_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatCubit extends Cubit<ChatStats>
{
  ChatCubit() : super(initialChateState());
  static ChatCubit get(context)=> BlocProvider.of(context);
  int currentIndex=0;
  // List<Map>profile = [];
  // List<Map>chats = [];
  List<Widget>Screen=
  [
    StartScreen(),
    ChatScreen(),
    ProfilePage(),
  ];
  void ChangeIndex(int Index)
  {
    currentIndex = Index;
    emit(ChangeBottomIndex());
  }
  bool isDark=false;
  void ChangeMode({bool? Dark})
  {
    if(Dark!=null)
    {
      Dark == isDark;
      emit(ChangeModeState());
    }else
    {
     isDark=!isDark;
     emit(ChangeModeState());
    }
    cachHelper.putData(key: 'isDark', value: isDark).then((value)
    {
      emit(ChangeModeState());
    });



   }
}