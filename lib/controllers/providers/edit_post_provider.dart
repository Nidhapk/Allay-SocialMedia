import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialmediaapp/core/services/grapql_config/post_mutations.dart';
import 'package:socialmediaapp/core/services/post/post_query.dart';
import 'package:socialmediaapp/core/services/upload_img_to_superbase/image_services.dart';
import 'package:socialmediaapp/viewmodels/states/edit_post_states.dart';


class EditPostNotifier extends StateNotifier<EditPostState> {
  EditPostNotifier() : super(EditPostState.initial());

  Future fetchPostById({required BuildContext context, required int postId}) async {
    final client = GraphQLProvider.of(context).value;
    final query = QueryOptions(
      document: PostQuery().GetPostByPostId,
      variables: {'post_id': postId},
    );

    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      isSuccess: false,
      fetchSuccess: false
    
    );
    try {
      final result = await client.query(query);
      if (result.hasException) {
        log('${result.exception}');
        throw Exception(result.exception.toString());
      }
      final post = result.data?['posts_by_pk'];
    if (post != null) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,fetchSuccess: true,
        description: post['description'],
        imageUrl: post['image_url'],
        taggedFriends: List<String>.from(post['tagged_friends'] ?? []),
        errorMessage: null,
      );
    }
  } catch (e) {
    state = state.copyWith(
      isLoading: false,
      isSuccess: false,
      fetchSuccess: false,
      errorMessage: e.toString(),
    );
  }
  }

  Future<void> editPost(
      {required BuildContext context,
      required int postId,
      required DateTime updatedAt,

      required String description,
      XFile? image,
      List<String>? taggedFriends}) async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      isSuccess: false,
      fetchSuccess: false
    );

    try {
      final imageUrl = image != null
          ? await SuperbaseServices().uploadImageToSupabase(image)
          : '';
      final client = GraphQLProvider.of(context).value;
      final mutationOptions =
          MutationOptions(document:editPostMutation, variables: {
        'updated_at': updatedAt.toIso8601String(),
        'description': description,
        'image_url': imageUrl??state.imageUrl,
        'tagged_friends': taggedFriends ?? [],'post_id':postId
      });
      final result = await client.mutate(mutationOptions);
      if (result.hasException) {
        log('${result.exception}');
        throw Exception(result.exception.toString());
      }
      state = state.copyWith(
        isLoading: false,
        isSuccess: true,
        errorMessage: null,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  void resetState() {
    state = EditPostState.initial();
  }
}

final editPostProvider =
    StateNotifierProvider<EditPostNotifier, EditPostState>((ref) {
  return EditPostNotifier();
});
