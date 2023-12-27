import 'package:chat_gpt/Feature/onboarding/presentation/widgets/onBoarding_item.dart';
import 'package:flutter/material.dart';
import 'package:chat_gpt/Feature/onboarding/presentation/widgets/page_view_iteam.dart';
import 'package:chat_gpt/Feature/home/presentation/home_page.dart';
import 'package:chat_gpt/core/utils/assets_data.dart';
import 'package:chat_gpt/core/utils/colors.dart';
import 'package:chat_gpt/core/utils/components.dart';
import 'package:chat_gpt/core/utils/styles.dart';

class BoardingBody extends StatefulWidget {
  const BoardingBody({super.key});

  @override
  State<BoardingBody> createState() => _BoardingBodyState();
}

class _BoardingBodyState extends State<BoardingBody> {
  int? index;
  bool islast = false;
  bool isfirst = true;
  bool isSecond = false;

  List<OnBoardingModel> border = [
    OnBoardingModel(
      image: AssetsData.frame,
      title: "Examples",
      txt1: "Explain quantum computing in simple terms",
      txt2: "Got any creative ideas for a 10 year old’s birthday?",
      txt3: 'How do I make an HTTP request in Javascript?',
    ),
    OnBoardingModel(
      image: AssetsData.icon2,
      title: "Capabilities",
      txt1: "Remembers what user said earlier in the conversation",
      txt2: "Allows user to provide follow-up corrections",
      txt3: 'Trained to decline inappropriate requests',
    ),
    OnBoardingModel(
      image: AssetsData.icon3,
      title: "Limitations",
      txt1: "May occasionally generate incorrect information",
      txt2: "May occasionally produce harmful instructions or biased content",
      txt3: 'Limited knowledge of world and events after 2021',
    ),
  ];
  PageController? pageController = PageController();
  @override
  void initState() {
    super.initState();

    // pageController = PageController(
    //   initialPage: 0,
    // )..addListener(() {
    //     setState(() {});
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 40, left: 20.0, right: 20.0, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage(AssetsData.vector),
            width: 24,
            height: 24,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Welcome to",
            style: StylesData.logoStyle.copyWith(fontSize: 32),
          ),
          Text(
            "ChatGPT",
            style: StylesData.logoStyle.copyWith(fontSize: 32),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            'Ask anything, get your answer ',
            style: StylesData.logoStyle
                .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
              // height: 15,
              ),
          Expanded(
              child: PageView.builder(
            itemBuilder: (con, ind) => InboardingItem(model: border[ind]),
            itemCount: border.length,
            controller: pageController,
            onPageChanged: (ind) {
              if (ind == border.length - 1) {
                index = ind;
                print("last");

                setState(() {
                  islast = true;
                  isfirst = false;
                  isSecond = false;
                });
              } else if (ind == border.length - 2) {
                index = ind;
                setState(() {
                  isfirst = false;
                  isSecond = true;
                  islast = false;
                });
              } else {
                print("x is $ind");
                setState(() {
                  isfirst = true;
                  isSecond = false;

                  islast = false;
                });
              }
            },
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 2,
                width: 28,
                decoration: BoxDecoration(
                  color: isfirst ? kMainColor : Colors.grey,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                height: 2,
                width: 28,
                decoration: BoxDecoration(
                  color: isSecond ? kMainColor : Colors.grey,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                height: 2,
                width: 28,
                decoration: BoxDecoration(
                  color: islast ? kMainColor : Colors.grey,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          defaultButton(
              fun: () {
                if (islast) {
                  Nav(context, const HomePage());
                } else {
                  pageController!.nextPage(
                      duration: const Duration(microseconds: 80000),
                      curve: Curves.easeInCirc);
                }
              },
              textWidget: islast
                  ? const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Let’s Chat",
                          style: StylesData.buttonText,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 18,
                        )
                      ],
                    )
                  : const Text(
                      "Next",
                      style: StylesData.buttonText,
                    )),
        ],
      ),
    );
  }
}
