import 'package:flutter/material.dart';

import 'online_submission.dart';

Widget socialMediaPlatform(
        {required String platform, required String url, context}) =>
    Row(
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            OnlineVideo(title: platform, website: url)));
              },
              child: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/$platform.png',
                ),
                radius: 25,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              platform,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(width: 15),
      ],
    );
