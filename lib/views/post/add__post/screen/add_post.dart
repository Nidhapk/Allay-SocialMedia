import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialmediaapp/controllers/providers/add_post_provider.dart';
import 'package:socialmediaapp/viewmodels/tag/tag_searcheduser_viewmodel.dart';
import 'package:socialmediaapp/views/post/widgets/appbar_inpostpage.dart';
import 'package:socialmediaapp/views/post/widgets/post_input_card.dart';
import 'package:socialmediaapp/views/user_auth/widget/custom_progressindicator.dart';

class AddPostScreen extends ConsumerWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final tagged = ref.watch(taggedFriendsProvider).taggedUsers;
    final image = ref.watch(imageProvider);
    final addpostState = ref.watch(addPostProvider);
    final addPostNotifier = ref.read(addPostProvider.notifier);
    TextEditingController descriptionController=TextEditingController();
    if (addpostState.isSuccess) {
      Future.microtask(
        () {
          Navigator.pushReplacementNamed(context, '/MainScreen');
          addPostNotifier
              .resetState(); // Reset state to avoid duplicate navigation
        },
      );
    }
    log('$tagged');
    return Scaffold(
      appBar: appBarInPostInputPage(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(height * 0.02),
            child: postInputCard(descriptionController: descriptionController,
              backgroundImage: image != null
                  ? FileImage(File(image.path))
                  : const AssetImage('assets/gallery.png'),buttonContent: addpostState.isLoading?customProgressIndicator():const Text('Share'),
              context: context,
              onAddImage: () {
                pickImage(ref);
              }, // to add image
              onTagFriends: () {
                Navigator.of(context).pushNamed('/tagSearchScreen');
              }, // to tag friends
              onSubmitPost: () {
                addPostNotifier.addPost(
                    context: context,
                    createdAt: DateTime.now(),
                    userId: FirebaseAuth.instance.currentUser!.email!,
                    description: descriptionController.text.trim(),
                    image: image,
                    taggedFriends: tagged);
              }, // to submit post
            ),
          )
        ],
      ),
    );
  }
}

// Function to pick an image
Future<void> pickImage(WidgetRef ref) async {
  final ImagePicker _picker = ImagePicker();
  try {
    // Pick an image from gallery
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Now, you can upload or process the image
      ref.read(imageProvider.notifier).state = image;
      log('Picked image path: ${image.path}');
    }
  } catch (e) {
    log('Error picking image: $e');
  }
}

final imageProvider = StateProvider<XFile?>((ref) => null);
