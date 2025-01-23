import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:socialmediaapp/controllers/providers/grapql_provider.dart';
import 'package:socialmediaapp/views/home/screen/home.dart';
import 'package:socialmediaapp/views/main/screen/main_screen.dart';
import 'package:socialmediaapp/views/post/add__post/screen/add_post.dart';
import 'package:socialmediaapp/views/post/search_friends/screen/tag_search_screen.dart';
import 'package:socialmediaapp/views/profile/screen/profile_screen.dart';
import 'package:socialmediaapp/views/search/screen/search_screen.dart';
import 'package:socialmediaapp/views/splashscreen/screen/splash_screen.dart';
import 'package:socialmediaapp/views/user_auth/login/screen/login_screen.dart';
import 'package:socialmediaapp/views/user_auth/signup/screen/signup_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  //firebase setup
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBdoT-CpRTPYdyfPGpheBp4-3lXfCV6TCI",
      appId: "1:790350613842:android:dce8187f02da1bef5efe8b",
      messagingSenderId: "790350613842",
      projectId: "socialmedia-f933c",
      storageBucket: "socialmedia-f933c.firebasestorage.app",
    ),
  );
  
  //superbase setup
  
  await Supabase.initialize(
    url: 'https://yjqcdslmifksevawyezj.supabase.co',  // Your Supabase URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InlqcWNkc2xtaWZrc2V2YXd5ZXpqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU5NjMwMTYsImV4cCI6MjA1MTUzOTAxNn0.8tQHIITI1Q4WgZ9Mh8svzw-PqLKtCNk5rJ9N4HMaG2k',  // Your Supabase Anon key
  );
  

  runApp(const MyApp());
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final firebaseToken = ref.watch(firebaseTokenProvider.future);
    return ProviderScope(
      child: GraphQLProvider(
        client: client(),
        child: MaterialApp(
          title: 'Flutter Demo',
          onGenerateRoute: (settings) {
            switch (settings.name) {
              case '/HomeScreen':
                return MaterialPageRoute(builder: (_) => const HomeScreen());
              case '/AddPostScreen':
                return MaterialPageRoute(builder: (_) => const AddPostScreen());
              case '/SearchScreen':
                return MaterialPageRoute(builder: (_) => SearchScreen());
              case '/LoginScreen':
                return MaterialPageRoute(builder: (_) => LoginScreen());
              case '/SigUpScreen':
                return MaterialPageRoute(builder: (_) => SignUpScreen());
              case '/SplashScreen':
                return MaterialPageRoute(builder: (_) => const SplashScreen());
              case '/MainScreen':
                return MaterialPageRoute(builder: (_) => MainScreen());
              case '/ProfileScreen':
                return MaterialPageRoute(builder: (_) => const ProfileScreen());
              case '/tagSearchScreen':return MaterialPageRoute(builder: (_)=>TagSearchScreen());
              default:
                return MaterialPageRoute(builder: (_) => MainScreen());
            }
          },
          theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromARGB(255, 238, 237, 237),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: LoginScreen(),
        ),
      ),
    );
  }
}
