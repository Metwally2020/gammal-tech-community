// // import 'dart:js';

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:gammal_tech_community/services/data_models.dart';

// import 'socialmedia_platform.dart';

// Widget arabicsubmissionCard(context, submission) {
//   return Container(
//       padding: const EdgeInsets.all(5.0),
//       constraints: const BoxConstraints(
//         maxWidth: double.infinity,
//       ),
//       child: Center(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Column(children: [
//               IconButton(
//                 onPressed: () {},
//                 icon: Icon(
//                   Icons.favorite,
//                   size: 30,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               Text(
//                 '225',
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ]),
//             const SizedBox(width: 5),
//             const SizedBox(width: 5),
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.all(7.0),
//                 padding: const EdgeInsets.all(10.0),
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(10.0),
//                   ),
//                   color: Color.fromARGB(255, 253, 244, 244),
//                 ),
//                 child: SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   // dragStartBehavior:  DragStartBehavior.start,
//                   physics: const BouncingScrollPhysics(),
//                   reverse: true,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       submission!.youtube.isNotEmpty
//                           ? socialMediaPlatform(
//                               platform: 'youtube',
//                               url: submission!.youtube,
//                               context: context)
//                           : const SizedBox.shrink(),
//                       submission!.facebook.isNotEmpty
//                           ? socialMediaPlatform(
//                               platform: 'facebook',
//                               url: submission!.facebook,
//                               context: context)
//                           : const SizedBox.shrink(),
//                       submission!.linkedin.isNotEmpty
//                           ? socialMediaPlatform(
//                               platform: 'linkedin',
//                               url: submission!.linkedin,
//                               context: context)
//                           : const SizedBox.shrink(),
//                       submission!.vimeo.isNotEmpty
//                           ? socialMediaPlatform(
//                               platform: 'vimeo',
//                               url: submission!.vimeo,
//                               context: context)
//                           : const SizedBox.shrink(),
//                       submission!.github.isNotEmpty
//                           ? socialMediaPlatform(
//                               platform: 'github',
//                               url: submission!.github,
//                               context: context)
//                           : const SizedBox.shrink(),
//                       submission!.instagram.isNotEmpty
//                           ? socialMediaPlatform(
//                               platform: 'instagram',
//                               url: submission!.instagram,
//                               context: context)
//                           : const SizedBox.shrink(),
//                       submission!.tiktok.isNotEmpty
//                           ? socialMediaPlatform(
//                               platform: 'tiktok',
//                               url: submission!.tiktok,
//                               context: context)
//                           : const SizedBox.shrink(),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             Container(
//               margin: const EdgeInsets.all(3.0),
//               padding: const EdgeInsets.symmetric(vertical: 14),
//               decoration: const BoxDecoration(
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(10.0),
//                 ),
//                 color: Color.fromARGB(255, 6, 78, 66),
//               ),
//               width: 80,
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: const [
//                     CircleAvatar(
//                       backgroundImage: NetworkImage(
//                           'https://upload.wikimedia.org/wikipedia/commons/a/a0/Andrzej_Person_Kancelaria_Senatu.jpg'),
//                       radius: 25,
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       'Ahmed Hanafi',
//                       textAlign: TextAlign.center,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: TextStyle(color: Colors.white, fontSize: 14),
//                     )
//                   ]),
//             ),
//           ],
//         ),
//       ));
// }
