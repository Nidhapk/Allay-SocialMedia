import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialmediaapp/viewmodels/profile/profile_grid_viewmodel.dart';
import 'package:socialmediaapp/viewmodels/profile/user_container_viewmodel.dart';
import 'package:socialmediaapp/views/home/widgets/sizedbox30.dart';
import 'package:socialmediaapp/views/profile/widgets/gradient_button.dart';

import 'package:socialmediaapp/views/profile/widgets/sizedbox50.dart';
import 'package:socialmediaapp/views/profile/widgets/user_stats.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(
          height * 0.02,
        ),
        children: [
          sizedbx50(
            context: context,
          ),
          userDetailsViewModel(
            context: context,
          ), //user profile,username & email

          sizedbox30(
            context: context,
          ),

          userStats(
            emailId: FirebaseAuth.instance.currentUser?.email ?? '',
            context: context,
          ), // no.of followers,following & posts

          sizedbox30(
            context: context,
          ),
          
          gradientButton(
            child: const Text('Edit Profile'),
            onPressed: () {},
          ), //botton for editing the user profile

          postGridViewModel(context: context, )
           //all posts of the user
        ],
      ),
    );
  }
}
