import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialmediaapp/core/services/grapql_config/post_mutations.dart';
import 'package:socialmediaapp/core/services/upload_img_to_superbase/image_services.dart';
import 'package:socialmediaapp/viewmodels/states/login_state.dart';

class AddPostNotifier extends StateNotifier<LoginState> {
  AddPostNotifier() : super(LoginState.initial());

  Future<void> addPost(
      {required BuildContext context,
      required DateTime createdAt,
      required String userId,
      required String description,
      XFile? image,
      List<String>? taggedFriends}) async {
    state = state.copyWith(
      isLoading: true,
      errorMessage: null,
      isSuccess: false,
    );

    try {
      log('$image');
      final imageUrl = image != null
          ? await SuperbaseServices().uploadImageToSupabase(image)
          : '';
      final client = GraphQLProvider.of(context).value;
      final mutationOptions =
          MutationOptions(document: addNewPostMutation, variables: {
        'created_at': createdAt.toIso8601String(),
        'user_id': userId,
        'description': description,
        'image_url': imageUrl,
        'tagged_friends': taggedFriends ?? []
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
    state = LoginState.initial();
  }
}

final addPostProvider =
    StateNotifierProvider<AddPostNotifier, LoginState>((ref) {
  return AddPostNotifier();
});
