import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'theme/theme.dart';
import 'widgets/widgets.dart';
import 'models/models.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  final List<String> menuItems = const [
    'Home',
    'Course',
    'Pricing',
    'Explore',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.extension<CourslyColor>()!.bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTopAd(),
          const SizedBox(
            height: 48,
          ),
          _buildContent(context),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 84),
      child: Column(
        children: [
          _buildMenu(context),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: const [
              Content(),
              Slider(),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTopAd() {
    return SizedBox(
      height: 88,
      width: double.infinity,
      child: Image.asset(
        'assets/images/top_ad.png',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildMenu(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(
              width: 52,
            ),
            ...menuItems.map(
              (item) => Row(
                children: [
                  CourslyMenuItem(
                    text: item,
                    active: item == 'Home',
                  ),
                  const SizedBox(
                    width: 52,
                  )
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            const CourslyButton(text: 'Login'),
            const SizedBox(
              width: 8,
            ),
            CourslyButton(
              text: 'Signup',
              textStyle: context.theme
                  .extension<CourslyText>()!
                  .button
                  .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
              bgColor: Colors.black,
            ),
          ],
        )
      ],
    );
  }
}

class Content extends StatelessWidget {
  const Content({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: FadeIn(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Learn ',
                    style: context.theme.extension<CourslyText>()!.headerTitle,
                  ),
                  Stack(
                    children: [
                      SvgPicture.asset('assets/images/everything.svg'),
                      Text(
                        'EveryThing',
                        style:
                            context.theme.extension<CourslyText>()!.headerTitle,
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'Without ',
                    style: context.theme.extension<CourslyText>()!.headerTitle,
                  ),
                  Stack(
                    children: [
                      Positioned(
                        bottom: 34,
                        child: Container(
                          width: 220,
                          height: 24,
                          color: const Color(0xff00FF84),
                        ),
                      ),
                      Text(
                        'Limits',
                        style:
                            context.theme.extension<CourslyText>()!.headerTitle,
                      ),
                    ],
                  ),
                  Text(
                    '!',
                    style: context.theme
                        .extension<CourslyText>()!
                        .headerTitle
                        .copyWith(fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              Text(
                'Build skills with courses, certificates, and degrees online from world-class '
                'universities and companies.',
                style: context.theme.extension<CourslyText>()!.headerDesc,
              ),
              const SizedBox(
                height: 56,
              ),
              Row(
                children: [
                  CourslyButton(
                    text: 'Start Now!',
                    bgColor:
                        context.theme.extension<CourslyColor>()!.primaryColor,
                    textColor: Colors.white,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const CourslyButton(text: 'Learn more'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Slider extends StatefulWidget {
  const Slider({Key? key}) : super(key: key);

  @override
  State<Slider> createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  final _courses = <Course>[
    Course(
      title: 'UI Design Foundation',
      type: 'Career Path',
      lessonsTotal: 85,
      totalHours: 40,
    ),
    Course(
      title: 'UI Design Foundation',
      type: 'Career Path',
      lessonsTotal: 85,
      totalHours: 40,
    ),
    Course(
      title: 'UI Design Foundation',
      type: 'Career Path',
      lessonsTotal: 85,
      totalHours: 40,
    ),
    Course(
      title: 'UI Design Foundation',
      type: 'Career Path',
      lessonsTotal: 85,
      totalHours: 40,
    ),
    Course(
      title: 'UI Design Foundation',
      type: 'Career Path',
      lessonsTotal: 85,
      totalHours: 40,
    ),
  ];
  final _controller = PageController(viewportFraction: 0.8, initialPage: 2);
  int _currentSlideIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 440,
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                width: 440,
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _courses.length,
                  onPageChanged: (newIndex) => setState(() {
                    _currentSlideIndex = newIndex;
                  }),
                  itemBuilder: ((_, index) {
                    return CourseCard(
                      selected: index == _currentSlideIndex,
                      course: _courses[index],
                    );
                  }),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildDots(),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    final result = <Widget>[];
    for (int i = 0; i < _courses.length; i++) {
      result.add(
        Dot(active: i == _currentSlideIndex),
      );
      if (i != _courses.length - 1) {
        result.add(const SizedBox(width: 8));
      }
    }

    return result;
  }
}
