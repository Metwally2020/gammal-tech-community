import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gammal_tech_community/services/data_models.dart';
import 'package:gammal_tech_community/services/firestore.dart';
import 'package:gammal_tech_community/shared/widgets/bottom_nav_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../shared/widgets/loader.dart';
import '../widgets/course_item.dart';
import '../widgets/courses_bundle.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CoursesBundle>>(
      future: FirestoreService().getCoursesBundle(),
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
          var coursesBundle = snapshot.data!;
          // var courses = snapshot.data!;
          // var courseName = snapshot.data!;
          // print('=============================');
          // print(coursesBundle);
          // print('=============================');
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.teal,
              title: const Text('courses'),
              actions: [
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.circleUser,
                    color: Colors.pink[200],
                  ),
                  onPressed: () => Navigator.pushNamed(context, '/profile'),
                )
              ],
            ),
            // drawer: courseDrawer(courses: courses),
            body: Container(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: ListView.builder(
                        itemCount: coursesBundle.length,
                        itemBuilder: (BuildContext context, index) {
                          
                          return Bundle(
                            bundle: coursesBundle[index],
                            currentIndex: index,
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
              ),
            ),
            bottomNavigationBar: const BottomNavBar(),
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
