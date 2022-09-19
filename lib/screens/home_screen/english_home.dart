// ignore_for_file: unnecessary_const, prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gammal_tech_community/screens/login/login_screen.dart';
import 'package:gammal_tech_community/services/data_models.dart';
import 'package:gammal_tech_community/shared/widgets/bottom_nav_bar.dart';
import '../../services/auth.dart';
import '../../services/firestore.dart';
import '../../shared/widgets/loader.dart';
import '../../../shared/components/components.dart';
import '../widgets/widgets.dart';
import 'post_lang.dart';

Widget englishHome(GlobalKey<ScaffoldState> scaffoldKey, context) {
  var englishPostDescription;
  var youtube;
  var facebook;
  var linkedin;
  var vimeo;
  var tiktok;
  var github;
  var instagram;

  var formKey = GlobalKey<FormState>();

  var englishPostController = TextEditingController();

  var youtubeController = TextEditingController();

  var facebookController = TextEditingController();

  var linkedInController = TextEditingController();

  var vimeoController = TextEditingController();

  var githubController = TextEditingController();

  var instagramController = TextEditingController();

  var tiktokController = TextEditingController();

  var user = AuthService().user;

  Future<void> _refresh() {
    return Navigator.push(
        context, MaterialPageRoute(builder: (context) => PostLang(lang: 0)));
  }

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
        return Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          decoration: BoxDecoration(color: Colors.teal),
          child: RefreshIndicator(
            onRefresh: _refresh,
            color: Colors.teal,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),

                    InkWell(
                      onTap: () {
                        user == null
                            ? Navigator.pushNamed(context, '/Login')
                            : scaffoldKey.currentState?.showBottomSheet(
                                (context) => Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 213, 242, 239),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: SingleChildScrollView(
                                      physics: BouncingScrollPhysics(),
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
                                              textDirection: TextDirection.ltr,
                                              child: defaultFormField(
                                                controller:
                                                    englishPostController,
                                                label: 'Post Description',
                                                prefix: FontAwesomeIcons.code,
                                                type: TextInputType.text,
                                                minLines: 1, // <-- SEE HERE
                                                maxLines: 20, // <-- SEE HERE
                                                onSubmit: (value) {},
                                                onChange: ((value) => null),
                                                onSaved: (val) {
                                                  if (val.toString().length >
                                                      250) {
                                                    englishPostDescription = val
                                                        .toString()
                                                        .substring(0, 251);
                                                  } else {
                                                    englishPostDescription =
                                                        val;
                                                  }
                                                },
                                                validate: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please enter some text';
                                                  }
                                                  if (value.length > 250)
                                                    return null;
                                                },
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            defaultFormField(
                                              controller: youtubeController,
                                              label: 'youtube link',
                                              prefix: FontAwesomeIcons.youtube,
                                              type: TextInputType.url,
                                              onSaved: (val) {
                                                youtube = val;
                                              },
                                              onSubmit: (value) {},
                                              onChange: ((value) => null),
                                              validate: (value) {
                                                if (value!.length == 0 ||
                                                    value.isEmpty) {
                                                  return null;
                                                } else if (value.substring(
                                                            0, 24) !=
                                                        'https://www.youtube.com/' &&
                                                    value.substring(0, 16) !=
                                                        'www.youtube.com/' &&
                                                    value.substring(0, 12) !=
                                                        'youtube.com/' &&
                                                    value.substring(0, 17) !=
                                                        'https://youtu.be/' &&
                                                    value.substring(0, 9) !=
                                                        'youtu.be/') {
                                                  return 'Please enter a youtube link that starts with (https://www.youtube.com/)';
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                            SizedBox(height: 10),
                                            defaultFormField(
                                              controller: facebookController,
                                              label: 'Facebook link',
                                              prefix: FontAwesomeIcons.facebook,
                                              type: TextInputType.url,
                                              onSubmit: (value) {},
                                              onSaved: (val) {
                                                facebook = val;
                                              },
                                              onChange: ((value) => null),
                                              validate: (value) {
                                                if (value!.length == 0 ||
                                                    value.isEmpty) {
                                                  return null;
                                                } else if (value.substring(
                                                            0, 24) !=
                                                        'https://www.facebook.com/' &&
                                                    value.substring(0, 17) !=
                                                        'www.facebook.com/' &&
                                                    value.substring(0, 13) !=
                                                        'facebook.com/') {
                                                  return 'Please enter a facebook link that starts with (https://www.facebook.com/)';
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                            SizedBox(height: 10),
                                            defaultFormField(
                                              controller: linkedInController,
                                              label: 'LinkedIn link',
                                              prefix: FontAwesomeIcons.linkedin,
                                              type: TextInputType.url,
                                              onSubmit: (value) {},
                                              onChange: ((value) => null),
                                              onSaved: (val) {
                                                linkedin = val;
                                              },
                                              validate: (value) {
                                                if (value!.length == 0 ||
                                                    value.isEmpty) {
                                                  return null;
                                                } else if (value.substring(
                                                            0, 24) !=
                                                        'https://www.linkedin.com/' &&
                                                    value.substring(0, 17) !=
                                                        'www.linkedin.com/' &&
                                                    value.substring(0, 13) !=
                                                        'linkedin.com/') {
                                                  return 'Please enter a linkedin link that starts with (https://www.linkedin.com/)';
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                            SizedBox(height: 10),
                                            defaultFormField(
                                              controller: vimeoController,
                                              label: 'vimeo link',
                                              prefix: FontAwesomeIcons.vimeo,
                                              type: TextInputType.url,
                                              onSubmit: (value) {},
                                              onChange: ((value) => null),
                                              onSaved: (val) {
                                                vimeo = val;
                                              },
                                              validate: (value) {
                                                if (value!.length == 0 ||
                                                    value.isEmpty) {
                                                  return null;
                                                } else if (value.substring(
                                                            0, 24) !=
                                                        'https://www.vimeo.com/' &&
                                                    value.substring(0, 17) !=
                                                        'www.vimeo.com/' &&
                                                    value.substring(0, 13) !=
                                                        'vimeo.com/') {
                                                  return 'Please enter a vimeo link that starts with (https://www.vimeo.com/)';
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                            SizedBox(height: 10),
                                            defaultFormField(
                                              controller: githubController,
                                              label: 'github link',
                                              prefix: FontAwesomeIcons.github,
                                              type: TextInputType.url,
                                              onSubmit: (value) {},
                                              onChange: ((value) => null),
                                              onSaved: (val) {
                                                github = val;
                                              },
                                              validate: (value) {
                                                if (value!.length == 0 ||
                                                    value.isEmpty) {
                                                  return null;
                                                } else if (value.substring(
                                                            0, 24) !=
                                                        'https://www.github.com/' &&
                                                    value.substring(0, 17) !=
                                                        'www.github.com/' &&
                                                    value.substring(0, 13) !=
                                                        'github.com/') {
                                                  return 'Please enter a github link that starts with (https://www.github.com/)';
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                            SizedBox(height: 10),
                                            defaultFormField(
                                              controller: instagramController,
                                              label: 'instagram link',
                                              prefix:
                                                  FontAwesomeIcons.instagram,
                                              type: TextInputType.url,
                                              onSubmit: (value) {},
                                              onChange: ((value) => null),
                                              onSaved: (val) {
                                                instagram = val;
                                              },
                                              validate: (value) {
                                                if (value!.length == 0 ||
                                                    value.isEmpty) {
                                                  return null;
                                                } else if (value.substring(
                                                            0, 24) !=
                                                        'https://www.instagram.com/' &&
                                                    value.substring(0, 17) !=
                                                        'www.instagram.com/' &&
                                                    value.substring(0, 13) !=
                                                        'instagram.com/') {
                                                  return 'Please enter a instagram link that starts with (https://www.instagram.com/)';
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                            SizedBox(height: 10),
                                            defaultFormField(
                                              controller: tiktokController,
                                              label: 'tiktok link',
                                              prefix: FontAwesomeIcons.tiktok,
                                              type: TextInputType.url,
                                              onSubmit: (value) {},
                                              onChange: ((value) => null),
                                              onSaved: (val) {
                                                tiktok = val;
                                              },
                                              validate: (value) {
                                                if (value!.length == 0 ||
                                                    value.isEmpty) {
                                                  return null;
                                                } else if (value.substring(
                                                            0, 24) !=
                                                        'https://www.tiktok.com/' &&
                                                    value.substring(0, 17) !=
                                                        'www.tiktok.com/' &&
                                                    value.substring(0, 13) !=
                                                        'tiktok.com/') {
                                                  return 'Please enter a tiktok link that starts with (https://www.tiktok.com/)';
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                var formData =
                                                    formKey.currentState;
                                                var uid = user.uid;

                                                if (formData!.validate()) {
                                                  formData.save();
                                                  print(
                                                      '===================================');
                                                  print(englishPostDescription);
                                                  print(
                                                      '===================================');
                                                }
                                                if (youtube != null ||
                                                    facebook != null ||
                                                    linkedin != null ||
                                                    vimeo != null ||
                                                    github != null ||
                                                    instagram != null ||
                                                    tiktok != null) {
                                                  await FirestoreService()
                                                      .addPost(
                                                    context: context,
                                                    description:
                                                        englishPostDescription,
                                                    facebook: facebook,
                                                    github: github,
                                                    instagram: instagram,
                                                    lang: 'en',
                                                    linkedin: linkedin,
                                                    tiktok: tiktok,
                                                    vimeo: vimeo,
                                                    youtube: youtube,
                                                    uid: uid,
                                                  );
                                                }
                                              },
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.all(15.0),
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                decoration: const BoxDecoration(
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
                                                      MainAxisAlignment.center,
                                                  children: const [
                                                    Text(
                                                      'Add Post',
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white),
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
                          children: const [
                            Text(
                              'Add New Post',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 20),
                            FaIcon(FontAwesomeIcons.download)
                          ],
                        ),
                      ),
                    ),

                    // SizedBox(height: 10),
                    SizedBox(
                      width: double.infinity,
                      child: ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        itemCount: posts.length,
                        itemBuilder: (context, index) => EnglishPost(
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

//   @override
//   Widget build(BuildContext context) {
//     return 
//     FutureBuilder<List<Post>>(
//       future: FirestoreService().getPosts('en'),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const LoadingScreen();
//         } else if (snapshot.hasError) {
//           return Center(
//             child: Dialog(
//               child: Text(snapshot.error.toString()),
//             ),
//           );
//         } else if (snapshot.hasData) {
//           var posts = snapshot.data!;
//           return Container(
//             constraints: BoxConstraints(
//               minHeight: MediaQuery.of(context).size.height,
//             ),
//             decoration: BoxDecoration(color: Colors.teal),
//             child: SingleChildScrollView(
//               physics: BouncingScrollPhysics(),
//               child: Padding(
//                 padding: const EdgeInsets.all(5.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(height: 10),

//                     InkWell(
//                       onTap: () {
//                         scaffoldKey.currentState?.showBottomSheet(
//                           (context) => Container(
//                             decoration: BoxDecoration(
//                               color: Color.fromARGB(255, 213, 242, 239),
//                               borderRadius: BorderRadius.all(
//                                 Radius.circular(10.0),
//                               ),
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(12.0),
//                               child: SingleChildScrollView(
//                                 physics: BouncingScrollPhysics(),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     IconButton(
//                                         onPressed: () {
//                                           Navigator.pop(context);
//                                         },
//                                         icon: Icon(
//                                             Icons.expand_circle_down_outlined)),
//                                     defaultFormField(
//                                       controller: youtubeController,
//                                       label: 'youtube link',
//                                       prefix: FontAwesomeIcons.youtube,
//                                       type: TextInputType.url,
//                                       // validate: (String value) {},
//                                     ),
//                                     SizedBox(height: 10),
//                                     defaultFormField(
//                                       controller: youtubeController,
//                                       label: 'Facebook link',
//                                       prefix: FontAwesomeIcons.facebook,
//                                       type: TextInputType.url,
//                                       // validate: (String value) {},
//                                     ),
//                                     SizedBox(height: 10),
//                                     defaultFormField(
//                                       controller: youtubeController,
//                                       label: 'LinkedIn link',
//                                       prefix: FontAwesomeIcons.linkedin,
//                                       type: TextInputType.url,
//                                       // validate: (String value) {},
//                                     ),
//                                     SizedBox(height: 10),
//                                     defaultFormField(
//                                       controller: youtubeController,
//                                       label: 'vimeo link',
//                                       prefix: FontAwesomeIcons.vimeo,
//                                       type: TextInputType.url,
//                                       // validate: (String value) {},
//                                     ),
//                                     InkWell(
//                                       onTap: () {},
//                                       child: Container(
//                                         margin: const EdgeInsets.all(15.0),
//                                         padding: const EdgeInsets.all(10.0),
//                                         decoration: const BoxDecoration(
//                                           borderRadius: BorderRadius.all(
//                                             Radius.circular(10.0),
//                                           ),
//                                           color:
//                                               Color.fromARGB(255, 0, 125, 112),
//                                         ),
//                                         width: 200,
//                                         child: Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.center,
//                                           children: const [
//                                             Text(
//                                               'Submit ',
//                                               style: TextStyle(
//                                                   fontSize: 20,
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Colors.white),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         margin: const EdgeInsets.all(15.0),
//                         padding: const EdgeInsets.all(10.0),
//                         decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.all(
//                             Radius.circular(10.0),
//                           ),
//                           color: Color.fromARGB(255, 255, 239, 239),
//                         ),
//                         width: double.infinity,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: const [
//                             Text(
//                               'add new post',
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(width: 20),
//                             FaIcon(FontAwesomeIcons.download)
//                           ],
//                         ),
//                       ),
//                     ),

//                     // SizedBox(height: 10),
//                     SizedBox(
//                       width: double.infinity,
//                       child: ListView.separated(
//                         physics: NeverScrollableScrollPhysics(),
//                         padding: const EdgeInsets.symmetric(vertical: 15),
//                         itemCount: posts.length,
//                         itemBuilder: (context, index) => EnglishPost(
//                           scaffoldKey,
//                           context,
//                           post: posts[index],
//                         ),
//                         separatorBuilder: (context, index) =>
//                             const SizedBox(height: 0),
//                         shrinkWrap: true,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         } else
//           return LoginScreen();
//       },
//     );
//   }
// }
