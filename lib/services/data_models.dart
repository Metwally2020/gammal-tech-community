// import 'package:json_serializable/json_serializable.dart';
// import 'package:analyzer/dart/analysis/analysis_context.dart';
import 'package:json_annotation/json_annotation.dart';
part 'data_models.g.dart';

// @JsonSerializable()
// class Profile {
//   final String uid;
//   String name = 'gammaltech_profile';
//   final int age;
//   final int posts;
//   final int submissions;
//   final int likes;
//   final int questions;
//   final int answers;
//   final int excercises;
//   bool potentialInstructor = false;
//   bool instructor = false;
//   String? youtube, facebook, linkedin, github;
//   Profile({
//     this.uid ='',
//     this.name = '',
//     this.age = 0,
//     this.posts = 0,
//     this.submissions = 0,
//     this.likes = 0,
//     this.questions = 0,
//     this.answers = 0,
//     this.excercises = 0,
//     this.potentialInstructor = false,
//     this.instructor = false,
//     this.github = '',
//   });

//   factory Profile.fromJson(Map<String,dynamic> json) => _$ProfileFromJson(json);
//   Map <String,dynamic> toJson() =>  _$ProfileToJson(this);
//
// }

@JsonSerializable()
class MyUser {
  final String uid;
  String name = 'gammaltech_user';
  final int age;
  final String img;
  final List<String> posts;
  final List<String> submissions;
  final List<String> likes;
  final List<String> questions;
  final List<String> answers;
  final List<String> excercises;
  bool potentialInstructor = false;
  bool instructor = false;
  String? youtube, facebook, linkedin, github;
  MyUser({
    this.uid = '',
    this.name = '',
    this.age = 20,
    this.img ='',
    this.posts = const[],
    this.submissions = const[],
    this.likes = const[],
    this.questions = const[],
    this.answers = const[],
    this.excercises = const[],
    this.potentialInstructor = false,
    this.instructor = false,
    this.github = '',
  });

  factory MyUser.fromJson(Map<String, dynamic>? json) => _$MyUserFromJson(json);
  Map<String, dynamic> ? toJson() => _$MyUserToJson(this);
}

@JsonSerializable()
class Post {
  final String uid;
  final String postId;
  final String lang;
  final String description;
  final String youtube;
  final String facebook;
  final String linkedin;
  final String vimeo;
  final String github;
  final String instagram;
  final String tiktok;
  final List<MyUser> likedBy;

  Post({
    this.uid = 'Gammal Tech User',
    this.postId = 'Gammal Tech post',
    this.lang = 'en',
    this.description = 'no description',
    this.facebook = '',
    this.linkedin = '',
    this.youtube = '',
    this.vimeo = '',
    this.github = '',
    this.instagram = '',
    this.tiktok = '',
    this.likedBy = const [],
  });
  factory Post.fromJson(Map<String, dynamic> ?json) => _$PostFromJson(json);
  Map<String, dynamic> ?toJson() => _$PostToJson(this);
}

@JsonSerializable()
class CoursesBundle {
  final String bundleName;
  final List<Course> courses;
  CoursesBundle({
    this.bundleName = 'c programming',
    this.courses = const [],
  });
  
  factory CoursesBundle.fromJson(Map<String, dynamic> ?json) => _$CoursesBundleFromJson(json);
  Map<String, dynamic> ?toJson() => _$CoursesBundleToJson(this);

}

@JsonSerializable()
class Course {
  final String img;
  final String name;
  // final List<Lesson> lessons;
  Course({
    this.img = 'flutter.jpg',
    this.name = 'c programming',
    // this.lessons = const [],
  });
  
  factory Course.fromJson(Map<String, dynamic> ?json) => _$CourseFromJson(json);
  Map<String, dynamic> ?toJson() => _$CourseToJson(this);

}

@JsonSerializable()
class LessonList {
  final String courseName;
  final List<Lesson> lessons;

  LessonList({
    this.courseName = '',
    this.lessons = const [],
  });
  factory LessonList.fromJson(Map<String, dynamic> ?json) => _$LessonListFromJson(json);
  Map<String, dynamic> ?toJson() => _$LessonListToJson(this);
  
}
@JsonSerializable()
class Lesson {
  final String name;
  final int number;
  // final List<Exercise> excercise;

  Lesson({
    this.name = '',
    this.number = 1,
    // this.excercise = const [],
  });
  factory Lesson.fromJson(Map<String, dynamic> ?json) => _$LessonFromJson(json);
  Map<String, dynamic> ?toJson() => _$LessonToJson(this);
  
}

@JsonSerializable()
class Exercise {
  final String lessonName;
  final String lang;
  final String author;
  final Submission? gammalTechSubmission;
  final String exerciseBody;
  final String exerciseId;
  final List<Submission> submissons;
  final List<MyUser> likedBy;
  final int type;
  Exercise({
    this.gammalTechSubmission ,
    this.lessonName ='',
    this.type= 1, 
    this.lang= 'en', 
    this.likedBy = const [],
    this.submissons = const [],
    this.author= 'gammal tech',
    this.exerciseBody = 'some question',
    this.exerciseId = 'some id',
  });
  factory Exercise.fromJson(Map<String, dynamic> ?json) =>
      _$ExerciseFromJson(json);
  Map<String, dynamic> ?toJson() => _$ExerciseToJson(this);

}


@JsonSerializable()
class Submission {
  final String uid;
  final String facebook;
  final String youtube;
  final String linkedin;
  final String vimeo;
  final String github;
  final String instagram;
  final String tiktok;
  final int likes = 0;
  Submission({
    this.uid = 'Gammal Tech User',
    this.facebook = '',
    this.youtube = '',
    this.linkedin = '',
    this.vimeo = '',
    this.github = '',
    this.instagram = '',
    this.tiktok = '',
  });
  factory Submission.fromJson(Map<String, dynamic> ?json) =>
      _$SubmissionFromJson(json);
  Map<String, dynamic> ?toJson() => _$SubmissionToJson(this);

}
