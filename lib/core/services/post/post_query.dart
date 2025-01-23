import 'package:graphql_flutter/graphql_flutter.dart';

class PostQuery {
  //to fetch all posts of current user

  final getPostsByuserId = gql(r'''query GetPostsByUser($user_id: String!) {
    posts(where: {
      user_id: {
        _eq: $user_id 
      } 
    }
  ) {
        id
        description
        image_url
        tagged_friends
        created_at
        updated_at
      }
    }''');

//to fetch the posts of friends

  final getPostsOfFriendsQuery = gql(r'''query GetFolloweesPost{
  posts(
    where: {
      user_id: { 
        _in: 
          ["kk@gmail.com"]
      }
    }
  ) {
    post_id
    description
    image_url
    tagged_friends
    created_at
    updated_at
    user_id
    
  }
}
''');

//to fetch post by post_id
  final GetPostByPostId = gql(r'''
query getPostByPK($post_id:Int!) {
  posts_by_pk(post_id: $post_id) {
    created_at
    description
    image_url
    post_id
    tagged_friends
    updated_at
    user_id
  }
}''');
}
