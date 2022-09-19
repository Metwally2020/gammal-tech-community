import 'package:flutter/material.dart';

import '../../services/data_models.dart';
import '../courses/4_submissions.dart';

Widget gammalTechEnglishQuestionCard({context,required Exercise exercise,index}) => Container(
    padding: const EdgeInsets.all(5.0),
    constraints: const BoxConstraints(
      maxWidth: double.infinity,
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(3.0),
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Color.fromARGB(255, 6, 78, 66),
            ),
            width: 80,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://uploads-ssl.webflow.com/5d2cb3382be6ba1741dc013c/5f3f54c78852af6c4ec35860_ogimage.jpg'),
                    radius: 25,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Gammal Tech',
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )
                ]),
          ),
          const SizedBox(width: 5),
          Expanded(
            child: InkWell(
              onTap: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => QuestionPage(
                                    exerciseId: exercise.exerciseId,
                                    exerciseBody: exercise.exerciseBody,
                                    lang: exercise.lang,

                                  )));
              },
              child: Container(
                margin: const EdgeInsets.all(7.0),
                padding: const EdgeInsets.all(10.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  color: Color.fromARGB(255, 253, 244, 244),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'exercise ${index}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text(exercise.exerciseBody
                      ,
                      style: TextStyle(fontSize: 14),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
