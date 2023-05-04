import 'package:flutter/material.dart';
import 'package:onboarding_ui/widgets/indigator_item.dart';
import 'package:onboarding_ui/widgets/onboarding_item.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  PageController _pageController = PageController();
  int hozirgiPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                hozirgiPageIndex = index;
              });
            },
            controller: _pageController,
            children: [
              OnboardingItem(
                color: Color(0xffFF6F59),
                image: "assets/images/Study-online.png",
                text1: "Research",
                text2:
                    """FUt feugiat velit ut sagittis accumsan. Fusce eu eros nec massa placerat tempor. Donec leo lacus, eleifend in sollicitudin eu, consectetur vitae turpis.""",
                index: hozirgiPageIndex,
                controller: _pageController,
                borderIndex: 0,
              ),
              OnboardingItem(
                color: Color(0xff6C969D),
                image: "assets/images/Web-design.png",
                text1: "Collaborate",
                text2:
                    """Aliquam erat volutpat. Mauris sed libero ante. Duis leo nisl, finibus vitae nulla a, aliquam fringilla velit.""",
                index: hozirgiPageIndex,
                controller: _pageController,
                borderIndex: 1,
              ),
              OnboardingItem(
                color: Color(0xff43AA8B),
                image: "assets/images/Online-shopping.png",
                text1: "Implement",
                text2:
                    """Aliquam ex ex, sagittis sed facilisis vel, placerat at velit. Morbi turpis odio, tristique ut ipsum condimentum, ultrices luctus ligula.""",
                index: hozirgiPageIndex,
                controller: _pageController,
                borderIndex: 2,
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                hozirgiPageIndex == 2
                    ? Container(
                        color: Colors.white,
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: _builderItem(hozirgiPageIndex),
                      ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> _builderItem(int hozirgiIndex) {
  List<Widget> list = [];

  for (int i = 0; i < 3; i++) {
    if (hozirgiIndex == i) {
      list.add(
        IndigatorItem(isActive: true),
      );
    } else {
      list.add(
        IndigatorItem(isActive: false),
      );
    }
  }
  return list;
}
