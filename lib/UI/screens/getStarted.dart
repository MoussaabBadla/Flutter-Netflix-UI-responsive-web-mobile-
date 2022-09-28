// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:netflix/UI/widgets/myappbar.dart';
import 'package:netflix/UI/widgets/responsive.dart';

class getStarterScreen extends StatefulWidget {
  const getStarterScreen({Key? key}) : super(key: key);

  @override
  _getStarterScreenState createState() => _getStarterScreenState();
}

class _getStarterScreenState extends State<getStarterScreen> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
            preferredSize: Size(screenSize.width, 60),
            child: const CustomAppBar(
              isgetStarted: true,
              scrollOffset: 0,
            )),
        body: Responsive(
          mobile: _mobileGetStarted(
            screensize: screenSize,
          ),
          desktop: _disktopGetStarted(
            screensize: screenSize,
          ),
        ),
      ),
    );
  }
}

class _mobileGetStarted extends StatefulWidget {
  const _mobileGetStarted({required this.screensize});
  final Size screensize;

  @override
  State<_mobileGetStarted> createState() => _mobileGetStartedState();
}

class _mobileGetStartedState extends State<_mobileGetStarted> {
  final _controller = PageController(initialPage: 0);
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          children: [
            Stack(
              children: [
                Container(
                  height: 600.0,
                  decoration: const BoxDecoration(
                    image:  DecorationImage(
                      image: AssetImage('images/content.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: 600.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.black.withOpacity(0.3),
                        Colors.black
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 180.0,
                  child: Container(
                    color: Colors.black.withOpacity(0.3),
                    width: widget.screensize.width,
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Unlimited films,\n  TV programmse  \n & more ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 38,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Watch anywhere.Cancel at any \n time',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            mycolum('images/page2.png', 'Download and,\nwatch offline',
                'Always have something to watch\noffline'),
            mycolum('images/page3.jpg', 'No annoying\ncontracts',
                'Join today,canced at any time'),
            mycolum('images/page4.jpg', 'Watch\neverywhere',
                'Stream on your phone,tablet,\nlaptop,TV and more '),
          ],
          onPageChanged: (val) {
            setState(() {
              _currentIndex = val;
            });
          },
        ),
        Indicator(
          index: _currentIndex,
        ),
        Builder(
          builder: (ctx) => Align(
            alignment: const Alignment(0, 0.94),
            child: Container(
              width: widget.screensize.width,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 244, 29, 26)),
                ),
                onPressed: () {                          Navigator.of(context).pushReplacementNamed('/main');
},
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text('GET STARTED',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400)),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column mycolum(String image, String title, String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
                fit: BoxFit.fill,
                width: 300,
                height: 200,

                // 'images/page2.png',
                image)),
        const SizedBox(
          height: 70,
        ),
        Text(
          // 'Download and,\nwatch offline   ',
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          // 'Always have something to watch\noffline',
          subtitle,
          style: const TextStyle(
            color: Colors.grey,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class Indicator extends StatelessWidget {
  final int index;

  const Indicator({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0.82),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildContainer(context, 0),
          buildContainer(context, 1),
          buildContainer(context, 2),
          buildContainer(context, 3),
        ],
      ),
    );
  }

  Widget buildContainer(BuildContext ctx, int i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 10,
        height: 10,
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == i ? Colors.white : Colors.grey[600]),
      ),
    );
  }
}

class _disktopGetStarted extends StatelessWidget {
  const _disktopGetStarted({Key? key, required this.screensize})
      : super(key: key);
  final Size screensize;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          child: Image.asset(
            'images/netflix-1.webp',
            width: screensize.width,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: screensize.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black,
                Colors.black.withOpacity(0.3),
                Colors.black
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              
              const Text(
                'Unlimited movies, TV \n shows, and more.',
                style:  TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Watch anywhere. Cancel anytime.',
                style:  TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Ready to watch? Enter your email to create or restart your membership.',
                style:  TextStyle(color: Colors.white, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  width: 600,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.black),
                          autocorrect: false,
                          
                          decoration: const InputDecoration(
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email address',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/main');
                        },
                        style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 244, 29, 26),
                            fixedSize: const Size(180, 50)),
                        child:   Padding(
                          padding:   const EdgeInsets.all(8),
                          child: Row(
                            children: const [
                               Icon(Icons.arrow_forward_ios,size: 15,),
                              
                               Text(
                                'Get Started',
                                style:  TextStyle(
                                    color: Colors.white, fontSize: 20),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  )),
                  const SizedBox(height: 100,)
            ],
          ),
        )
      ],
    );
  }
}
