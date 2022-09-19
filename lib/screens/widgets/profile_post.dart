// import 'dart:js';

import 'package:flutter/material.dart';

import '../../services/data_models.dart';
import 'socialmedia_platform.dart';

class ProfilePost extends StatelessWidget {
  Post post;
  ProfilePost(context, {required this.post});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5.0),
        constraints: const BoxConstraints(
          maxWidth: double.infinity,
        ),
        child: Center(
          child: post.lang == 'en'
              ? Column(
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
                          child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(children: const [
                                    Icon(
                                      Icons.favorite,
                                      size: 30,
                                      color: Color.fromARGB(255, 98, 0, 255),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '225',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ]),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        'Ahmed Hanafi',
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(width: 5),
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://upload.wikimedia.org/wikipedia/commons/a/a0/Andrzej_Person_Kancelaria_Senatu.jpg'),
                                        radius: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            post.description,
                            textDirection: TextDirection.ltr,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(7.0),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    color: Color.fromARGB(255, 253, 244, 244),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        post.youtube.isNotEmpty
                                            ? socialMediaPlatform(
                                                platform: 'youtube',
                                                url: post.youtube,
                                                context: context)
                                            : const SizedBox.shrink(),
                                        post.facebook.isNotEmpty
                                            ? socialMediaPlatform(
                                                platform: 'facebook',
                                                url: post.facebook,
                                                context: context)
                                            : const SizedBox.shrink(),
                                        post.linkedin.isNotEmpty
                                            ? socialMediaPlatform(
                                                platform: 'linkedin',
                                                url: post.linkedin,
                                                context: context)
                                            : const SizedBox.shrink(),
                                        post.vimeo.isNotEmpty
                                            ? socialMediaPlatform(
                                                platform: 'vimeo',
                                                url: post.vimeo,
                                                context: context)
                                            : const SizedBox.shrink(),
                                        post.github.isNotEmpty
                                            ? socialMediaPlatform(
                                                platform: 'github',
                                                url: post.github,
                                                context: context)
                                            : const SizedBox.shrink(),
                                        post.instagram.isNotEmpty
                                            ? socialMediaPlatform(
                                                platform: 'instagram',
                                                url: post.instagram,
                                                context: context)
                                            : const SizedBox.shrink(),
                                        post.tiktok.isNotEmpty
                                            ? socialMediaPlatform(
                                                platform: 'tiktok',
                                                url: post.tiktok,
                                                context: context)
                                            : const SizedBox.shrink(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                    ),
                  ],
                )
              : Column(
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
                          child: Column(
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://upload.wikimedia.org/wikipedia/commons/a/a0/Andrzej_Person_Kancelaria_Senatu.jpg'),
                                        radius: 20,
                                      ),
                                      SizedBox(width: 5),
                                      Text(
                                        'Ahmed Hanafi',
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Column(children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.favorite,
                                        size: 30,
                                        color: Color.fromARGB(255, 98, 0, 255),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '225',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ]),
                                )
                              ]),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            post.description ,
                            textDirection: TextDirection.rtl,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.all(7.0),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    color: Color.fromARGB(255, 253, 244, 244),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        post.youtube.isNotEmpty
                                            ? socialMediaPlatform(
                                                platform: 'youtube',
                                                url: post.youtube,
                                                context: context)
                                            : const SizedBox.shrink(),
                                        post.facebook.isNotEmpty
                                            ? socialMediaPlatform(
                                                platform: 'facebook',
                                                url: post.facebook,
                                                context: context)
                                            : const SizedBox.shrink(),
                                        post.linkedin.isNotEmpty
                                            ? socialMediaPlatform(
                                                platform: 'linkedin',
                                                url: post.linkedin,
                                                context: context)
                                            : const SizedBox.shrink(),
                                        post.vimeo.isNotEmpty
                                            ? socialMediaPlatform(
                                                platform: 'vimeo',
                                                url: post.vimeo,
                                                context: context)
                                            : const SizedBox.shrink(),
                                        post.github.isNotEmpty
                                            ? socialMediaPlatform(
                                                platform: 'github',
                                                url: post.github,
                                                context: context)
                                            : const SizedBox.shrink(),
                                        post.instagram.isNotEmpty
                                            ? socialMediaPlatform(
                                                platform: 'instagram',
                                                url: post.instagram,
                                                context: context)
                                            : const SizedBox.shrink(),
                                        post.tiktok.isNotEmpty
                                            ? socialMediaPlatform(
                                                platform: 'tiktok',
                                                url: post.tiktok,
                                                context: context)
                                            : const SizedBox.shrink(),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                    ),
                  ],
                ),
        ));
  }
}
