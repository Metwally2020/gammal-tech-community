// ignore_for_file: unnecessary_const, prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gammal_tech_community/screens/login/login_screen.dart';
import 'package:gammal_tech_community/services/data_models.dart';
import 'package:gammal_tech_community/shared/widgets/bottom_nav_bar.dart';

import '../../../services/firestore.dart';
import '../../../shared/widgets/loader.dart';
import '../../widgets/profile_post.dart';

Widget profilePosts(context) {



  // CollectionReference<Map<String, dynamic>> postsref =
  //     FirebaseFirestore.instance.collection('posts');
  return FutureBuilder<List<Post>>(
    future: FirestoreService().getPosts('en'),
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
        var posts = snapshot.data!;
        return Scaffold(
          body: Container(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            decoration: BoxDecoration(color: Colors.teal),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        itemCount: posts.length,
                        itemBuilder: (context, index) => ProfilePost(
                          context,
                          post: posts[index],
                        ),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 0),
                        shrinkWrap: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      } else
        return LoginScreen();
    },
  );
}
