import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gammal_tech_community/screens/courses/2_lessons.dart';
import 'package:gammal_tech_community/services/data_models.dart';

class CourseItem extends StatelessWidget {
  final Course course;
  // final int currentIndex;
  const CourseItem(
      {super.key, required this.course});
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: course.name,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) => LessonsScreen(
                  course: course,
                  
                ),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 3,
                child: SizedBox(
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
              ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    course.name,
                    style: const TextStyle(
                      height: 1.5,
                      
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.fade,
                    softWrap: false,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
