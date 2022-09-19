import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget task(context,task) => Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context,'/$task');
        },
        child: Container(
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 248, 243, 243),
              border: Border.all(),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Center(
            child: Text(
              task,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.fade,
                
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
