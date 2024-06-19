import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:todaily/core/common/widgets/backgrounds/gradient_background.dart';
import 'package:todaily/core/extensions/build_context_ext.dart';
import 'package:todaily/core/resources/color_res.dart';
import 'package:todaily/core/resources/edge_insets_res.dart';
import 'package:todaily/core/resources/vector_res.dart';
import 'package:todaily/features/on_boarding/presentation/widgets/on_boarding_content.dart';

class OnBoardingPage extends StatefulWidget {
  static const String path = '/OnBoardingPage';

  static route() => MaterialPageRoute(
        builder: (_) => const OnBoardingPage(),
      );

  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsetsRes.V16,
            child: Column(
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: const ExpandingDotsEffect(
                    dotColor: ColorRes.WHITE,
                    activeDotColor: ColorRes.GREEN300,
                  ),
                ),
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    physics: const ClampingScrollPhysics(),
                    children: const [
                      OnBoardingContent(
                        vector: VectorRes.TODO,
                        title: 'Easy and Quick Task Management',
                        description:
                            'Add, edit, and complete your tasks effortlessly. With our simple and user-friendly interface, get things done faster.',
                      ),
                      OnBoardingContent(
                        vector: VectorRes.WORK_LIFE_BALANCE,
                        title: 'Reminders and Notifications',
                        description:
                            'Never miss a task! Stay on top of important tasks with timely reminders and notifications, keeping you always organized.',
                      ),
                      OnBoardingContent(
                        vector: VectorRes.EFFICIENCY,
                        title: 'Personalized Task Tracking',
                        description:
                            'Stay organized by categorizing and prioritizing your tasks. Customize the app to suit your working style.',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsRes.H16,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorRes.SKY300,
                        minimumSize: const Size(double.infinity, 0),
                        padding: EdgeInsetsRes.ALL12,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                    onPressed: () {},
                    child: Text(
                      'Next',
                      style: context.textTheme.titleMedium!.copyWith(
                        color: ColorRes.WHITE,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
