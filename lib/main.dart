import 'package:chatapp/Network/cash_helper.dart';
import 'package:chatapp/cubit/cubit.dart';
import 'package:chatapp/cubit/state.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/style/themes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screen/login_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  await cachHelper.iniit();
  dynamic isDark= cachHelper.getData(key: 'isDark');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  if(isDark==null)
  {
    runApp(MyApp(false));

  }else {
    runApp(MyApp(isDark));
  }
  }

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>ChatCubit()..
      ChangeMode(Dark: isDark),
      child: BlocConsumer<ChatCubit,ChatStats>(
        builder:(context,state)
        {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ligthTheme,
            darkTheme: darkTheme,
            themeMode: ChatCubit.get(context).isDark? ThemeMode.dark:ThemeMode.light,

            home: ChatsScreen() ,
            debugShowCheckedModeBanner: false,
          );
        } ,
        listener:(context,state)
        {} ,
      ),
    );
  }
}

