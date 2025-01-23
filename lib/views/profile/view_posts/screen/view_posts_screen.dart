import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:socialmediaapp/core/constants/app_textstyles.dart';
import 'package:socialmediaapp/core/services/grapql_config/user_profile_mutations.dart';
import 'package:socialmediaapp/views/home/widgets/post_container.dart';
import 'package:socialmediaapp/views/profile/view_posts/widgets/menubutton.dart';
import 'package:socialmediaapp/views/shimmers/post/post_buulder_shimmer.dart';

class ViewPostScreen extends StatefulWidget {
  final int index;
  const ViewPostScreen({super.key, required this.index});

  @override
  State<ViewPostScreen> createState() => _ViewPostScreenState();
}

final ItemScrollController itemScrollController = ItemScrollController();
final ItemPositionsListener itemPositionsListener =
    ItemPositionsListener.create();

class _ViewPostScreenState extends State<ViewPostScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Ensure the widget tree is built before calling scrollToIndex
      if (itemScrollController.isAttached) {
        scrollToIndex(widget.index,
            itemScrollController); // Example: Scroll to the first item
      }
    });

    itemPositionsListener.itemPositions.addListener(() {
      final positions = itemPositionsListener.itemPositions.value;
      for (final position in positions) {
        print('Item ${position.index} is visible.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ItemPositionsListener.create();
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Posts',
            style: AppTextStyles().appBarTitleStyle,
          ),
        ),
        body: Query(
            options: QueryOptions(
              document: getPostsQuery,
              variables: {'user_id': FirebaseAuth.instance.currentUser?.email},
            ),
            builder: (result, {fetchMore, refetch}) {
              if (result.isLoading) {
                return shimmerPostBuilder();
              }
              if (result.hasException) {
                return Center(
                  child: Text(result.exception.toString()),
                );
              }
              final List posts = result.data?['posts'];
              return ScrollablePositionedList.builder(
                itemCount: posts.length, // Total items in the list
                itemScrollController:
                    itemScrollController, // Attach Scroll Controller
                itemPositionsListener:
                    itemPositionsListener, // Track item positions itemBuilder: itemBuilder),
                itemBuilder: (context, index) {
                  return postContainer(
                    context: context,
                    userName: 'userName',
                    timePeriod: 'timePeriod',
                    email: 'email',
                    description: 'description',
                    imageUrl: posts[index]['image_url'] ?? '',
                    backgroundImage:
                        NetworkImage(posts[index]['image_url'] ?? ''),
                        onTaggedFriendsPressed: (){},
                    popupMenuButton: MenuButton(
                      postId: posts[index]['post_id'],
                      onCompleted: () {
                        if (refetch != null) {
                          refetch();
                        }
                      },
                    ),
                  );
                },
              );
            }));
  }
}

void scrollToIndex(int index, ItemScrollController itemScrollController) {
  itemScrollController.scrollTo(
    index: index,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut, // Smooth scrolling
  );
}
