import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:just_audio/just_audio.dart';
import 'package:ram_mandir_app/Bloc/music_cubit.dart';
import 'package:ram_mandir_app/data/app_data/music.dart';
import 'package:ram_mandir_app/data/models/music.dart';
import 'package:size_config/size_config.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage>
    with SingleTickerProviderStateMixin {
  List<Music> bhajans = [];
  @override
  void initState() {
    //initialize controller
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    player.dispose();
    super.dispose();
  }

  final player = AudioPlayer();
  int state = 0;

  late AnimationController controller;

  setPlayer(int state, List<Music> bhajans) async {
    await player.setAsset(bhajans[state].audioPath) ?? const Duration();
  }

  double currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    final bhajans = getBhajans(context);
    setPlayer(state, bhajans);
    return BlocProvider(
      create: (context) => MusicCubit(),
      child: PopScope(
        onPopInvoked: (didPop) {
          player.stop();
        },
        child: Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniStartTop,
          floatingActionButton: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
          body: BlocBuilder<MusicCubit, int>(
            builder: (context, state) {
              return LayoutBuilder(builder: (context, constraints) {
                return Container(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(bhajans[state].imageUrl),
                          fit: BoxFit.fill)),
                  child: GlassmorphicContainer(
                    width: constraints.maxWidth * 0.9,
                    height: constraints.maxHeight * 0.9,
                    borderRadius: 20,
                    blur: 5,
                    alignment: Alignment.center,
                    border: 2,
                    linearGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.1),
                          const Color(0xFFFFFFFF).withOpacity(0.05),
                        ],
                        stops: const [
                          0.1,
                          1,
                        ]),
                    borderGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        const Color(0xFFffffff).withOpacity(0.5),
                        const Color((0xFFFFFFFF)).withOpacity(0.5),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 50.h),
                        Image.asset(
                          bhajans[state].imageUrl,
                          width: constraints.maxWidth * 0.6,
                          height: constraints.maxHeight * 0.4,
                        ),
                        Text(
                          "\"${bhajans[state].title}\"",
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "- ${bhajans[state].singer}",
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 50.h),
                        StreamBuilder<Duration?>(
                            stream: player.positionStream,
                            builder: (context, snapshot) {
                              if (snapshot.data?.inSeconds ==
                                  bhajans[state].duration.inSeconds) {
                                WidgetsBinding.instance.addPostFrameCallback(
                                  (timeStamp) {
                                    BlocProvider.of<MusicCubit>(context)
                                        .setIndex((state + 1) % bhajans.length);
                                    setPlayer(state, bhajans);
                                    player.seek(const Duration());
                                  },
                                );
                              }
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${(snapshot.data?.inMinutes ?? 0).floor()}:${((snapshot.data?.inSeconds ?? 0) % 60) < 10 ? "0" : ""}${(snapshot.data?.inSeconds ?? 0) % 60}",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Slider(
                                    value:
                                        snapshot.data?.inSeconds.toDouble() ??
                                            0,
                                    divisions:
                                        bhajans[state].duration.inSeconds,
                                    activeColor: Colors.black,
                                    thumbColor: Colors.white,
                                    label:
                                        "${(snapshot.data?.inMinutes ?? 0 / 60).floor()}:${((snapshot.data?.inSeconds ?? 0) % 60) < 10 ? "0" : ""}${(snapshot.data?.inSeconds ?? 0) % 60}",
                                    max: bhajans[state]
                                        .duration
                                        .inSeconds
                                        .toDouble(),
                                    onChanged: (double newvalue) {
                                      // setState(() {
                                      player.seek(
                                          Duration(seconds: newvalue.toInt()));
                                      // });
                                    },
                                  ),
                                  Text(
                                      "${bhajans[state].duration.inMinutes}:${bhajans[state].duration.inSeconds % 60 < 10 ? "0${bhajans[state].duration.inSeconds % 60}" : bhajans[state].duration.inSeconds % 60}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ],
                              );
                            }),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                color: Colors.black,
                                icon: const Icon(
                                  Icons.skip_previous,
                                  size: 40,
                                ),
                                onPressed: state == 0
                                    ? null
                                    : () async {
                                        await player.seek(Duration.zero);
                                        await player.stop();
                                        BlocProvider.of<MusicCubit>(context)
                                            .setIndex(--state);

                                        await player
                                            .setAsset(bhajans[state].audioPath);
                                        await player.play();
                                      },
                              ),
                              IconButton(
                                  onPressed: () async {
                                    if (player.playing) {
                                      setState(() {
                                        controller.reverse();
                                      });
                                      await player.pause();
                                    } else {
                                      setState(() {
                                        controller.forward();
                                      });
                                      await player.play();
                                    }
                                  },
                                  icon: AnimatedIcon(
                                    icon: AnimatedIcons.play_pause,
                                    progress: controller,
                                    color: Colors.black,
                                    size: 40,
                                  )),
                              IconButton(
                                icon: const Icon(
                                  Icons.skip_next,
                                  size: 40,
                                ),
                                color: Colors.black,
                                onPressed: state == bhajans.length - 1
                                    ? null
                                    : () async {
                                        await player.seek(Duration.zero);
                                        await player.stop();
                                        BlocProvider.of<MusicCubit>(context)
                                            .setIndex(++state);
                                        await player
                                            .setAsset(bhajans[state].audioPath);
                                        await player.play();
                                      },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
