import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socialmediaapp/controllers/providers/edit_post_provider.dart';
import 'package:socialmediaapp/views/post/add__post/screen/add_post.dart';
import 'package:socialmediaapp/views/post/widgets/post_input_card.dart';
import 'package:socialmediaapp/views/user_auth/widget/custom_progressindicator.dart';

class EditPost extends ConsumerStatefulWidget {
  final int postId;

  const EditPost({super.key, required this.postId});

  @override
  ConsumerState<EditPost> createState() => _EditPostState();
}

class _EditPostState extends ConsumerState<EditPost> {
  late TextEditingController descriptionController;

  @override
  void initState() {
    super.initState();
    descriptionController = TextEditingController();
    
    // Fetch post data when the page loads
    Future.microtask(() {
      ref.read(editPostProvider.notifier).fetchPostById(
            context: context,
            postId: widget.postId,
          );
    });
  }

  @override
  void dispose() {
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('${widget.postId}');
    final editPostState = ref.watch(editPostProvider);
    final editPostNotifier = ref.read(editPostProvider.notifier);

    // Populate description controller when the post data is fetched
    if (!editPostState.isLoading &&
        editPostState.fetchSuccess &&
        descriptionController.text != editPostState.description) {
      descriptionController.text = editPostState.description ?? '';
    }
    if (editPostState.isSuccess) {
      Future.microtask(
        () {
          editPostNotifier
              .resetState(); // Reset state to avoid duplicate navigation
          Navigator.pop(context);
          ref.read(editPostProvider.notifier).fetchPostById(
            context: context,
            postId: widget.postId,
          );

        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Post'),
      ),
      body: editPostState.isLoading
          ? Center(child: customProgressIndicator())
          : editPostState.errorMessage != null
              ? Center(
                  child: Text(
                    editPostState.errorMessage!,
                    style: const TextStyle(color: Colors.red),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: postInputCard(
                    context: context,
                    onAddImage: () {
                      // Implement image picker logic here
                      pickImage(ref);
                    },
                    onTagFriends: () {
                      // Navigate to tag friends page
                      Navigator.of(context).pushNamed('/tagSearchScreen');
                    },
                    onSubmitPost: () {
                      editPostNotifier.editPost(
                        context: context,
                        updatedAt: DateTime.now(),
                        postId: widget.postId, // Replace with actual user ID
                        description: descriptionController.text.trim(),
                        image: ref.watch(
                            imageProvider), // Add logic for image if applicable
                        taggedFriends: editPostState.taggedFriends,
                      );
                    },
                    backgroundImage: editPostState.imageUrl != null
                        ? NetworkImage(editPostState.imageUrl!)
                        : const AssetImage('assets/default_image.png')
                            as ImageProvider,
                    descriptionController: descriptionController,
                    buttonContent: editPostState.isLoading
                        ? customProgressIndicator()
                        : const Text('Update'),
                  ),
                ),
    );
  }
}
