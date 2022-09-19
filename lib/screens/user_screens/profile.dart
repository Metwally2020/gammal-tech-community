import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gammal_tech_community/screens/user_screens/screens/user_posts.dart';
import 'package:gammal_tech_community/services/auth.dart';
import 'package:gammal_tech_community/services/data_models.dart';
import 'package:gammal_tech_community/shared/widgets/bottom_nav_bar.dart';
// import 'dart:io' show Platform;
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'screens/user_exercises.dart';
import 'widgets/profile_header_widget.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  // getData() async {
  //   DocumentReference user = FirebaseFirestore.instance.collection('users').doc("ql4nqEVJWICfGdbAX");
  //   DocumentSnapshot<Object?> querySnapshot = await user.get();

  //     print('===============================');
  //     print(querySnapshot.exists);
  //     print('===============================');

  // }

  @override
  Widget build(BuildContext context) {
    MyUser myUser = Provider.of<MyUser>(context);
    var user = AuthService().user;
    // getData();
    if (user != null) {
      return Scaffold(
        bottomNavigationBar: BottomNavBar(),
        appBar: AppBar(
          title: Text('my profile'),
        ),
        body:
        DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    profileHeaderWidget(context),
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: <Widget>[
              Material(
                color: Colors.teal,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[400],
                  indicatorWeight: 1,
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(
                      icon: Icon(
                        Icons.grid_on_sharp,
                        color: Colors.black,
                      ),
                    ),
                    // Tab(
                    //   icon: Image.asset(
                    //     'assets/facebook.png',
                    //     height: 30,
                    //     width: 30,
                    //   ),
                    // ),
                    Tab(
                      icon: Image.asset(
                        'assets/youtube.png',
                        height: 25,
                        width: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    userExercise(),
                    profilePosts( context),
                    // Reels(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
        
        
        
        //  Padding(
        //   padding: const EdgeInsets.all(16.0),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Row(
        //         crossAxisAlignment: CrossAxisAlignment.start,
        //         mainAxisSize: MainAxisSize.max,
        //         mainAxisAlignment: MainAxisAlignment.end,
        //         children: [
        //           Column(
        //             crossAxisAlignment: CrossAxisAlignment.start,
        //             children: [
        //               CircleAvatar(
        //                 backgroundImage: Image.network(
        //                   myUser.img,
        //                   errorBuilder: (context, error, stackTrace) {
        //                     return Image.asset('assets/profile.png',
        //                         width: 300, height: 200, fit: BoxFit.contain);
        //                   },
        //                 ).image,
        //                 radius: 50,
        //               ),
        //               const SizedBox(
        //                 height: 5,
        //               ),
        //               Text(
        //                 myUser.name,
        //                 style: TextStyle(
        //                   fontSize: 14,
        //                   fontWeight: FontWeight.w500,
        //                 ),
        //               ),
        //               const SizedBox(
        //                 height: 5,
        //               ),




                      // Row(
                      //   children: const [
                      //     Text(
                      //       'Ranking ',
                      //       style: TextStyle(
                      //         fontSize: 16,
                      //       ),
                      //     ),
                      //     Text(
                      //       '35',
                      //       style: TextStyle(
                      //         fontSize: 18,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    // ],
                  // ),

// Container(
//                                     constraints: BoxConstraints(
//                                       minHeight:
//                                           MediaQuery.of(context).size.height,
//                                     ),
//                                     child: TabBar(
//                                       indicatorColor: Colors.white,
//                                       tabs: [
//                                         Tab(
//                                           icon: Icon(Icons.code),
//                                           text: 'Submissions',
//                                         ),
//                                         Tab(
//                                           icon: Icon(Icons.question_answer),
//                                           text: 'Exercises',
//                                         ),
//                                         Tab(
//                                           icon: Icon(Icons.question_answer),
//                                           text: 'Advanced Exercises',
//                                         ),
//                                         Tab(
//                                           icon: Icon(Icons.question_answer),
//                                           text: 'Problems',
//                                         ),
//                                         Tab(
//                                           icon: Icon(Icons.question_answer),
//                                           text: 'Posts',
//                                         ),
//                                         Tab(
//                                           icon: Icon(Icons.question_answer),
//                                           text: 'Questions',
//                                         ),
//                                         Tab(
//                                           icon: Icon(Icons.question_answer),
//                                           text: 'Answers',
//                                         ),
//                                       ],
//                                     ),
//                                   )

                  //  Row(
                  //   mainAxisSize: MainAxisSize.max,
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   crossAxisAlignment: CrossAxisAlignment.stretch,
                  //   children: [
                  //     Column(
                  //       children: [
                  //         Text('${myUser.submissions.length}',
                  //             style: TextStyle(
                  //               fontSize: 18,
                  //               fontWeight: FontWeight.bold,
                  //             )),
                  //         SizedBox(
                  //           height: 5,
                  //         ),
                  //         Text('Submissions',
                  //             style: TextStyle(
                  //               fontSize: 14,
                  //             )),
                  //       ],
                  //     ),
                  //     // const SizedBox(
                  //     //   width: 40,
                  //     // ),
                  //     // Column(
                  //     //   children: const [
                  //     //     Text('200',
                  //     //         style: TextStyle(
                  //     //           fontSize: 15,
                  //     //           fontWeight: FontWeight.bold,
                  //     //         )),
                  //     //     SizedBox(
                  //     //       height: 5,
                  //     //     ),
                  //     //     Text(
                  //     //       'Likes',
                  //     //       style: TextStyle(
                  //     //         fontSize: 10,
                  //     //       ),
                  //     //     )
                  //     //   ],
                  //     // ),
                  //     // const SizedBox(
                  //     //   width: 40,
                  //     // ),
                  //     Column(
                  //       children:  [
                  //         Text('${myUser.submissions.length}',
                  //             style: TextStyle(
                  //               fontSize: 18,
                  //               fontWeight: FontWeight.bold,
                  //             )),
                  //         SizedBox(
                  //           height: 5,
                  //         ),
                  //         Text('Frinds',
                  //             style: TextStyle(
                  //               fontSize: 14,
                  //             )),
                  //       ],
                  //     ),
                  //     //  SizedBox(
                  //     //   width: 40,
                  //     // ),
                  //     Column(
                  //       children:  [
                  //         Text('200',
                  //             style: TextStyle(
                  //               fontSize: 18,
                  //               fontWeight: FontWeight.bold,
                  //             )),
                  //         SizedBox(
                  //           height: 5,
                  //         ),
                  //         Text('Posts',
                  //             style: TextStyle(
                  //               fontSize: 14,
                  //             )),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                // ],
              // ),
             
              //       DefaultTabController(
              //         length: 3,
              //          child: NestedScrollView(
              //            headerSliverBuilder: (
              //             BuildContext context,
              //              bool innerBoxIsScrolled
              //              ) {
              //             return[
              //               SliverList(delegate: SliverChildListDelegate([
              //                 //  profileHeaderWidget(context),
              //             ],
              //           ),
              //         ),
              //       ];
              //     },
              //     body: Column(
              //       children: <Widget>[
              //         Material(
              //           color: Colors.white,
              //           child: TabBar(
              //             labelColor: Colors.black,
              //             unselectedLabelColor: Colors.grey[400],
              //             indicatorWeight: 1,
              //             indicatorColor: Colors.black,
              //             tabs: [
              //               const Tab(
              //                 icon: Icon(
              //                   Icons.grid_on_sharp,
              //                   color: Colors.black,
              //                 ),
              //               ),
              //               Tab(
              //                 icon: Image.asset(
              //                   'assets/icons/igtv.png',
              //                   height: 30,
              //                   width: 30,
              //                 ),
              //               ),
              //               Tab(
              //                 icon: Image.asset(
              //                   'assets/icons/reels.png',
              //                   height: 25,
              //                   width: 25,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         const Expanded(
              //           child: TabBarView(
              //             children: [
              //               // Gallery(),
              //               // Igtv(),
              //               // Reels(),
              //             ],
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

          //     const SizedBox(
          //       height: 50,
          //     ),
          //   ],
          // ),
        // ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('profile'),
        ),
        body: Center(
          child: Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('please log in to view the content'),
                  SizedBox(
                    height: 20,
                  ),
                  MaterialButton(onPressed: () {
                    Navigator.pushNamed(context, '/Login');
                  })
                ]),
          ),
        ),
      );
    }
  }
}

            // BottomNavigationBar(items: const [
            //   BottomNavigationBarItem(
            //     icon: Icon(
            //       Icons.person,
            //       size: 30,
            //       color: Colors.blue,
            //     ),
            //     label: 'My posts'
            //   ),
            //   BottomNavigationBarItem(
            //     icon: Icon(
            //       Icons.favorite,
            //       size: 30,
            //       color: Colors.red,
            //     ),
            //     label:'Liked'
            //   ),
            // ]),
            // Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            //   IconButton(
            //     icon: const Icon(
            //       Icons.person,
            //       size: 30,
            //       color: Colors.blue,
            //     ),
            //     onPressed: () {},
            //   ),
            //   IconButton(
            //     icon: const Icon(
            //       Icons.favorite,
            //       size: 30,
            //       color: Colors.red,
            //     ),
            //     onPressed: () {},
            //   ),
            // ]),