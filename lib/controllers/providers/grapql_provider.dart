
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:socialmediaapp/core/services/auth_services.dart';
import 'package:socialmediaapp/core/services/grapql_config/grapql_config.dart';

// final graphqlClientProvider = FutureProvider<GraphQLClient>((ref) async {
//   final firebaseToken = await ref.watch(firebaseTokenProvider.future);
//   return await GraphQlConfig().getGraphQLClient(firebaseToken?? '');
// });

final firebaseTokenProvider = FutureProvider<String?>((ref) async {
  return await AuthServices().getFirebaseToken();
});

ValueNotifier<GraphQLClient>
client () {
  return ValueNotifier((GraphQlConfig().getGraphQLClient()));
}
    
