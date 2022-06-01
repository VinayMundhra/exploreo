import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      alignment: Alignment.center,
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 3.0),
      height: 8.0,
      width: isActive ? 30.0 : 10.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Color.fromARGB(255, 184, 184, 184),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  content(String data, double fontsize, FontWeight weight) {
    return Text(data,
        textAlign: TextAlign.center,
        style: TextStyle(
            letterSpacing: 1.2,
            color: Colors.black,
            fontSize: fontsize,
            fontWeight: weight));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(top: 10, right: 5),
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => print('Skip'),
                        child: const Text(
                          'Skip',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.check,
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 550.0,
                  child: PageView(
                    physics:const ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: const Image(
                              image: AssetImage(
                                'assets/Onboarding1.0.png',
                              ),
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Center(
                            child: content(
                                'Create your own event', 20, FontWeight.bold),
                          ),
                          const SizedBox(height: 15.0),
                          Container(
                            alignment: Alignment.center,
                            child: content(
                                'The quick, brown for jumps over a\nlazy dog. DJs flock by when MTV\nax quiz prog.',
                                15,
                                FontWeight.normal),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Image(
                            image: AssetImage(
                              'assets/Onboarding1.0.png',
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Center(
                            child: content('Meet with other new riders', 20,
                                FontWeight.bold),
                          ),
                          const SizedBox(height: 15.0),
                          Container(
                            alignment: Alignment.center,
                            child: content(
                                'The quick, brown for jumps over a\nlazy dog. DJs flock by when MTV\nax quiz prog.',
                                15,
                                FontWeight.normal),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Image(
                            image: AssetImage(
                              'assets/Onboarding1.0.png',
                            ),
                          ),
                          const SizedBox(height: 15.0),
                          Center(
                            child: content('Chat with riders friends', 20,
                                FontWeight.bold),
                          ),
                          const SizedBox(height: 15.0),
                          Container(
                            alignment: Alignment.center,
                            child: content(
                                'The quick, brown for jumps over a\nlazy dog. DJs flock by when MTV\nax quiz prog.',
                                15,
                                FontWeight.normal),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                    ? TextButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: const CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Colors.white,
                            size: 30.0,
                          ),
                        ),
                      )
                    : SizedBox(),
                const SizedBox(height: 20),
                _currentPage == _numPages - 1
                    ? Container(
                        // padding:
                        //     EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        color: Colors.blue,
                        height: 50.0,
                        width: 30,
                        child: GestureDetector(
                          onTap: () => print('Get started'),
                          child: const Center(
                            child: Text(
                              'PROCEED',
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
