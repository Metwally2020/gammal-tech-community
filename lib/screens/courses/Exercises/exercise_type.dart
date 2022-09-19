import 'package:flutter/material.dart';
import 'package:gammal_tech_community/services/data_models.dart';

import '../../../shared/widgets/bottom_nav_bar.dart';
import '../coures_screens.dart';
import 'exercise_author.dart';

class ExerciseTypeScreen extends StatelessWidget {
  final Lesson lesson;
  final String courseName;
  const ExerciseTypeScreen(
      {required this.lesson, required this.courseName, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        appBar: AppBar(
            title: Text(
          lesson.name,
        )),
        body: SizedBox(
          width: double.infinity,
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            color: Colors.teal,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 248, 243, 243),
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Text(
                            'Exercises',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        height: 65,
                        width: double.infinity,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExerciseAuthorScreen(
                                      type: 1,
                                      // courseName: courseName,
                                      lessonName: lesson.name,
                                    )));
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 248, 243, 243),
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Text(
                            'Advanced Exercises',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        height: 65,
                        width: double.infinity,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExerciseAuthorScreen(
                                type: 2,
                                // courseName: courseName,
                                lessonName: lesson.name,
                              ),
                            ));
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 248, 243, 243),
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Text(
                            'Problem Solving',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        height: 65,
                        width: double.infinity,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExerciseAuthorScreen(
                                  lessonName: lesson.name, type: 3),
                            ));
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 248, 243, 243),
                            border: Border.all(),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Center(
                          child: Text(
                            'Questions',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        height: 65,
                        width: double.infinity,
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ExerciseAuthorScreen(
                                type: 4,
                                lessonName: lesson.name,
                              ),
                            ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
