import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';

Widget usernameTextInput(TextEditingController userNameControler, {
  
  Function? onSaved,
}) {
  // late String username;
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // ignore: prefer_const_literals_to_create_immutables
      children: <Widget>[
        const Text(
          "Username",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        const SizedBox(
          height: 10,
        ),
        // defaultFormField for User name
        defaultFormField(
          onSaved: onSaved,
          onChange: (value) {
            print('on change username now');
          },
          controller: userNameControler,
          onSubmit: (value) {
            print('on submit username now');
          },
          validate: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            } else if (value.length >= 100) {
              return 'Too long username !';
            } else if (value.length < 2) {
              return 'Too short username !';
            }
            return null;
          },
          label: 'User name',
          prefix: Icons.person,
          type: TextInputType.name,
          // prefixIconColor: Colors.teal,
        ),
      ],
    ),
  );
}
