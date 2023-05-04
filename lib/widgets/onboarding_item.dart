import 'package:flutter/material.dart';
import 'package:onboarding_ui/pages/home_page.dart';

class OnboardingItem extends StatelessWidget {
  final String image;
  final String text1;
  final String text2;
  final Color color;
  final int index;
  final int borderIndex;
  final PageController controller;
  const OnboardingItem(
      {super.key,
      required this.color,
      required this.image,
      required this.borderIndex,
      required this.text1,
      required this.text2,
      required this.index,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 37, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.more_vert_outlined,
                  size: 25,
                  color: Colors.white,
                ),
                borderIndex == 2
                    ? Container(
                        color: color,
                      )
                    : Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              backgroundColor: Colors.white54,
                            ),
                            onPressed: () {
                              if (index == 2) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => HomePage())));
                              } else {
                                controller.animateToPage(index + 2,
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.linear);
                              }
                            },
                            child: Text(
                              "Skip",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            )),
                      ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Image(
                width: 286,
                height: 229,
                image: AssetImage(image),
              ),
            ),
          ),
          SizedBox(
            height: 64,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: borderIndex == 0
                    ? BorderRadius.only(
                        topLeft: Radius.circular(63),
                      )
                    : (borderIndex == 1
                        ? null
                        : BorderRadius.only(
                            topRight: Radius.circular(63),
                          )),
              ),
              child: Column(children: [
                SizedBox(
                  height: 60,
                ),
                Text(
                  text1,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Ubuntu",
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 53, right: 53),
                  child: Text(
                    text2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: borderIndex == 0
                        ? MainAxisAlignment.end
                        : (borderIndex == 1
                            ? MainAxisAlignment.end
                            : MainAxisAlignment.center),
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: SizedBox(
                          width: borderIndex == 0
                              ? 50
                              : (borderIndex == 1 ? 50 : 200),
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                backgroundColor: color),
                            onPressed: () {
                              if (index == 2) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => HomePage())));
                              } else {
                                controller.animateToPage(index + 1,
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.linear);
                              }
                            },
                            child: borderIndex == 0
                                ? Icon(Icons.arrow_forward)
                                : (borderIndex == 1
                                    ? Icon(Icons.arrow_forward)
                                    : Text("Get Started")),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }
}
