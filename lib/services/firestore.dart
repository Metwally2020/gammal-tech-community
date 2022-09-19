import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gammal_tech_community/screens/home_screen/post_lang.dart';
import 'package:rxdart/rxdart.dart';
import '../screens/courses/3_exercises.dart';
import 'auth.dart';
import 'data_models.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  String? path;
  CollectionReference? ref;

  Stream<MyUser> streamUser() {
    return AuthService().userStram.switchMap((user) {
      if (user != null) {
        var ref = _db.collection('users').doc(user.uid);
        return ref.snapshots().map((doc) => MyUser.fromJson(doc.data()!));
      } else {
        return Stream.fromIterable([MyUser()]);
      }
    });
  }

  //   Future<List<MyUser>> getUser(userId) async {
  //   ref = _db.collection('users');
  //   var snapshot = await ref!.get();
  //   var data = snapshot.docs.map((e) => e.data());
  //   var users = data.map((d) => MyUser.fromJson(d as Map<String, dynamic>));
  //   return users.toList();
  // }

  Future<MyUser> getSingleUser({uid}) async {
    var docRef = _db.collection('lesson').doc(uid);
    var snapshot = await docRef.get();
    return MyUser.fromJson(snapshot.data() ?? {});
  }

  Future<List<Post>> getPosts(lang) async {
    ref = _db.collection('posts');
    var snapshot = await ref!.where('lang', isEqualTo: lang).get();
    var data = snapshot.docs.map((e) => e.data());
    var posts = data.map((d) => Post.fromJson(d as Map<String, dynamic>));
    return posts.toList();
  }

  Future<List<CoursesBundle>> getCoursesBundle() async {
    ref = _db.collection('course bundle');
    var snapshot = await ref!.get();
    var data = snapshot.docs.map((e) => e.data());
    var coursesBundle =
        data.map((d) => CoursesBundle.fromJson(d as Map<String, dynamic>));
    return coursesBundle.toList();
  }

  // Future<List<Course>> getCourse() async {
  //   ref = _db.collection('courses');
  //   var snapshot = await ref!.get();
  //   var data = snapshot.docs.map((e) => e.data());
  //   var courses = data.map((d) => Course.fromJson(d as Map<String, dynamic>));
  //   return courses.toList();
  // }

  Future<LessonList> getLessonList({courseName}) async {
    var docRef = _db.collection('lesson').doc(courseName);
    var snapshot = await docRef.get();
    return LessonList.fromJson(snapshot.data() ?? {});
  }

  Future<List<Exercise>> getExercises({type, lang, lessonName}) async {
    ref = _db.collection('exercises');
    var snapshot = await ref!
        .where('lessonName', isEqualTo: lessonName)
        .where('type', isEqualTo: type)
        .where('lang', isEqualTo: lang)
        .get();
    var data = snapshot.docs.map((e) => e.data());
    var excercises =
        data.map((d) => Exercise.fromJson(d as Map<String, dynamic>));
    return excercises.toList();
  }

  Future<List<Exercise>> getUserExercises({type, uid, lessonName}) async {
    ref = _db.collection('exercises');
    var snapshot = await ref!
        .where('lessonName', isEqualTo: lessonName)
        .where('type', isEqualTo: type)
        .where('author', isEqualTo: uid)
        .get();
    var data = snapshot.docs.map((e) => e.data());
    var excercises =
        data.map((d) => Exercise.fromJson(d as Map<String, dynamic>));
    return excercises.toList();
  }

  Future<List<Exercise>> getGammalTechExercises(
      {type, lang, lessonName}) async {
    DocumentSnapshot exerciseId;
    ref = _db.collection('gammal tech exercises');
    var snapshot = await ref!
        .where('lesson', isEqualTo: lessonName)
        .where('type', isEqualTo: type)
        .where('lang', isEqualTo: lang)
        .get();
    var data = snapshot.docs.map((e) => e.data());
    var excercises =
        data.map((d) => Exercise.fromJson(d as Map<String, dynamic>));
    return excercises.toList();
  }

  Future<List<Submission>> getSubmissons({required exerciseId}) async {
    ref = _db
        .collection('exercises')
        .doc('$exerciseId')
        .collection('submissions');
    var snapshot = await ref!.get();
    var data = snapshot.docs.map((e) => e.data());
    var submissions =
        data.map((d) => Submission.fromJson(d as Map<String, dynamic>));
    return submissions.toList();
  }

  Future<Submission> getUserSubmissons({required exerciseId, uid}) async {
    var docRef = _db
        .collection('exercises')
        .doc('$exerciseId')
        .collection('submissions')
        .doc(uid);
    var snapshot = await docRef.get();
    return Submission.fromJson(snapshot.data() ?? {});
    // ref = _db
    //     .collection('exercises')
    //     .doc('$exerciseId')
    //     .collection('submissions');
    // var snapshot = await ref!.get();
    // var data = snapshot.docs.map((e) => e.data());
    // var submissions =
    //     data.map((d) => Submission.fromJson(d as Map<String, dynamic>));
    // return submissions.toList();
  }

  Stream<Post> userPosts() {
    return AuthService().userStram.switchMap((user) {
      if (user != null) {
        var ref = _db.collection('posts').doc(user.uid);
        return ref.snapshots().map((doc) => Post.fromJson(doc.data()!));
      } else {
        return Stream.fromIterable([Post()]);
      }
    });
  }

  Future<void> updateUserProfileWhenAddingPost(Post post) {
    var user = AuthService().user;
    var ref = _db.collection('users').doc(user?.uid);

    var data = {
      'posts_number': FieldValue.increment(1),
      'posts': {
        post: FieldValue.arrayUnion([post.uid])
      }
    };

    return ref.set(data, SetOptions(merge: true));
  }

  addCourse({context, img, name}) async {
    ref = _db.collection('courses');
    var snapshot =
        await ref!.add(Course(img: img, name: name).toJson()).then((value) {
      AwesomeDialog(
          showCloseIcon: true,
          context: context,
          title: 'Success',
          body: const Text(
            'Course Added\n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )).show();
      Navigator.of(context).pushReplacementNamed('/courses');
    }).catchError((error) {
      AwesomeDialog(
          showCloseIcon: true,
          context: context,
          title: 'Error',
          body: Text(
            'Failed to add Course: $error\n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )).show();
    });
  }

  addPost(
      {context,
      description,
      lang,
      facebook,
      youtube,
      linkedin,
      vimeo,
      github,
      instagram,
      tiktok,
      uid}) async {
    ref = _db.collection('posts');
    var snapshot = await ref!
        .add(Post(
      uid: uid,
      description: description,
      facebook: facebook,
      github: github,
      instagram: instagram,
      lang: lang,
      linkedin: linkedin,
      tiktok: tiktok,
      vimeo: vimeo,
      youtube: youtube,
    ).toJson())
        .then((value) {
      final addingExerxiseId = _db.collection('posts').doc(value.id);
      addingExerxiseId.update({'postId': value.id}).then(
          (value) => print("DocumentSnapshot successfully updated!"),
          onError: (e) => print("Error updating document $e"));

      AwesomeDialog(
          showCloseIcon: true,
          context: context,
          title: 'Success',
          body: const Text(
            'Post Added\n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )).show();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PostLang(
                    lang: lang == 'ar' ? 1 : 0,
                  )));
    }).catchError((error) {
      AwesomeDialog(
          showCloseIcon: true,
          context: context,
          title: 'Error',
          body: Text(
            'Failed to add The Post: $error\n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )).show();
    });
  }

  addLesson(
    context,
    name,
  ) async {
    ref = _db.collection('course Post');
    var snapshot = await ref!
        .add(Lesson(
      name: name,
    ).toJson())
        .then((value) {
      AwesomeDialog(
          showCloseIcon: true,
          context: context,
          title: 'Success',
          body: const Text(
            'Post Added\n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )).show();
      Navigator.of(context).pushReplacementNamed('/home');
    }).catchError((error) {
      AwesomeDialog(
          showCloseIcon: true,
          context: context,
          title: 'Error',
          body: Text(
            'Failed to add The Post: $error\n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )).show();
    });
  }

  addExercise({type, lang, lessonName, context, newExercise, author}) async {
    ref = _db.collection('exercises');
    var snapshot = await ref!
        .add(Exercise(
                lang: lang,
                exerciseBody: newExercise,
                type: type,
                lessonName: lessonName,
                author: author)
            .toJson())
        .then((value) {
      final addingExerxiseId = _db.collection('exercises').doc(value.id);
      addingExerxiseId.update({'exerciseId': value.id}).then(
          (value) => print("DocumentSnapshot successfully updated!"),
          onError: (e) => print("Error updating document $e"));

      AwesomeDialog(
          showCloseIcon: true,
          context: context,
          title: 'Success',
          body: const Text(
            'Exercise Added\n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )).show();

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Exercises(
                    lessonName: lessonName,
                    type: type,
                    author: author,
                  )));
    }).catchError((error) {
      AwesomeDialog(
          showCloseIcon: true,
          context: context,
          title: 'Error',
          body: Text(
            'Failed to add The Exercise: $error\n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )).show();
    });
  }

  addSubmission(
      {context,
      facebook,
      youtube,
      vimeo,
      github,
      linkedin,
      instagram,
      tiktok,
      uid}) async {
    ref = _db.collection('course Post');
    var snapshot = await ref!
        .doc(uid)
        .set(Submission(
                facebook: facebook,
                youtube: youtube,
                linkedin: linkedin,
                vimeo: vimeo,
                github: github,
                tiktok: tiktok,
                instagram: instagram,
                uid: uid)
            .toJson())
        .then((value) {
      AwesomeDialog(
          showCloseIcon: true,
          context: context,
          title: 'Success',
          body: const Text(
            'Post Added\n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )).show();
      Navigator.of(context).pushReplacementNamed('/home');
    }).catchError((error) {
      AwesomeDialog(
          showCloseIcon: true,
          context: context,
          title: 'Error',
          body: Text(
            'Failed to add The Post: $error\n',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          )).show();
    });
  }
}
