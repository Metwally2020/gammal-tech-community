import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gammal_tech_community/services/auth.dart';

import '../../../services/data_models.dart';
import '../../../services/firestore.dart';
import '../../../shared/components/components.dart';
import '../../../shared/widgets/loader.dart';
import '../../widgets/english_question_card.dart';
import '../../widgets/widgets.dart';
import '../3_exercises.dart';

Widget arabicExercise({scaffoldKey, context, lessonName, type, lang, author}) {
  // var scaffoldKey = GlobalKey<ScaffoldState>();
  List<Exercise> myList = [];
  var formKey = GlobalKey<FormState>();
  String? newexercise;
  var user = AuthService().user;

  // List<Exercise> gammalTechList = [];
  var exerciseController = TextEditingController();
  return author == 1
      ?
      //that means gammal tech is the author
      FutureBuilder<List<Exercise>>(
          future: FirestoreService().getGammalTechExercises(
            type: type,
            lang: lang,
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
              var gammalTechList = snapshot.data!;
              return Container(
                  decoration: BoxDecoration(color: Colors.teal),
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height,
                  ),
                  child: RefreshIndicator(
                    onRefresh: () {
                      return Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Exercises(
                                    lessonName: lessonName,
                                    type: type,
                                    author: author,
                                  )));
                    },
                    color: Colors.teal,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: ListView.separated(
                          // primary: false,
                          physics: NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          itemBuilder: (context, index) =>
                              gammalTechArabicQuestionCard(
                                  context: context,
                                  exercise: gammalTechList[index],
                                  index: index),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 0),
                          itemCount: gammalTechList.length,
                          shrinkWrap: true,
                        ),
                      ),
                    ),
                  ));
            } else {
              return SizedBox(height: 0);
            }
          })
      : FutureBuilder<List<Exercise>>(
          future: FirestoreService().getExercises(
            type: type,
            lang: lang,
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
              return Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height,
                ),
                decoration: BoxDecoration(color: Colors.teal),
                child: RefreshIndicator(
                  onRefresh: () {
                    return Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Exercises(
                                  lessonName: lessonName,
                                  type: type,
                                  author: author,
                                )));
                  },
                  color: Colors.teal,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: 15),
                          Text(
                            type == 1
                                ? 'التمارين'
                                : type == 2
                                    ? 'التمارين المتقدمة'
                                    : 'الأسئلة و الإستفسارات',
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          //adding lesson form
                          InkWell(
                            onTap: () {
                              user == null
                                  ? Navigator.pushNamed(context, '/Login')
                                  : scaffoldKey.currentState?.showBottomSheet(
                                      (context) => Container(
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 213, 242, 239),
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: SingleChildScrollView(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            child: Form(
                                              key: formKey,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  IconButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      icon: Icon(Icons
                                                          .expand_circle_down_outlined)),
                                                  Directionality(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    child: defaultFormField(
                                                      controller:
                                                          exerciseController,
                                                      label: 'التمرين',
                                                      prefix:
                                                          FontAwesomeIcons.code,
                                                      type: TextInputType.text,
                                                      minLines:
                                                          1, // <-- SEE HERE
                                                      maxLines:
                                                          20, // <-- SEE HERE
                                                      onSubmit: (value) {},
                                                      onChange: ((value) =>
                                                          null),
                                                      onSaved: (val) {
                                                        if (val
                                                                .toString()
                                                                .length >
                                                            250) {
                                                          newexercise = val
                                                              .toString()
                                                              .substring(
                                                                  0, 1000);
                                                        } else {
                                                          newexercise = val;
                                                        }
                                                      },
                                                      validate: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'لا تترك الخانة فارغة';
                                                        }
                                                        // if (value.length > 250)
                                                        return null;
                                                      },
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () async {
                                                      var formData =
                                                          formKey.currentState;

                                                      var uid = user.uid;

                                                      if (formData!
                                                          .validate()) {
                                                        formData.save();
                                                        print(
                                                            '===================================');
                                                        print(newexercise);
                                                        print(
                                                            '===================================');
                                                        await FirestoreService()
                                                            .addExercise(
                                                                context:
                                                                    context,
                                                                newExercise:
                                                                    newexercise,
                                                                author: uid,
                                                                lang: lang,
                                                                type: type,
                                                                lessonName:
                                                                    lessonName);
                                                      }
                                                    },
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              15.0),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      decoration:
                                                          const BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(10.0),
                                                        ),
                                                        color: Color.fromARGB(
                                                            255, 0, 125, 112),
                                                      ),
                                                      width: 200,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: const [
                                                          Text(
                                                            'إضافة',
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                            style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                            },
                            child: Container(
                              margin: const EdgeInsets.all(15.0),
                              padding: const EdgeInsets.all(10.0),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                                color: Color.fromARGB(255, 255, 239, 239),
                              ),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(FontAwesomeIcons.download),
                                  SizedBox(width: 20),
                                  Text(
                                    type == 1
                                        ? 'Add new Exercise'
                                        : type == 2
                                            ? 'Add new Advanced Exercise'
                                            : 'Add new Question',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: ListView.separated(
                              // primary: false,
                              physics: NeverScrollableScrollPhysics(),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              itemBuilder: (context, index) =>
                                  arabicQuestionCard(
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
