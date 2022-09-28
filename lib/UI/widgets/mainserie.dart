import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netflix/UI/widgets/responsive.dart';
import 'package:netflix/UI/widgets/rowbuttons.dart';
import 'package:netflix/data/data.dart';
import 'package:netflix/data/models.dart';
import 'package:video_player/video_player.dart';

class ContentHeader extends StatelessWidget {
  final Serie mainserie;

  const ContentHeader({
    Key? key,
    required this.mainserie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: _ContentHeaderMobile(mainserie: mainserie),
      desktop: _ContentHeaderDesktop(),
    );
  }
}

class _ContentHeaderMobile extends StatefulWidget {
  final Serie mainserie;
  const _ContentHeaderMobile({
    Key? key,
    required this.mainserie,
  }) : super(key: key);

  @override
  State<_ContentHeaderMobile> createState() => _ContentHeaderMobileState();
}

class _ContentHeaderMobileState extends State<_ContentHeaderMobile> {
  late VideoPlayerController _videoController;

  late Timer timer;

  @override
  void initState() {
    super.initState();
    _videoController = VideoPlayerController.network(widget.mainserie.vidurl!)
      ..initialize().then((_) => setState(() {}))
      ..setVolume(50)
      ..play();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoController.value.isPlaying
          ? _videoController.pause()
          : _videoController.play(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 600.0,
            width: MediaQuery.of(context).size.width,
            child: _videoController.value.isInitialized
                ? VideoPlayer(_videoController)
                : Image.asset(
                    widget.mainserie.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Container(
            height: 600.0,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.black, Colors.transparent],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
              bottom: 100.0,
              child: Text(
                widget.mainserie.categories!.join('  ●   '),
                style: TextStyle(
                    color: Color.fromARGB(166, 255, 255, 255), fontSize: 12),
              )),
          Positioned(
            bottom: 110.0,
            child: SizedBox(
              width: 250.0,
              child: Image.asset(widget.mainserie.titleImageUrl!),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 40.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                rowbuttons(
                  icon: Icons.add,
                  title: 'List',
                  onTap: () => print('My List'),
                ),
                _PlayButton(),
                rowbuttons(
                  icon: Icons.info_outline,
                  title: 'Info',
                  onTap: () => print('Info'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ContentHeaderDesktop extends StatefulWidget {
  const _ContentHeaderDesktop({
    Key? key,
  }) : super(key: key);

  @override
  __ContentHeaderDesktopState createState() => __ContentHeaderDesktopState();
}

class __ContentHeaderDesktopState extends State<_ContentHeaderDesktop> {
  late VideoPlayerController vdcntoreel;
  bool _isMuted = true;
  Serie mainserie = voilet;
  @override
  void initState() {
    super.initState();
    vdcntoreel = VideoPlayerController.network(mainserie.vidurl!)
      ..initialize().then((_) => setState(() {}))
      ..setVolume(0)
      ..play();
  }

  @override
  void dispose() {
    vdcntoreel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => vdcntoreel.value.isPlaying
          ? vdcntoreel.pause()
          : vdcntoreel.play(),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
            aspectRatio: vdcntoreel.value.isInitialized
                ? vdcntoreel.value.aspectRatio
                : 2.344,
            child: vdcntoreel.value.isInitialized
                ? VideoPlayer(vdcntoreel)
                : Image.asset(
                    mainserie.imageUrl,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1.0,
            child: AspectRatio(
              aspectRatio: vdcntoreel.value.isInitialized
                  ? vdcntoreel.value.aspectRatio
                  : 2.344,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 60.0,
            right: 60.0,
            bottom: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 250.0,
                  child: Image.asset(mainserie.titleImageUrl!),
                ),
                const SizedBox(height: 15.0),
                SizedBox(
                  width: 300,
                  child: Text(
                    mainserie.des!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(2.0, 4.0),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(160, 40), primary: Colors.white),
                      onPressed: () => print('Play'),
                      icon: const Icon(
                        Icons.play_arrow,
                        size: 30.0,
                        color: Colors.black,
                      ),
                      label: const Text(
                        'Play',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(160, 40),
                          primary: Colors.grey.withOpacity(0.4)),
                      onPressed: () => print('More Info'),
                      icon: const Icon(
                        Icons.info_outline_rounded,
                        size: 30.0,
                        color: Colors.white,
                      ),
                      label: const Text(
                        'More Info',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    if (vdcntoreel.value.isInitialized)
                      IconButton(
                        icon: Icon(
                          _isMuted ? Icons.volume_off : Icons.volume_up,
                        ),
                        color: Colors.white,
                        iconSize: 30.0,
                        onPressed: () => setState(() {
                          _isMuted
                              ? vdcntoreel.setVolume(100)
                              : vdcntoreel.setVolume(0);
                          _isMuted = vdcntoreel.value.volume == 0;
                        }),
                      ),
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

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(primary: Colors.white),
      onPressed: () => print('Play'),
      icon: const Icon(
        Icons.play_arrow,
        size: 30.0,
        color: Colors.black,
      ),
      label: const Text(
        'Play',
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
