import 'package:flutter/material.dart';
import 'package:zapbill/util/device_size.dart';
import 'package:zapbill/widgets/rounded_button.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late DeviceSize deviceSize;
  int indexOfContent = 0;

  final List<Map<String, String>> contentData = [
    {
      "title": "Fast and easy connect with customer",
      "description":
          "A MERN stack blog website to view posts and read comments. Features a responsive React.js frontend, Node.js backend, and MongoDB database.",
    },
    {
      "title": "Manage your business effectively",
      "description":
          "ZapBill helps you track customer interactions and streamline your workflows with ease.",
    },
    {
      "title": "Manage your business effectively",
      "description":
          "ZapBill helps you track customer interactions and streamline your workflows with ease.",
    },
  ];

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = DeviceSize(context: context);
    return Scaffold(
      body: Stack(
        children: [
          _introBackground(),
          _contentContainer(),
          _skipBtn(),
        ],
      ),
    );
  }

  Widget _introBackground() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/intro${indexOfContent + 1}.png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _contentContainer() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: deviceSize.deviceWidth * 0.14,
          height: deviceSize.deviceHeight * 0.03,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              "${indexOfContent + 1} of ${contentData.length}",
              textAlign: TextAlign.center,
            ),
          ),
        ),
        SizedBox(
          height: deviceSize.deviceHeight * 0.005,
        ),
        Container(
          color: Colors.white,
          height: deviceSize.deviceHeight * 0.36,
          width: deviceSize.deviceWidth,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                indexOfContent = index;
              });
            },
            itemCount: contentData.length,
            itemBuilder: (context, index) {
              return _buildContent(
                title: contentData[index]["title"]!,
                description: contentData[index]["description"]!,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildContent({required String title, required String description}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: deviceSize.deviceWidth * 0.03),
      width: deviceSize.deviceWidth,
      height: deviceSize.deviceHeight * 0.38,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontSize: 32, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          Text(
            description,
            style: const TextStyle(
                color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          RoundedButton(
            height: deviceSize.deviceHeight * 0.07,
            width: deviceSize.deviceWidth * 0.8,
            name: indexOfContent < contentData.length - 1
                ? "Next"
                : "Get Started",
            onPressed: () {
              if (indexOfContent < contentData.length - 1) {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              } else {
                Navigator.pop(context); // Or navigate to another page
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _skipBtn() {
    return SafeArea(
      child: Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          child: Container(
            margin: EdgeInsets.only(right: 20),
            width: 70,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.skip_next_outlined),
                Text("Skip"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
