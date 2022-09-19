// import 'dart:js';

import 'package:flutter/material.dart';

import 'socialmedia_platform.dart';

Widget GammalTechEnglishSubmissionCard (context) => Container(
    padding: const EdgeInsets.all(5.0),
    constraints: const BoxConstraints(
      maxWidth: double.infinity,
    ),
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.all(3.0),
            padding: const EdgeInsets.symmetric(vertical: 14),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
              color: Color.fromARGB(255, 6, 78, 66),
            ),
            width: 80,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/a/a0/Andrzej_Person_Kancelaria_Senatu.jpg'),
                    radius: 25,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Gammal\nTech',
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  )
                ]),
          ),
          const SizedBox(width: 5),
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    socialMediaPlatform(platform: 'youtube',url: 'https://youtu.be/UV9P3Xecsuw',context: context),
                    socialMediaPlatform(platform: 'facebook',url: 'https://fb.watch/f1CbixH2QO/',context: context),
                    socialMediaPlatform(platform: 'linkedin',url: 'https://youtu.be/UV9P3Xecsuw',context: context),
                    socialMediaPlatform(platform: 'vimeo', url: 'https://youtu.be/UV9P3Xecsuw',context: context),
                    socialMediaPlatform(platform: 'github',url: 'https://youtu.be/UV9P3Xecsuw',context: context),
                  ],
                ),
              ),
            ),
          ),
         
        ],
      ),
    ));
