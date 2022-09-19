import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:gammal_tech_community/screens/courses/2_lessons.dart';
import 'package:gammal_tech_community/screens/widgets/course_item.dart';
import 'package:gammal_tech_community/services/data_models.dart';

class Bundle extends StatelessWidget {
  final CoursesBundle bundle;
  final int currentIndex;
  const Bundle({super.key, required this.bundle, required this.currentIndex});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Text(bundle.bundleName),
          ),
          Container(
            child: GridView.builder(
              itemCount: bundle.courses.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                // mainAxisSpacing: 40,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (BuildContext context, index) {
                return CourseItem(
                course: bundle.courses[index],
              );
              },
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(20.0),
            ),
          ),
        ],
      ),
    );
  }
}
