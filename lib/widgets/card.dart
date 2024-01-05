import 'package:course_view/widgets/place_holders.dart';
import 'package:flutter/material.dart';

import '../pages/course_view/page.dart';
import '../pages/home/model.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    this.isFirst = false,
    required this.course,
    required this.buttonText,
    this.toggleCartButton,
  }) : super(key: key);
  final bool isFirst;
  final CoursesModel course;
  final String buttonText;
  final VoidCallback? toggleCartButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      width: MediaQuery.sizeOf(context).width * .63,
      height: 260,
      margin: EdgeInsets.only(left: isFirst ? 0 : 10),
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CourseViewPage(course: course)));
        },
        padding: EdgeInsets.zero,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ImageLoader(
                imageUrl: course.thumbnail,
                fit: BoxFit.cover,
                decoration:
                    const BoxDecoration(borderRadius: BorderRadius.zero),
              ),
            ),
            const SizedBox(height: 4.0),
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.language_rounded,
                    color: Colors.red.shade700,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    'English subtitle',
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                course.title,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(height: 1.2),
              ),
            ),
            const Spacer(),
            Row(
              children: <Widget>[
                TextButton(
                  onPressed: toggleCartButton,
                  style: ButtonStyle(
                    minimumSize: const MaterialStatePropertyAll(Size.zero),
                    foregroundColor: MaterialStatePropertyAll(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                  child: Text(buttonText),
                ),
                const Spacer(),
                Icon(
                  Icons.star,
                  color: Theme.of(context).primaryColor,
                ),
                const Text('4.1'),
                const SizedBox(width: 5.0)
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class _VideoAppState extends State<VideoApp> {
//   late VideoPlayerController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = VideoPlayerController.networkUrl(Uri.parse(
//         'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
//       ..initialize().then((_) {
//         // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
//         setState(() {});
//       });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Demo',
//       home: Scaffold(
//         body: Center(
//           child: _controller.value.isInitialized
//               ? AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           )
//               : Container(),
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             setState(() {
//               _controller.value.isPlaying
//                   ? _controller.pause()
//                   : _controller.play();
//             });
//           },
//           child: Icon(
//             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _controller.dispose();
//   }
// }
