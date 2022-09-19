import 'package:flutter/material.dart';
import 'package:gammal_tech_community/services/data_models.dart';

import '../../../shared/widgets/bottom_nav_bar.dart';
import '../coures_screens.dart';

class ExerciseAuthorScreen extends StatelessWidget {
  final String lessonName;
  final int type;

  const ExerciseAuthorScreen(
      {required this.lessonName, required this.type, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottomNavBar(),
        appBar: AppBar(
            title: Text(
          lessonName,
        )),
        body: SizedBox(
          width: double.infinity,
          child: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            color: Colors.teal,
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
                          'Gammal Tech',
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
                            builder: (context) => type == 3
                                ? ProblemSolving(
                                    lessonName: lessonName,
                                    author: 1,type: 3,
                                  )
                                : Exercises(
                                    type: type,
                                    lessonName: lessonName,
                                    author: 1),
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
                          'Community',
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
                            builder: (context) => type == 3
                                ? ProblemSolving(
                                    lessonName: lessonName,
                                    author: 2, type: 3,
                                  )
                                : Exercises(
                                    type: type,
                                    lessonName: lessonName,
                                    author: 2),
                          ));
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
