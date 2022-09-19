// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:gammal_tech_community/screens/courses/Exercises/exercise_type.dart';

import '../../services/data_models.dart';
import 'socialmedia_platform.dart';

Widget LessonItem({context, lesson,courseName}) => Container(
      padding: const EdgeInsets.all(2.0),
      child: Center(
          child: InkWell(
            onTap: (() {
               Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => ExerciseTypeScreen(courseName: courseName, lesson: lesson,
                  
                ),
              ),
            );
            }),
            child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
            Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                color: Color.fromARGB(255, 6, 78, 66),
              ),
              constraints: BoxConstraints(minWidth: 90),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'lesson',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '${lesson.number}',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 200,
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 15),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                color: Color.fromARGB(255, 253, 244, 244),
              ),
              child: Text(
                lesson.name,
                style: TextStyle(color: Colors.black,fontSize: 20),
              ),
            ),
                  ],
                ),
          )),
    );
