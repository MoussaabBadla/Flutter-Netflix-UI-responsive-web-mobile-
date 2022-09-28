import 'package:flutter/material.dart';

import 'package:netflix/UI/widgets/responsive.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  final bool isgetStarted;

  const CustomAppBar({
    Key? key,
    this.scrollOffset = 0.0,
    required this.isgetStarted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 8
      ),
      color:
          Colors.black.withOpacity((scrollOffset*0.3 / 350).clamp(0, 1).toDouble()),
      child: !isgetStarted
          ? Responsive(
              mobile: _AppBarMobile(scrollOffset),
              desktop: _AppBarDesktop(),
            )
          : Responsive(
              mobile: _GetStarterAppBarMobile(),
              desktop: _GetStartedAppBarDesktop()),
    );
  }
}

class _GetStarterAppBarMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var items = [
      'FAQs',
      'HELP',
    ];

    return SafeArea(
      child: Row(
        children: [
          Image.asset('images/netflix_logo0.png'),
          const SizedBox(
            width: 120,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _AppBarButton(
                  title: 'PRIVACY',
                  onTap: () => print('PRIVACY'),
                  size: 14,
                ),
                _AppBarButton(
                  title: 'SIGN IN',
                  onTap: () => print('SIGN IN'),
                  size: 14,
                ),
                SizedBox(
                  width: 30,
                  child: DropdownButton(
                      isExpanded: true,
                      underline: const SizedBox(),
                      icon: const Icon(
                        Icons.more_vert,
                        color: Colors.grey,
                      ),
                      elevation: 0,
                      iconSize: 22,
                      items: items.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: const TextStyle(fontSize: 14),
                          ),
                        );
                      }).toList(),
                      onChanged: (dynamic) {}),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarMobile extends StatelessWidget {
  final double scrollofsset;
  const _AppBarMobile(this.scrollofsset);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          if (scrollofsset <= 500)
            Expanded(
              child: Row(
                children: [
                  Image.asset(
                    'images/netflix_logo0.png',
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.6,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.white,
                        ),
                        Container(
                            width: 20,
                            height: 20,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset('images/userimage.jpg')))
                      ],
                    ),
                  )
                ],
              ),
            ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: 'TV Shows',
                  onTap: () => print('TV Shows'),
                  size: 16,
                ),
                _AppBarButton(
                  title: 'Movies',
                  onTap: () => print('Movies'),
                  size: 16,
                ),
                Row(
                  children: [
                    _AppBarButton(
                      title: 'Categories',
                      onTap: () => print('My List'),
                      size: 16,
                    ),
                    const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GetStartedAppBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Image(image: AssetImage('images/netflix_logo1.png')),
          SizedBox(width: MediaQuery.of(context).size.width * 0.65),
          Expanded(
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2.0),
                      color:
                          Colors.black.withOpacity((0).clamp(0, 1).toDouble())),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    child: Row(children: const [
                      Icon(
                        Icons.language,
                        color: Colors.white,
                      ),
                      Text(
                        'English',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                    ]),
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                      'Sing In',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 244, 29, 26),
                      fixedSize: const Size(100, 70)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          const Image(image: AssetImage('images/netflix_logo1.png')),
          const SizedBox(width: 12.0),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(
                  title: 'Home',
                  onTap: () => print('Home'),
                  size: 16,
                ),
                _AppBarButton(
                  title: 'TV Shows',
                  onTap: () => print('TV Shows'),
                  size: 16,
                ),
                _AppBarButton(
                  title: 'Movies',
                  onTap: () => print('Movies'),
                  size: 16,
                ),
                _AppBarButton(
                  title: 'Latest',
                  onTap: () => print('Latest'),
                  size: 16,
                ),
                _AppBarButton(
                  title: 'My List',
                  onTap: () => print('My List'),
                  size: 16,
                ),
              ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.search),
                  iconSize: 28.0,
                  color: Colors.white,
                  onPressed: () => print('Search'),
                ),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: const Icon(Icons.notifications),
                  iconSize: 28.0,
                  color: Colors.white,
                  onPressed: () => print('Notifications'),
                ),
                Container(
                    width: 50,
                    height: 20,
                    child: Row(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              'images/userimage.jpg',
                              width: 25,
                            )),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        )
                      ],
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AppBarButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final double size;

  const _AppBarButton(
      {Key? key, required this.title, required this.onTap, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: size,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
