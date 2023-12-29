import 'package:chewie/chewie.dart';
import 'package:course_view/utils/download.dart';
import 'package:course_view/widgets/button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../widgets/list_tile.dart';
import '../home/model.dart';
import 'model.dart';
import 'provider.dart';

class CourseViewPage extends ConsumerStatefulWidget {
  const CourseViewPage({
    Key? key,
    required this.course,
  }) : super(key: key);
  final CoursesModel course;

  @override
  ConsumerState<CourseViewPage> createState() => _CourseViewPageState();
}

class _CourseViewPageState extends ConsumerState<CourseViewPage> {
  late VideoPlayerController _videoController1;
  late VideoPlayerController _videoController2;
  ChewieController? _chewieController;
  int? bufferDelay;
  bool completed = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    if (completed) {
      _videoController1.dispose();
      _videoController2.dispose();
      _chewieController?.dispose();
    }
    super.dispose();
  }

  Future<void> initializePlayer(Module module) async {
    final download = Download();
    await download.initialize();

    if (completed) return;

    final file = await download.getVideo(module.url, module.id, 'mp4');

    if (file != null) {
      _videoController1 = VideoPlayerController.file(file);
      _videoController2 = VideoPlayerController.file(file);

      await Future.wait([
        _videoController1.initialize(),
        _videoController2.initialize(),
      ]);

      _createChewieController();
      completed = true;
      ref.read(canPlayVideoProvider.notifier).update((state) => true);
    }
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoController1,
      autoPlay: true,
      looping: true,
      progressIndicatorDelay:
          bufferDelay != null ? Duration(milliseconds: bufferDelay!) : null,
    );
  }

  Widget _ratingWidget(BuildContext context) => Row(
        children: <Widget>[
          Icon(
            Icons.star,
            color: Theme.of(context).primaryColor,
          ),
          const Text('4.1'),
        ],
      );

  Widget _watchedWidget(BuildContext context) => Row(
        children: <Widget>[
          Icon(
            Icons.people_alt,
            color: Theme.of(context).primaryColor,
          ),
          const Text('2,363'),
        ],
      );

  Widget _infoWidget() => const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            CupertinoIcons.info,
            color: Colors.grey,
          ),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              'This package selected on choice of offer for the course, we strongly advice to go for a better choice.',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
        ],
      );

  Widget _smallText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 12,
        color: Colors.grey.shade600,
      ),
    );
  }

  Widget _bodyText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey.shade700,
        wordSpacing: 1,
      ),
    );
  }

  Widget _titleText(String text) {
    return Text(text, style: Theme.of(context).textTheme.titleMedium);
  }

  @override
  Widget build(BuildContext context) {
    final course = ref.watch(courseProvider(widget.course.id));
    final canPlayVideo = ref.watch(canPlayVideoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course View'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.lock_outline_rounded,
              color: Colors.blueGrey.shade600,
            ),
          ),
        ],
      ),
      body: course.when(
        data: (data) {
          initializePlayer(data.modules.first);
          return SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: canPlayVideo
                      ? Chewie(controller: _chewieController!)
                      : Container(
                          color: Colors.grey.withOpacity(.3),
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                ),
                const SizedBox(height: 12.0),
                _titleText(widget.course.title),
                const SizedBox(height: 8.0),
                Row(
                  children: <Widget>[
                    const Spacer(),
                    ActionButton(
                      onPressed: () {},
                      iconData: CupertinoIcons.link,
                      text: 'Share',
                    )
                  ],
                ),
                const SizedBox(height: 4.0),
                MaterialButton(
                  onPressed: () {},
                  elevation: 0,
                  padding: const EdgeInsets.fromLTRB(5.0, 10.0, 10.0, 10.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox.square(
                        dimension: 48.0,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Icon(
                            Icons.folder,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Course Material Available',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey,
                              ),
                            ),
                            Text(
                              'Download the course files before '
                              'proceeding to watch the course',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      const Icon(
                        Icons.file_download_outlined,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                DefaultTabController(
                  length: 4,
                  child: Column(
                    children: <Widget>[
                      TabBar(
                        isScrollable: true,
                        labelColor: Colors.blueGrey,
                        unselectedLabelStyle: const TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        indicatorColor: Theme.of(context).primaryColor,
                        tabs: const <Widget>[
                          Tab(text: 'Lectures', height: 40),
                          Tab(text: 'Notes', height: 40),
                          Tab(text: 'Comments', height: 40),
                          Tab(text: 'Challenges', height: 40),
                        ],
                      ),
                      Container(
                        height: 250,
                        padding: const EdgeInsets.only(top: 15.0),
                        child: TabBarView(
                          children: <Widget>[
                            ListView.builder(
                              itemCount: data.modules.length,
                              itemBuilder: (BuildContext context, int index) {
                                final module = data.modules.elementAt(index);
                                return CourseListTile(
                                  onPressed: () {},
                                  code: 'C${index + 1}',
                                  title: module.name,
                                  isUnlocked: !module.subscriptionRequired,
                                );
                              },
                            ),
                            const Center(child: Text('Tab 2 Content')),
                            const Center(child: Text('Tab 3 Content')),
                            const Center(child: Text('Tab 4 Content')),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30.0),
                _titleText('Course Description'),
                _bodyText(widget.course.description),
                const SizedBox(height: 30.0),
                _smallText('Curriculum'),
                _titleText('Learn-by doing with our Exclusion Videos'),
                _bodyText(
                  'Our Course is setup to make you learn Advanced Audit and '
                  'Assurance(Revision) by step with a practical detailed note/'
                  'video that focuses 100% on learn-by-doing',
                ),
                const SizedBox(height: 30.0),
                _smallText('On Course Completion'),
                _titleText('Course Requirements'),
                _bodyText('On successful completion of this cour'),
                _smallText('Wooah! Fully Loaded'),
                _titleText('This course includes'),
                Row(
                  children: <Widget>[
                    const Icon(CupertinoIcons.checkmark_seal),
                    _bodyText('195 Lessons & Details otes')
                  ],
                ),
                _titleText('Instructor'),
                Row(
                  children: <Widget>[
                    SizedBox.square(
                      dimension: 45,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade900,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: const Center(
                          child: Text(
                            'A',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _titleText('Ahmed Suluka ACA, ASSA'),
                        _bodyText('ead of scool ExcelAcadey'),
                      ],
                    )
                  ],
                ),
                _titleText('Reviews'),
                _bodyText('Students feedback are very important'),
                const SizedBox(height: 15.0),
                ...List.generate(
                  5,
                  (index) => Column(
                    children: <Widget>[
                      Row(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          SizedBox.square(
                            dimension: 35,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Rebacca Folake',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      letterSpacing: null,
                                      fontSize: 14,
                                    ),
                              ),
                              Text(
                                'Lagos, Nigeria',
                                style: TextStyle(
                                  color: Colors.blueGrey.shade700,
                                  fontSize: 12.0,
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 14.0,
                                color: Theme.of(context).primaryColor,
                              ),
                              Text(
                                '4.3',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.blueGrey.shade700,
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              Text(
                                '3 Days ago',
                                style: TextStyle(
                                  fontSize: 10.0,
                                  color: Colors.blueGrey.shade700,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        'Bootcamp was an absolute blast. '
                        'The classes were so interactive '
                        'and engaging which I loved so much',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          wordSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Center(child: _bodyText('See more reviews')),
                ),
                _smallText('COURSE PRICING'),
                _titleText('Simple, transparent pricing'),
                _bodyText(
                  'We keep track of the pricing of the '
                  'course from onset without computing',
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(
                      color: Theme.of(context).primaryColor.withOpacity(.3),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          _bodyText('Pay today'),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox.square(
                              dimension: 5.0,
                              child: DecoratedBox(
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                          _bodyText('save NGN 6,200.00'),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const SizedBox(height: 5.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.warning_amber_rounded,
                            color: Colors.blueGrey.shade400,
                          ),
                          const SizedBox(width: 5.0),
                          Flexible(
                            child: Text(
                              'This package is exclusive to '
                              'this particular course only',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.blueGrey.shade800,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5.0),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                _titleText('Got few questions for us?'),
                _bodyText(
                  'We keep track of the pricing of the '
                  'course from onset without compromising',
                ),
                QuestionListTile(
                  onPressed: () {},
                  question: 'How do we have access to the course?',
                ),
                QuestionListTile(
                  onPressed: () {},
                  question: 'How do we have access to the course?',
                ),
                QuestionListTile(
                  onPressed: () {},
                  question: 'How do we have access to the course?',
                ),
                const SizedBox(height: 30),
                _titleText('Still not conceived with Q&A'),
                _bodyText(
                  'We keep track of the pricing of the '
                  'course from onset without compromising',
                ),
                const SizedBox(height: 15.0),
                OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(
                      Theme.of(context).primaryColor,
                    ),
                    side: MaterialStatePropertyAll(
                      BorderSide(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    minimumSize: const MaterialStatePropertyAll(
                      Size(double.infinity, 48),
                    ),
                  ),
                  child: const Text('Send us a message'),
                ),
                const SizedBox(height: 30.0),
                Row(
                  children: <Widget>[
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'NGN 24,000.00',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                        Text(
                          'NGN 20,000.00',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 15.0),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                            Theme.of(context).primaryColor,
                          ),
                          foregroundColor: const MaterialStatePropertyAll(
                            Colors.white,
                          ),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          minimumSize: const MaterialStatePropertyAll(
                            Size(0, 48),
                          ),
                        ),
                        child: const Text('Enroll now'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
              ],
            ),
          );
        },
        error: (_, __) {
          return Text('Error $_');
        },
        loading: () {
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
