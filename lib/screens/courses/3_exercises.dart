import 'package:flutter/material.dart';

import '../../services/data_models.dart';
import '../../services/firestore.dart';
import '../../shared/widgets/bottom_nav_bar.dart';
import '../../shared/widgets/loader.dart';
import 'Exercises/arabic_exercises.dart';
import 'coures_screens.dart';

class Exercises extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var type;
  var author;
  final String lessonName;
  Exercises({
    Key? key,
    this.type = 1,
    this.author = 1,
    required this.lessonName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          bottomNavigationBar: BottomNavBar(),
          key: scaffoldKey,
          appBar: AppBar(
            title: const Text('Gammal Tech Community'),
            bottom: const TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.code),
                  text: 'English',
                ),
                Tab(
                  icon: Icon(Icons.question_answer),
                  text: 'Arabic',
                )
              ],
            ),
          ),
          body: TabBarView(children: [
            englishExercise(
                context: context,
                lessonName: lessonName,
                scaffoldKey: scaffoldKey,
                type: type,
                author: author,
                lang: 'en'),
            arabicExercise(
                context: context,
                lessonName: lessonName,
                scaffoldKey: scaffoldKey,
                type: type,
                author: author,
                lang: 'ar'),
          ]),
        ));
  }
}
