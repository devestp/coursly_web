import 'package:flutter/material.dart';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/theme/theme.dart';
import '/models/models.dart';

class CourseCard extends StatefulWidget {
  final bool selected;
  final Course course;

  const CourseCard({required this.course, this.selected = false, Key? key})
      : super(key: key);

  @override
  State<CourseCard> createState() => _CourseCardState();
}

class _CourseCardState extends State<CourseCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      child: Stack(
        children: [
          _buildShadowCard(),
          widget.selected
              ? Transform.translate(
                  offset: const Offset(-7, -7),
                  child: _buildMainCard(),
                )
              : _buildMainCard()
        ],
      ),
    );
  }

  Widget _buildShadowCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: SmoothBorderRadius(
          cornerRadius: 12,
          cornerSmoothing: 1,
        ),
      ),
    );
  }

  Widget _buildMainCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: SmoothBorderRadius(
          cornerRadius: 12,
          cornerSmoothing: 1,
        ),
        border: Border.all(width: 1),
      ),
      child: Column(
        children: [
          _buildProSection(),
          _buildCourseImage(),
          Text(
            widget.course.title,
            style: context.theme.extension<CourslyText>()!.courseCardTitle,
          ),
          const SizedBox(height: 8),
          Text(
            widget.course.type,
            style: context.theme.extension<CourslyText>()!.courseCardType,
          ),
          const SizedBox(height: 24),
          _buildCourseMeta(),
          const SizedBox(height: 38),
        ],
      ),
    );
  }

  Widget _buildProSection() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 8,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xffFAB819),
              Color(0xffEFA900),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
          borderRadius: SmoothBorderRadius.only(
            bottomLeft: SmoothRadius(
              cornerRadius: 8,
              cornerSmoothing: 1,
            ),
            bottomRight: SmoothRadius(
              cornerRadius: 8,
              cornerSmoothing: 1,
            ),
          ),
        ),
        child: Text(
          'Pro Course',
          style: context.theme.extension<CourslyText>()!.courseCardPro,
        ),
      ),
    );
  }

  Widget _buildCourseImage() {
    return Expanded(
      child: Center(
        child: Image.asset(
          'assets/images/course.png',
          width: 120,
          height: 120,
        ),
      ),
    );
  }

  Widget _buildCourseMeta() {
    return Row(
      children: [
        _buildMetaInfo(
          '${widget.course.lessonsTotal} Lesson',
          'assets/icons/document-text.svg',
        ),
        _buildMetaInfo(
          '${widget.course.totalHours} Hours',
          'assets/icons/clock.svg',
        ),
      ],
    );
  }

  Widget _buildMetaInfo(String title, String icon) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          const SizedBox(width: 8),
          Text(
            title,
            style: context.theme.extension<CourslyText>()!.courseCardMeta,
          ),
        ],
      ),
    );
  }
}
