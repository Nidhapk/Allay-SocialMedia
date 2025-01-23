import 'package:flutter/material.dart';

Widget postContainer({
  required BuildContext context,
  required String userName,
  required String timePeriod,
  required String email,
  required String description,
  required String imageUrl,
  required ImageProvider<Object>? backgroundImage,
  required void Function()? onTaggedFriendsPressed,
  Widget? popupMenuButton,
}) {
  final width = MediaQuery.of(context).size.width;
  final height = MediaQuery.of(context).size.height;
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Container(
      decoration: BoxDecoration(
        boxShadow: const [BoxShadow(color: Colors.grey)],
        color: Colors.white,
        border: Border.all(
          color: Colors.grey.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20.0,
          right: 20.0,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.1),
                  radius: width * 0.065,
                  backgroundImage: backgroundImage,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text.rich(
                  TextSpan(
                    text: '$userName\n',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: timePeriod,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 127,
                ),
                popupMenuButton ?? const SizedBox.shrink(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                imageUrl != ''
                    ? Container(
                        height: height * 0.3,
                        //width: width,
                
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(imageUrl)),
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      )
                    : const SizedBox.shrink(),Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                    icon: const Icon(
                      Icons.group, // Icon representing tagged friends
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: onTaggedFriendsPressed, // Callback when pressed
                    tooltip: 'See tagged friends',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.8),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text.rich(
                TextSpan(
                  text: email,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(
                      text: description,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color.fromARGB(255, 60, 60, 60),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
