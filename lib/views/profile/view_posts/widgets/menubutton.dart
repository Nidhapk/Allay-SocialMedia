import 'dart:async';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:socialmediaapp/core/services/grapql_config/post_mutations.dart';
import 'package:socialmediaapp/views/post/edit_post/screen/edit_post_screen.dart';
import 'package:socialmediaapp/views/profile/view_posts/widgets/alertbox.dart';

class MenuButton extends StatelessWidget {
  final int postId;
  final VoidCallback onCompleted;
  const MenuButton(
      {super.key, required this.postId, required this.onCompleted});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      onSelected: (String result) {
        // Handle the selection (Edit or Delete)
        if (result == 'edit') {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditPost(
                    postId: postId,
                  )));
          // Call edit function
        } else if (result == 'delete') {
          // Call delete function
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Mutation(
                options: MutationOptions(
                  document: deletePostMutation,
                  onCompleted: (dynamic resultData) {
                    Navigator.of(context).pop(); // Close the dialog
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Post deleted successfully'),
                      ),
                    );
                    onCompleted();
                  },
                  onError: (error) {
                    Navigator.of(context).pop(); // Close the dialog
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error deleting post'),
                      ),
                    );
                  },
                ),
                builder: (RunMutation runMutation, QueryResult? result) {
                  return CustomAlertDialog(
                    title: "Confirm Delete",
                    content: "Are you sure you want to delete this post?",
                    okText: 'Delete',
                    onOkPressed: () {
                      runMutation({"postId": postId}); // Execute mutation
                    },
                    onCancelPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                  );
                },
              );
            },
          );
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'edit',
          child: Text('Edit'),
        ),
        const PopupMenuItem<String>(
          value: 'delete',
          child: Text('Delete'),
        ),
      ],
      icon: const Icon(Icons.more_vert), // Menu icon
    );
  }
}
