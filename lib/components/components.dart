import 'package:flutter/material.dart';

Widget defaulttext({
  bool isClicable = true,
  void Function() ?onTap,
  required TextEditingController controller,
  required TextInputType type ,
  required String? Function(String?)? Validate,
  required String? label,
  required IconData ? Prefix,
  IconData ?suffix ,
  String? Function(String?) ?onSubmitted,
  String? Function(String?)?onChange,
  bool iSPassword =  false,
  void Function () ?suffixPressed,
  Decoration = InputDecoration,
})=>
    TextFormField(
  enabled: true,
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
  controller: controller,
  validator: (String ? value)
  {
    if(value!.isEmpty)
    {
      return 'Enter your email address';
    }
    return null;
  },

) ;
