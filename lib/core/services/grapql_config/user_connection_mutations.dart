import 'package:graphql_flutter/graphql_flutter.dart';

//to follow an user
final followUserMutation = gql(r'''
  mutation FollowUser($followee_id: String!, $follower_id: String!) {
    insert_followers_one(
      object: {
        followee_id: $followee_id,
        follower_id: $follower_id
      }
    ) {
      id
    }
  }
''');

//to unfollow an user
final unfollowUserMutation = gql(r'''
  mutation UnfollowUser($current_userid: String!, $friend_id: String!) {
    delete_followers(
      where: {
        _and: [
          { follower_id: { _eq: $current_userid } }
          { followee_id: { _eq: $friend_id } }
        ]
      }
    ) {
      returning {
        id
      }
    }
  }
''');
