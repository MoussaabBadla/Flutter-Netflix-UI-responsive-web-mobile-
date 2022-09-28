import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttericon/elusive_icons.dart';
import 'package:fluttericon/font_awesome_icons.dart';
import 'package:fluttericon/fontelico_icons.dart';
import 'package:netflix/data/data.dart';

import '../../cubit.dart';
import '../widgets/mainserie.dart';
import '../widgets/myappbar.dart';
import '../widgets/mylist.dart';
import '../widgets/mylist2.dart';
import '../widgets/responsive.dart';

class NavScreen extends StatefulWidget {
  @override
  _NavScreenState createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  final List<Widget> _screens = [
    const HomeScreen(key: PageStorageKey('homeScreen')),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
    const Scaffold(),
  ];

  final Map<String, IconData> _icons = const {
    'Home': Icons.home,
    'Games': FontAwesome.gamepad,
    'New & Hot': Icons.queue_play_next,
    'Fast Laughs': Fontelico.emo_laugh,
    'Downloads': Elusive.download,
  };

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<AppBarCubit>(
            create: (_) => AppBarCubit(),
          ),
          BlocProvider<AppBarSize>(create: (_) => AppBarSize())
        ],
        child: _screens[_currentIndex],
      ),
      bottomNavigationBar: !Responsive.isDesktop(context)
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.black,
              items: _icons
                  .map((title, icon) => MapEntry(
                      title,
                      BottomNavigationBarItem(
                        icon: Icon(icon, size: 30.0),
                        label: title,
                      )))
                  .values
                  .toList(),
              currentIndex: _currentIndex,
              selectedItemColor: Colors.white,
              selectedFontSize: 11.0,
              unselectedItemColor: Colors.grey,
              unselectedFontSize: 11.0,
              onTap: (index) => setState(() => _currentIndex = index),
            )
          : null,
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        BlocProvider.of<AppBarCubit>(context)
            .setOffset(_scrollController.offset);
        BlocProvider.of<AppBarSize>(context).setsize(
            _scrollController.offset, MediaQuery.of(context).size.width);
      });

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return BlocBuilder<AppBarSize, double>(
      builder: (context, size) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: PreferredSize(
              preferredSize: Size(screenSize.width, size),
              child: BlocBuilder<AppBarCubit, double>(
                builder: (context, scrollOffset) {
                  return CustomAppBar(
                    scrollOffset: scrollOffset,
                    isgetStarted: false,
                  );
                },
              )),
          body: CustomScrollView(
            controller: _scrollController,
            slivers: const [
              SliverToBoxAdapter(
                child: ContentHeader(mainserie: thewitcher),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 20.0),
                sliver: SliverToBoxAdapter(
                  child: Previews(
                    key: PageStorageKey('previews'),
                    title: 'Resume with Mossaab ',
                    contentList: lastview,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: ContentList(
                  key: PageStorageKey('myList'),
                  title: 'My List',
                  contentList: mylist,
                ),
              ),
              SliverToBoxAdapter(
                child: ContentList(
                  key: PageStorageKey('originals'),
                  title: 'Netflix Originals',
                  contentList: originals,
                  original: true,
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(bottom: 20.0),
                sliver: SliverToBoxAdapter(
                  child: ContentList(
                    key: PageStorageKey('trending'),
                    title: 'Trending',
                    contentList: trending,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
