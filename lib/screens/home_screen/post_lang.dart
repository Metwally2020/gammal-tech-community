import 'package:flutter/material.dart';
import 'package:gammal_tech_community/screens/widgets/widgets.dart';

import '../../shared/widgets/bottom_nav_bar.dart';
import 'arabic_home.dart';
import 'english_home.dart';

class PostLang extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var lang;

  PostLang({
    super.key,
    this.lang = 0,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(

      length: 2,
      initialIndex: lang,
      child: Scaffold(
        
          bottomNavigationBar: BottomNavBar(),
          key: scaffoldKey,
          appBar: AppBar(
            title: const Text('Home'),
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
            englishHome(scaffoldKey, context),
            arabicHome(scaffoldKey, context),
          ])),
    );
  }
}
