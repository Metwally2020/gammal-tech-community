// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gammal_tech_community/screens/widgets/arabic_submission_card.dart';
import 'package:gammal_tech_community/services/data_models.dart';
import 'package:gammal_tech_community/shared/widgets/bottom_nav_bar.dart';
import '../../services/auth.dart';
import '../../services/firestore.dart';
import '../../shared/widgets/loader.dart';
import '../login/login_screen.dart';
import '../widgets/submission_card.dart';
import '../../../shared/components/components.dart';

class QuestionPage extends StatelessWidget {
  var youtube;
  var facebook;
  var linkedin;
  var vimeo;
  var tiktok;
  var github;
  var instagram;

  var formKey = GlobalKey<FormState>();

  var scaffoldKey = GlobalKey<ScaffoldState>();

  var youtubeController = TextEditingController();

  var facebookController = TextEditingController();

  var linkedInController = TextEditingController();

  var vimeoController = TextEditingController();

  var githubController = TextEditingController();

  var instagramController = TextEditingController();

  var tiktokController = TextEditingController();

  var user = AuthService().user;
  final String exerciseId;
  final String exerciseBody;
  final String lang;
  QuestionPage(
      {required this.exerciseId,
      this.exerciseBody = 'no text',
      this.lang = 'en'});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Submission>>(
      future: FirestoreService().getSubmissons(exerciseId: exerciseId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingScreen();
        } else if (snapshot.hasError) {
          return Center(
            child: Dialog(
              child: Text(snapshot.error.toString()),
            ),
          );
        } else if (snapshot.hasData) {
          var submissions = snapshot.data!;
          return Scaffold(
            bottomNavigationBar: BottomNavBar(),
            key: scaffoldKey,
            appBar: AppBar(title: const Text('Gammal Tech Community')),
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
                              Container(
                                margin: const EdgeInsets.all(15.0),
                                padding: const EdgeInsets.all(20.0),
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  color: Color.fromARGB(255, 253, 244, 244),
                                ),
                                constraints: const BoxConstraints(
                                  maxWidth: double.infinity,
                                ),
                                child: Center(
                                    child: Text(
                                  exerciseBody,
                                  textDirection: lang == 'ar'
                                      ? TextDirection.rtl
                                      : TextDirection.ltr,
                                )),
                              ),
                              SizedBox(height: 20),
                              Container(
                                constraints: BoxConstraints(
                                  minHeight: MediaQuery.of(context).size.height,
                                ),
                                decoration: BoxDecoration(color: Colors.teal),
                                child: RefreshIndicator(
                                  onRefresh: () {
                                    return Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => QuestionPage(
                                                exerciseId: exerciseId)));
                                  },
                                  color: Colors.teal,
                                  child: SingleChildScrollView(
                                    physics: BouncingScrollPhysics(),
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 10),

                                          InkWell(
                                            onTap: () {
                                              user==null ? Navigator.pushNamed(context,'/Login')
                                              :
                                              scaffoldKey.currentState
                                                  ?.showBottomSheet(
                                                (context) => Container(
                                                  decoration: BoxDecoration(
                                                    color: Color.fromARGB(
                                                        255, 213, 242, 239),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(10.0),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      physics:
                                                          BouncingScrollPhysics(),
                                                      child: Form(
                                                        key: formKey,
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            IconButton(
                                                                onPressed: () {
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                icon: Icon(Icons
                                                                    .expand_circle_down_outlined)),
                                                            defaultFormField(
                                                              controller:
                                                                  youtubeController,
                                                              label:
                                                                  'youtube link',
                                                              prefix:
                                                                  FontAwesomeIcons
                                                                      .youtube,
                                                              type:
                                                                  TextInputType
                                                                      .url,
                                                              onSaved: (val) {
                                                                youtube = val;
                                                              },
                                                              onSubmit:
                                                                  (value) {},
                                                              onChange:
                                                                  ((value) =>
                                                                      null),
                                                              validate:
                                                                  (value) {
                                                                if (value!.length ==
                                                                        0 ||
                                                                    value
                                                                        .isEmpty) {
                                                                  return null;
                                                                } else if (value
                                                                            .substring(0,
                                                                                24) !=
                                                                        'https://www.youtube.com/' &&
                                                                    value.substring(
                                                                            0,
                                                                            16) !=
                                                                        'www.youtube.com/' &&
                                                                    value.substring(
                                                                            0,
                                                                            12) !=
                                                                        'youtube.com/' &&
                                                                    value.substring(
                                                                            0,
                                                                            17) !=
                                                                        'https://youtu.be/' &&
                                                                    value.substring(
                                                                            0,
                                                                            9) !=
                                                                        'youtu.be/') {
                                                                  return 'Please enter a youtube link that starts with (https://www.youtube.com/)';
                                                                } else {
                                                                  return null;
                                                                }
                                                              },
                                                            ),
                                                            SizedBox(
                                                                height: 10),
                                                            defaultFormField(
                                                              controller:
                                                                  facebookController,
                                                              label:
                                                                  'Facebook link',
                                                              prefix:
                                                                  FontAwesomeIcons
                                                                      .facebook,
                                                              type:
                                                                  TextInputType
                                                                      .url,
                                                              onSubmit:
                                                                  (value) {},
                                                              onSaved: (val) {
                                                                facebook = val;
                                                              },
                                                              onChange:
                                                                  ((value) =>
                                                                      null),
                                                              validate:
                                                                  (value) {
                                                                if (value!.length ==
                                                                        0 ||
                                                                    value
                                                                        .isEmpty) {
                                                                  return null;
                                                                } else if (value
                                                                            .substring(0,
                                                                                24) !=
                                                                        'https://www.facebook.com/' &&
                                                                    value.substring(
                                                                            0,
                                                                            17) !=
                                                                        'www.facebook.com/' &&
                                                                    value.substring(
                                                                            0,
                                                                            13) !=
                                                                        'facebook.com/') {
                                                                  return 'Please enter a facebook link that starts with (https://www.facebook.com/)';
                                                                } else {
                                                                  return null;
                                                                }
                                                              },
                                                            ),
                                                            SizedBox(
                                                                height: 10),
                                                            defaultFormField(
                                                              controller:
                                                                  linkedInController,
                                                              label:
                                                                  'LinkedIn link',
                                                              prefix:
                                                                  FontAwesomeIcons
                                                                      .linkedin,
                                                              type:
                                                                  TextInputType
                                                                      .url,
                                                              onSubmit:
                                                                  (value) {},
                                                              onChange:
                                                                  ((value) =>
                                                                      null),
                                                              onSaved: (val) {
                                                                linkedin = val;
                                                              },
                                                              validate:
                                                                  (value) {
                                                                if (value!.length ==
                                                                        0 ||
                                                                    value
                                                                        .isEmpty) {
                                                                  return null;
                                                                } else if (value
                                                                            .substring(0,
                                                                                24) !=
                                                                        'https://www.linkedin.com/' &&
                                                                    value.substring(
                                                                            0,
                                                                            17) !=
                                                                        'www.linkedin.com/' &&
                                                                    value.substring(
                                                                            0,
                                                                            13) !=
                                                                        'linkedin.com/') {
                                                                  return 'Please enter a linkedin link that starts with (https://www.linkedin.com/)';
                                                                } else {
                                                                  return null;
                                                                }
                                                              },
                                                            ),
                                                            SizedBox(
                                                                height: 10),
                                                            defaultFormField(
                                                              controller:
                                                                  vimeoController,
                                                              label:
                                                                  'vimeo link',
                                                              prefix:
                                                                  FontAwesomeIcons
                                                                      .vimeo,
                                                              type:
                                                                  TextInputType
                                                                      .url,
                                                              onSubmit:
                                                                  (value) {},
                                                              onChange:
                                                                  ((value) =>
                                                                      null),
                                                              onSaved: (val) {
                                                                vimeo = val;
                                                              },
                                                              validate:
                                                                  (value) {
                                                                if (value!.length ==
                                                                        0 ||
                                                                    value
                                                                        .isEmpty) {
                                                                  return null;
                                                                } else if (value
                                                                            .substring(0,
                                                                                24) !=
                                                                        'https://www.vimeo.com/' &&
                                                                    value.substring(
                                                                            0,
                                                                            17) !=
                                                                        'www.vimeo.com/' &&
                                                                    value.substring(
                                                                            0,
                                                                            13) !=
                                                                        'vimeo.com/') {
                                                                  return 'Please enter a vimeo link that starts with (https://www.vimeo.com/)';
                                                                } else {
                                                                  return null;
                                                                }
                                                              },
                                                            ),
                                                            SizedBox(
                                                                height: 10),
                                                            defaultFormField(
                                                              controller:
                                                                  githubController,
                                                              label:
                                                                  'github link',
                                                              prefix:
                                                                  FontAwesomeIcons
                                                                      .github,
                                                              type:
                                                                  TextInputType
                                                                      .url,
                                                              onSubmit:
                                                                  (value) {},
                                                              onChange:
                                                                  ((value) =>
                                                                      null),
                                                              onSaved: (val) {
                                                                github = val;
                                                              },
                                                              validate:
                                                                  (value) {
                                                                if (value!.length ==
                                                                        0 ||
                                                                    value
                                                                        .isEmpty) {
                                                                  return null;
                                                                } else if (value
                                                                            .substring(0,
                                                                                24) !=
                                                                        'https://www.github.com/' &&
                                                                    value.substring(
                                                                            0,
                                                                            17) !=
                                                                        'www.github.com/' &&
                                                                    value.substring(
                                                                            0,
                                                                            13) !=
                                                                        'github.com/') {
                                                                  return 'Please enter a github link that starts with (https://www.github.com/)';
                                                                } else {
                                                                  return null;
                                                                }
                                                              },
                                                            ),
                                                            SizedBox(
                                                                height: 10),
                                                            defaultFormField(
                                                              controller:
                                                                  instagramController,
                                                              label:
                                                                  'instagram link',
                                                              prefix:
                                                                  FontAwesomeIcons
                                                                      .instagram,
                                                              type:
                                                                  TextInputType
                                                                      .url,
                                                              onSubmit:
                                                                  (value) {},
                                                              onChange:
                                                                  ((value) =>
                                                                      null),
                                                              onSaved: (val) {
                                                                instagram = val;
                                                              },
                                                              validate:
                                                                  (value) {
                                                                if (value!.length ==
                                                                        0 ||
                                                                    value
                                                                        .isEmpty) {
                                                                  return null;
                                                                } else if (value
                                                                            .substring(0,
                                                                                24) !=
                                                                        'https://www.instagram.com/' &&
                                                                    value.substring(
                                                                            0,
                                                                            17) !=
                                                                        'www.instagram.com/' &&
                                                                    value.substring(
                                                                            0,
                                                                            13) !=
                                                                        'instagram.com/') {
                                                                  return 'Please enter a instagram link that starts with (https://www.instagram.com/)';
                                                                } else {
                                                                  return null;
                                                                }
                                                              },
                                                            ),
                                                            SizedBox(
                                                                height: 10),
                                                            defaultFormField(
                                                              controller:
                                                                  tiktokController,
                                                              label:
                                                                  'tiktok link',
                                                              prefix:
                                                                  FontAwesomeIcons
                                                                      .tiktok,
                                                              type:
                                                                  TextInputType
                                                                      .url,
                                                              onSubmit:
                                                                  (value) {},
                                                              onChange:
                                                                  ((value) =>
                                                                      null),
                                                              onSaved: (val) {
                                                                tiktok = val;
                                                              },
                                                              validate:
                                                                  (value) {
                                                                if (value!.length ==
                                                                        0 ||
                                                                    value
                                                                        .isEmpty) {
                                                                  return null;
                                                                } else if (value
                                                                            .substring(0,
                                                                                24) !=
                                                                        'https://www.tiktok.com/' &&
                                                                    value.substring(
                                                                            0,
                                                                            17) !=
                                                                        'www.tiktok.com/' &&
                                                                    value.substring(
                                                                            0,
                                                                            13) !=
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
                                                                    formKey
                                                                        .currentState;

                                                                var uid =
                                                                    user!.uid;
                                                                if (formData!
                                                                    .validate()) {
                                                                  formData
                                                                      .save();
                                                                  print(
                                                                      '===================================');

                                                                  print(
                                                                      '===================================');
                                                                }
                                                                if (youtube !=
                                                                        null ||
                                                                    facebook !=
                                                                        null ||
                                                                    linkedin !=
                                                                        null ||
                                                                    vimeo !=
                                                                        null ||
                                                                    github !=
                                                                        null ||
                                                                    instagram !=
                                                                        null ||
                                                                    tiktok !=
                                                                        null) {
                                                                  await FirestoreService()
                                                                      .addSubmission(
                                                                    context:
                                                                        context,
                                                                    facebook:
                                                                        facebook,
                                                                    github:
                                                                        github,
                                                                    instagram:
                                                                        instagram,
                                                                    linkedin:
                                                                        linkedin,
                                                                    tiktok:
                                                                        tiktok,
                                                                    vimeo:
                                                                        vimeo,
                                                                    youtube:
                                                                        youtube,
                                                                    uid: uid,
                                                                  );
                                                                }
                                                              },
                                                              child: Container(
                                                                margin:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        15.0),
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius.circular(
                                                                        10.0),
                                                                  ),
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          0,
                                                                          125,
                                                                          112),
                                                                ),
                                                                width: 200,
                                                                child: Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: const [
                                                                    Text(
                                                                      'Add Submission',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              20,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              Colors.white),
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
                                              margin:
                                                  const EdgeInsets.all(15.0),
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.0),
                                                ),
                                                color: Color.fromARGB(
                                                    255, 255, 239, 239),
                                              ),
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: const [
                                                  Text(
                                                    'Add New Submission',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  SizedBox(width: 20),
                                                  FaIcon(
                                                      FontAwesomeIcons.download)
                                                ],
                                              ),
                                            ),
                                          ),

                                          // SizedBox(height: 10),
                                          SizedBox(
                                            width: double.infinity,
                                            child: ListView.separated(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 15),
                                              itemCount: submissions.length,
                                              itemBuilder: (context, index) =>
                                                  submissionCard(
                                                context: context,
                                                submission: submissions[index],
                                              ),
                                              separatorBuilder:
                                                  (context, index) =>
                                                      const SizedBox(height: 0),
                                              shrinkWrap: true,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ])))),
          );
        } else
          return LoginScreen();
      },
    );
  }
}
