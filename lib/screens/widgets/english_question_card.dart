import 'package:flutter/material.dart';
import 'package:gammal_tech_community/services/data_models.dart';

import '../courses/4_submissions.dart';

Widget englishQuestionCard({context, required Exercise exercise, index}) =>
    Container(
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
                            'https://upload.wikimedia.org/wikipedia/commons/a/a0/Andrzej_Person_Kancelaria_Senatu.jpg'),
                        radius: 25,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'Ahmed Hanafi',
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
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          exercise.exerciseBody,
                          style: TextStyle(fontSize: 14),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Column(children: const [
                Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '225',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ]),
            ],
          ),
        ));
