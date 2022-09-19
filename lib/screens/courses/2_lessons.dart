// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gammal_tech_community/screens/widgets/lesson_item.dart';
import 'package:gammal_tech_community/services/data_models.dart';
import 'package:gammal_tech_community/shared/widgets/bottom_nav_bar.dart';
import '../../services/firestore.dart';
import '../../shared/widgets/loader.dart';
import '../widgets/submission_card.dart';
import '../../../shared/components/components.dart';

class LessonsScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final Course course;
  List myLessonsList = [];
  LessonsScreen({required this.course, super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<LessonList>(
      future: FirestoreService().getLessonList(courseName: course.name),
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
          var lessonsList = snapshot.data!;
          myLessonsList = lessonsList.lessons;
         
          return Scaffold(
            bottomNavigationBar: BottomNavBar(),
            key: scaffoldKey,
            appBar: AppBar(title: const Text('Lessons')),
            body: Container(
              width: double.infinity,
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              decoration: BoxDecoration(color: Colors.teal),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Hero(
                      tag: course.name,
                      child: Image.network(
                        course.img,
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/welcome_background.PNG',
                              width: 300, height: 200, fit: BoxFit.contain);
                        },
                      ),
                    ),
                     const SizedBox(
                      height: 20,
                    ),
                    Text('Lessons',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                   
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.pushNamed(context, '/Add new lesson');
                    //   },
                    //   child: Container(
                    //     margin: const EdgeInsets.all(15.0),
                    //     padding: const EdgeInsets.all(10.0),
                    //     decoration: const BoxDecoration(
                    //       borderRadius: BorderRadius.all(
                    //         Radius.circular(10.0),
                    //       ),
                    //       color: Color.fromARGB(255, 255, 239, 239),
                    //     ),
                    //     width: double.infinity,
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: const [
                    //         Text(
                    //           'Add New Lesson',
                    //           style: TextStyle(
                    //               fontSize: 20, fontWeight: FontWeight.bold),
                    //         ),
                    //         SizedBox(width: 20),
                    //         FaIcon(FontAwesomeIcons.plus)
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        itemBuilder: (context, index) {
                       
                          return LessonItem(
                              context: context,lesson: myLessonsList[index],courseName: course.name);
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 0);
                        },
                        itemCount: lessonsList.lessons.length,
                        shrinkWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const Center(
              child: Dialog(
            child: Text('No courses found in Firestore. Check database'),
          ));
        }
      },
    );
  }
}
