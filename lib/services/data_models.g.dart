// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyUser _$MyUserFromJson(Map<String, dynamic>? json) => MyUser(
      uid: json!['uid'] as String? ?? '',
      name: json['name'] as String? ?? '',
      age: json['age'] as int? ?? 20,
      img: json['img'] as String? ?? '',
      posts:
          (json['posts'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      submissions: (json['submissions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      likes:
          (json['likes'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      questions: (json['questions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      answers: (json['answers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      excercises: (json['excercises'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      potentialInstructor: json['potentialInstructor'] as bool? ?? false,
      instructor: json['instructor'] as bool? ?? false,
      github: json['github'] as String? ?? '',
    )
      ..youtube = json['youtube'] as String?
      ..facebook = json['facebook'] as String?
      ..linkedin = json['linkedin'] as String?;

Map<String, dynamic>? _$MyUserToJson(MyUser instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'age': instance.age,
      'img': instance.img,
      'posts': instance.posts,
      'submissions': instance.submissions,
      'likes': instance.likes,
      'questions': instance.questions,
      'answers': instance.answers,
      'excercises': instance.excercises,
      'potentialInstructor': instance.potentialInstructor,
      'instructor': instance.instructor,
      'youtube': instance.youtube,
      'facebook': instance.facebook,
      'linkedin': instance.linkedin,
      'github': instance.github,
    };

Post _$PostFromJson(Map<String, dynamic>? json) => Post(
      uid: json!['uid'] as String? ?? 'Gammal Tech User',
      postId: json['postId'] as String? ?? 'Gammal Tech post',
      lang: json['lang'] as String? ?? 'en',
      description: json['description'] as String? ?? 'no description',
      facebook: json['facebook'] as String? ?? '',
      linkedin: json['linkedin'] as String? ?? '',
      youtube: json['youtube'] as String? ?? '',
      vimeo: json['vimeo'] as String? ?? '',
      github: json['github'] as String? ?? '',
      instagram: json['instagram'] as String? ?? '',
      tiktok: json['tiktok'] as String? ?? '',
      likedBy: (json['likedBy'] as List<dynamic>?)
              ?.map((e) => MyUser.fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
    );

Map<String, dynamic>? _$PostToJson(Post instance) => <String, dynamic>{
      'uid': instance.uid,
      'postId': instance.postId,
      'lang': instance.lang,
      'description': instance.description,
      'youtube': instance.youtube,
      'facebook': instance.facebook,
      'linkedin': instance.linkedin,
      'vimeo': instance.vimeo,
      'github': instance.github,
      'instagram': instance.instagram,
      'tiktok': instance.tiktok,
      'likedBy': instance.likedBy,
    };

CoursesBundle _$CoursesBundleFromJson(Map<String, dynamic>? json) =>
    CoursesBundle(
      bundleName: json!['bundleName'] as String? ?? 'c programming',
      courses: (json['courses'] as List<dynamic>?)
              ?.map((e) => Course.fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
    );

Map<String, dynamic>? _$CoursesBundleToJson(CoursesBundle instance) =>
    <String, dynamic>{
      'bundleName': instance.bundleName,
      'courses': instance.courses,
    };

Course _$CourseFromJson(Map<String, dynamic>? json) => Course(
      img: json!['img'] as String? ?? 'flutter.jpg',
      name: json['name'] as String? ?? 'c programming',
    );

Map<String, dynamic>? _$CourseToJson(Course instance) => <String, dynamic>{
      'img': instance.img,
      'name': instance.name,
    };

LessonList _$LessonListFromJson(Map<String, dynamic>? json) => LessonList(
      courseName: json!['courseName'] as String? ?? '',
      lessons: (json['lessons'] as List<dynamic>?)
              ?.map((e) => Lesson.fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
    );

Map<String, dynamic>? _$LessonListToJson(LessonList instance) =>
    <String, dynamic>{
      'courseName': instance.courseName,
      'lessons': instance.lessons,
    };

Lesson _$LessonFromJson(Map<String, dynamic>? json) => Lesson(
      name: json!['name'] as String? ?? '',
      number: json['number'] as int? ?? 1,
    );

Map<String, dynamic>? _$LessonToJson(Lesson instance) => <String, dynamic>{
      'name': instance.name,
      'number': instance.number,
    };

Exercise _$ExerciseFromJson(Map<String, dynamic>? json) => Exercise(
      gammalTechSubmission: json!['gammalTechSubmission'] == null
          ? null
          : Submission.fromJson(
              json['gammalTechSubmission'] as Map<String, dynamic>?),
      lessonName: json['lessonName'] as String? ?? '',
      type: json['type'] as int? ?? 1,
      lang: json['lang'] as String? ?? 'en',
      // likedBy: (json['likedBy'] as List<dynamic>?)
      //         ?.map((e) => MyUser.fromJson(e as Map<String, dynamic>?))
      //         .toList() ??
      //     const [],
      submissons: (json['submissons'] as List<dynamic>?)
              ?.map((e) => Submission.fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
      author: json['author'] as String? ?? 'gammal tech',
      exerciseBody: json['exerciseBody'] as String? ?? 'some question',
      exerciseId: json['exerciseId'] as String? ?? 'some id',
    );

Map<String, dynamic>? _$ExerciseToJson(Exercise instance) => <String, dynamic>{
      'lessonName': instance.lessonName,
      'lang': instance.lang,
      'author': instance.author,
      'gammalTechSubmission': instance.gammalTechSubmission,
      'exerciseBody': instance.exerciseBody,
      'exerciseId': instance.exerciseId,
      'submissons': instance.submissons,
      'likedBy': instance.likedBy,
      'type': instance.type,
    };

Submission _$SubmissionFromJson(Map<String, dynamic>? json) => Submission(
      uid: json!['uid'] as String? ?? 'Gammal Tech User',
      facebook: json['facebook'] as String? ?? '',
      youtube: json['youtube'] as String? ?? '',
      linkedin: json['linkedin'] as String? ?? '',
      vimeo: json['vimeo'] as String? ?? '',
      github: json['github'] as String? ?? '',
      instagram: json['instagram'] as String? ?? '',
      tiktok: json['tiktok'] as String? ?? '',
    );

Map<String, dynamic>? _$SubmissionToJson(Submission instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'facebook': instance.facebook,
      'youtube': instance.youtube,
      'linkedin': instance.linkedin,
      'vimeo': instance.vimeo,
      'github': instance.github,
      'instagram': instance.instagram,
      'tiktok': instance.tiktok,
    };
