import 'package:graphql_flutter/graphql_flutter.dart';

//to add userprofile
final addUserProfileMutation = gql(r'''
mutation AddUserProfile($email_id:String!,$firebase_uid:String!,$password:String!,$user_name:String!) {
  insert_user(objects: {email_id: $email_id, firebase_uid: $firebase_uid, password: $password, user_name: $user_name}) {
    returning {
      firebase_uid
    }
  }
}
''');

//to get userprofile by email_id
final getUserProfileQuery = gql(r'''query getUserByEmail($email_id:String!)  {
  user_by_pk(email_id:$email_id) {
    email_id
    user_profile
    user_name
  }
}
''');

//to get all users
final getAllUsersQuery = gql(r'''query GetAllUsers {
  user {
    user_id
    email_id
    user_name
    user_profile
  }
}''');

//to get searched users
final getSearchedUserQuery =
    gql(r''' query GetSearchedUsers($user_name:String!){
    user(where:{
     _or:{
       user_name:{
        _ilike:$user_name
       }
     }
    }
  ){
     user_profile
     user_name
     email_id
   }
  }''');

//to get followers of an user
final getFollowersQuery = gql(r'''query GetFollowers(
 $email_id:String!){
  followers(
    where:{
      followee_id: {
        _eq: $email_id
        }
      }
    ){
     follower_id
     }
 }''');

//to Get Following of an user
final getFollowingQuery = gql(r'''query GetFollowers(
 $email_id:String!){
  followers(
    where:{
      follower_id: {
        _eq: $email_id
        }
      }
    ){
     followee_id
     }
 }''');

//to get posts of user
final getPostsQuery = gql(r'''query Getposts($user_id:String!){
    posts(
      where:{
        user_id:{
          _eq:$user_id
        }
      }
    ) {
        description
        image_url
        tagged_friends
        created_at
        post_id
      }
    }
  '''
);
