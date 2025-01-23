import 'package:graphql_flutter/graphql_flutter.dart';


class GraphQlConfig {

  GraphQLClient getGraphQLClient() {
  

  final HttpLink httpLink = HttpLink(
    "https://social-media-01.hasura.app/v1/graphql",
    defaultHeaders: {
      'x-hasura-admin-secret': 'KinIdu81hFunIMVzJLs2H8NIaDYKPIWA9wl8NVcLQeLtBML5L5HWy4I3okicwSbi',
    },
  );

  return GraphQLClient(
    link: httpLink,
    cache: GraphQLCache()
  );
}
}



