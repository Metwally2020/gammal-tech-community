import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gammal_tech_community/screens/courses/coures_screens.dart';
import 'package:gammal_tech_community/services/data_models.dart';
import 'package:gammal_tech_community/services/firestore.dart';
import 'firebase_options.dart';
import 'screens/home_screen/english_home.dart';
import 'screens/home_screen/post_lang.dart';
import 'screens/login/login_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'screens/user_screens/profile.dart';
import 'screens/courses/coures_screens.dart';
import 'package:provider/provider.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // DioHelper.init();
  // DioHelper.getData(url: 'url', query: 'query');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      create: (BuildContext context) => FirestoreService().streamUser(),
      initialData: MyUser(),
      child: MaterialApp(
        
        // navigatorObservers: <NavigatorObserver>[observer],
      
        routes: {
          // '/':(context)=> Home(),
          '/courses':(context)=>const CoursesPage(),
          '/home':(context)=> PostLang(),
          // '/question':(context)=> QuestionPage(exerciseId),
          // '/exercises':(context)=> Excercises(),
          // '/lesson':(context)=> Lesson(courseId),
          // '/lesson':(context)=> Lesson(),
          '/profile':(context)=> Profile(),
          '/Login':(context)=>const LoginScreen(),
          
    
        },
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Colors.teal,
            elevation: 0,
          ),
          scaffoldBackgroundColor: Colors.white,
        ),
        home:  PostLang(),
      
        // localizationsDelegates: [
        //   GlobalCupertinoLocalizations.delegate,
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        // ],
        // supportedLocales: const [
        //   Locale('ar', 'AE'),
        //   Locale('ar', 'AE'), // OR Locale('ar', 'AE') OR Other RTL locales
        // ],
      ),
    );
  }
}
