import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gammal_tech_community/services/auth.dart';

import '../../../services/data_models.dart';
import '../../../services/firestore.dart';
import '../../../shared/components/components.dart';
import '../../../shared/widgets/loader.dart';
import '../../courses/3_exercises.dart';
import '../../widgets/english_question_card.dart';
import '../../widgets/profile_question_card.dart';
import '../../widgets/widgets.dart';

Widget userExercise(
    {scaffoldKey, context, lessonName, type,uid}) {
  // var scaffoldKey = GlobalKey<ScaffoldState>();
  List<Exercise> myList = [];
  var formKey = GlobalKey<FormState>();
  String? newexercise;
  var user = AuthService().user;
  // List<Exercise> gammalTechList = [];
  var exerciseController = TextEditingController();
  return
  FutureBuilder<List<Exercise>>(
          future: FirestoreService().getUserExercises(
            type: type,
            uid: uid,
            lessonName: lessonName,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingScreen();
            } else if (snapshot.hasError) {
              return Center(
                child: Dialog(
                  child: Text(snapshot.error.toString()),
                ),
              );
            } else if (snapshot.hasData) {
              myList = snapshot.data!;
              return Scaffold(
                body: Container(
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  decoration: BoxDecoration(color: Colors.teal),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 15),
                          Text(
                            type == 1
                                ? 'Community Exercises'
                                : type == 2
                                    ? 'Community Advanced\nExercises'
                                    : 'Community Questions',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          //adding lesson form
                          
                          SizedBox(
                            width: double.infinity,
                            child: ListView.separated(
                              // primary: false,
                              physics: NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              itemBuilder: (context, index) =>
                                  profileQuestionCard(
                                      context: context,
                                      exercise: myList[index],
                                      index: index),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 1),
                              itemCount: myList.length,
                              shrinkWrap: true,
                            ),
                          ),
              
                          SizedBox(height: 10)
                        ]),
                  ),
                ),
              );
            } else {
              return SizedBox(height: 0);
            }
          });
}
