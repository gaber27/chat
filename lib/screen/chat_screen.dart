import 'package:chatapp/cubit/cubit.dart';
import 'package:chatapp/cubit/state.dart';
import 'package:chatapp/models/messages%20model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatelessWidget {
  var formkey = GlobalKey<FormState>();
  List<ChatMessage> messages = [
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(messageContent: "Is there any thing wrongdhdhwadjwak;dawndfllwaqdf  qdwjdfqwfdwacfhqwcfawfhihaw?", messageType: "sender")
  ];
  // FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference message = FirebaseFirestore.instance.collection('messages');
  var onSum = TextEditingController();
  final scrollcontroller = ScrollController();

  @override
  Widget build(BuildContext context) {
   String email= ModalRoute.of(context)!.settings.arguments as String;
    return BlocConsumer<ChatCubit,ChatStats>(
      builder: (context,state)
      {
        return StreamBuilder<QuerySnapshot>
          (
          stream: message.orderBy('createAt',descending: true).snapshots(),
            builder: (context,snapshots)
            {
              if(snapshots.hasData)
              {
                List<Messages> messagesList=[];
                for(int i =0; i < snapshots.data!.docs.length; i++)
                {
                  messagesList.add(Messages.fromjson(snapshots.data!.docs[i]));
                }
                // print(snapshots.data!.docs[0]['messages']);
                return Scaffold(
                  appBar: AppBar
                    (
                    automaticallyImplyLeading: false,
                    leading: IconButton(
                      icon:( Icon(
                          Icons.arrow_back_ios
                      )
                      ),
                      onPressed:()
                      {
                        Navigator.pop(context);
                      } ,
                    ),

                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          reverse: true,
                          controller: scrollcontroller,
                          itemCount: messagesList.length,
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                          // physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index){
                            return Container(
                              padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                              child: Align(
                                alignment: (messagesList[index].id == email ?Alignment.topLeft:Alignment.topRight),
                                // alignment: Alignment.topLeft,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: (
                                        ChatCubit.get(context).isDark?
                                        messagesList[index].id  == email?
                                        // ChatCubit.get(context).isDark?
                                        Colors.deepPurple:Colors.grey.shade200
                                            :
                                        messagesList[index].id == email?
                                        ChatCubit.get(context).isDark?
                                        Colors.grey.shade200:Colors.blue[200]:
                                        Colors.grey.shade200
                                    )

                                  ),
                                  padding: EdgeInsets.all(16),
                                  child: Text(messagesList[index].txt, style: TextStyle(fontSize: 15),),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SingleChildScrollView(
                        reverse: true,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 12.0,
                              left: 12,
                              right: 12,
                              top: 4),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 40.0),
                            child: Form(
                              key: formkey,
                              child: Row(

                                children: [
                                  IconButton(onPressed: (){}, icon: Icon(Icons.add_circle_outline_rounded)),
                                  Expanded(
                                    child: Container(
                                      // height: ,
                                      child: TextFormField(
                                        validator: (value)
                                        {
                                        },
                                        controller: onSum,
                                        onFieldSubmitted: (value)
                                        {
                                          // if(formkey.currentState!.validate())
                                          // {
                                          //   message.add({
                                          //     'messages':value,
                                          //     'createAt': DateTime.now()
                                          //   });
                                          // }
                                          // onSum.clear();
                                          // scrollcontroller.animateTo(
                                          //     scrollcontroller.position.maxScrollExtent,
                                          //     duration: Duration(milliseconds: 1),
                                          //     curve: Curves.fastLinearToSlowEaseIn
                                          // );
                                        },
                                        enabled: true,
                                        decoration:
                                        InputDecoration(
                                          hintText:'Message',
                                          enabledBorder: (
                                              OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(20),
                                              )
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20)

                                          ),
                                          disabledBorder:  OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(20)

                                          ),
                                          filled: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(onPressed:
                                      ()
                                  {
                                    message.add(
                                        {
                                          'messages':onSum.text,
                                          'createAt': DateTime.now(),
                                          'id':email,
                                        });
                                    onSum.clear();
                                    scrollcontroller.animateTo(
                                        0,
                                        duration: Duration(milliseconds: 1),
                                        curve: Curves.fastOutSlowIn
                                    );
                                    // message.add();

                                  }
                                      , icon: Icon(Icons.send)),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )

                    ],
                  ),

                  // body: ListView.separated(
                  //   itemCount:messages.length ,
                  //   separatorBuilder:(context,index)=>SizedBox(
                  //     height: 0,
                  //   ),
                  //   itemBuilder: (context,index)
                  //   {
                  //     return Container(
                  //         padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                  //       child: Align(
                  //         alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                  //         child: Container(
                  //           height: 70,
                  //           // width: 100,
                  //           alignment: Alignment.centerLeft,
                  //           padding: EdgeInsets.only(left: 10),
                  //           margin: EdgeInsets.all(16),
                  //           decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.only(
                  //               topLeft: Radius.circular(32),
                  //               topRight: Radius.circular(32),
                  //               bottomRight: Radius.circular(32),
                  //             ),
                  //             color: ChatCubit.get(context).isDark? Colors.deepPurple:Colors.blue,
                  //           ),
                  //           child:
                  //           Text(
                  //             messages[index].messageContent,
                  //             style: TextStyle(
                  //                 color: Colors.white,
                  //                 fontWeight: FontWeight.w600,
                  //                 fontSize: 16
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                );

              }else
              {
                return Center(child: CircularProgressIndicator());
              }
            // print(snapshots.data!.docs[1]['message']);

            }
        );
      },
      listener: (context,state){},

    );
  }

}
class ChatMessage{
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}
