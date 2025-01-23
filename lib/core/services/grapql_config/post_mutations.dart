
import 'package:graphql_flutter/graphql_flutter.dart';

//to add a new post
final addNewPostMutation = gql(r'''
mutation AddPost(
  $created_at: timestamptz!,
  $description: String!,
  $image_url: String,
  $user_id: String!,
  $tagged_friends: [String],

) {
  insert_posts_one(
    object: {
      created_at: $created_at,
      description: $description,
      image_url: $image_url,
      tagged_friends: $tagged_friends,
      user_id: $user_id,
  
    }
  ) {
    description
    image_url
    user_id
    tagged_friends
  }
}
''');

//to update an post using primary_key(post_id)
final editPostMutation=gql(r'''mutation UpdatePostByPk(
  $post_id: Int!,
  $description: String,
  $image_url: String,
  $tagged_friends: [String!],
  $updated_at: timestamptz!
) {
  update_posts_by_pk(
    pk_columns: { post_id: $post_id },
    _set: {
      description: $description,
      image_url: $image_url,
      tagged_friends: $tagged_friends,
      updated_at: $updated_at
    }
  ) {
    post_id
    description
    image_url
    tagged_friends
    updated_at
  }
}
''');

//to delete a post
 final  deletePostMutation =gql( r'''
  mutation DeletePost($postId: Int!) {
    delete_posts_by_pk(post_id: $postId) {
      description
      image_url
      updated_at
    }
  }
  ''');

