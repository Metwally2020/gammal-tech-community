import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';

Widget emailTextInput(
  TextEditingController emailControler, {
  Function? onSaved,
}) =>
    Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const Text(
            "Email",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(
            height: 10,
          ),
          // defaultFormField for User name
          defaultFormField(
            onChange: (value) {
              print('on change email now');
            },
            onSaved: onSaved,
            controller: emailControler,
            onSubmit: (value) {
              print('on submit email now');
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
            label: 'email',
            prefix: Icons.person,
            type: TextInputType.emailAddress,
          ),
        ],
      ),
    );
