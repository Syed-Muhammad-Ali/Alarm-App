import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/widget/app_bar.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:alarm_app/views/widget/app_textfield.dart';
import 'package:alarm_app/views/widget/button.dart';
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';

class ShareSoundsPage extends StatefulWidget {
  const ShareSoundsPage({super.key});

  @override
  State<ShareSoundsPage> createState() => _ShareSoundsPageState();
}

class _ShareSoundsPageState extends State<ShareSoundsPage> {
  final searchCtrl = TextEditingController();
  final List<String> audioPaths = ['assets/images/sample.mp3'];

  int? currentlyPlayingIndex;
  final List<AudioPlayer> _players = [];
  final List<Duration> _durations = [];
  final List<Duration> _positions = [];

  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _initPlayers();
  }

  Future<void> _initPlayers() async {
    for (var path in audioPaths) {
      final player = AudioPlayer();
      try {
        await player.setAsset(path);
        _players.add(player);
        _durations.add(player.duration ?? Duration.zero);
        _positions.add(Duration.zero);

        final index = _players.length - 1;

        player.positionStream.listen((pos) {
          if (mounted) {
            setState(() => _positions[index] = pos);
          }
        });

        player.playerStateStream.listen((state) {
          if (state.processingState == ProcessingState.completed) {
            player.seek(Duration.zero);
            if (mounted) {
              setState(() => currentlyPlayingIndex = null);
            }
          }
        });
      } catch (e) {
        debugPrint('Audio load error: $e');
      }
    }

    if (mounted) {
      setState(() => _isInitialized = true);
    }
  }

  String _formatDuration(Duration d) {
    return DateFormat('m:ss').format(DateTime(0).add(d));
  }

  @override
  void dispose() {
    for (var player in _players) {
      player.dispose();
    }
    super.dispose();
  }

  final List<Map<String, String>> requestList = [
    {
      'name': 'Abinaya Pillai',
      'followers': '293 Followers',
      'imagePath': 'assets/images/pic7.jpeg',
    },
    {
      'name': 'Abinaya Pillai',
      'followers': '293 Followers',
      'imagePath': 'assets/images/pic3.jpeg',
    },
    {
      'name': 'Abinaya Pillai',
      'followers': '293 Followers',
      'imagePath': 'assets/images/pic3.jpeg',
    },
    {
      'name': 'Abinaya Pillai',
      'followers': '293 Followers',
      'imagePath': 'assets/images/pic5.jpeg',
    },
    {
      'name': 'Abinaya Pillai',
      'followers': '293 Followers',
      'imagePath': 'assets/images/pic4.jpeg',
    },
    {
      'name': 'Abinaya Pillai',
      'followers': '293 Followers',
      'imagePath': 'assets/images/pic3.jpeg',
    },
  ];
  final Set<int> selectedIndexes = {};
  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final int index = 0;
    final player = _players[index];
    final isPlaying = currentlyPlayingIndex == index && player.playing;
    final progress =
        _durations[index].inMilliseconds == 0
            ? 0.0
            : _positions[index].inMilliseconds /
                _durations[index].inMilliseconds;
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: ThemeColors.appGradient),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(title: 'Share Sound'),
                4.hSpace(context),
                AppTextfield(
                  hint: "Search Here",
                  ctr: searchCtrl,
                  textInputType: TextInputType.name,
                  autofillHints: const [AutofillHints.name],
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 6),
                    child: SvgPicture.asset("assets/icons/search.svg"),
                  ),
                ),
                2.hSpace(context),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.43),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: context.w * 0.18,
                        height: context.h * 0.08,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: SvgPicture.asset(
                              "assets/icons/sounds-icon.svg",
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      2.wSpace(context),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              "I Don’t Care",
                              fontFamily: AppFontFamily.lato,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: ThemeColors.black,
                            ),
                            1.hSpace(context),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    if (isPlaying) {
                                      await player.pause();
                                      setState(
                                        () => currentlyPlayingIndex = null,
                                      );
                                    } else {
                                      if (currentlyPlayingIndex != null &&
                                          currentlyPlayingIndex != index) {
                                        await _players[currentlyPlayingIndex!]
                                            .pause();
                                      }
                                      await player.play();
                                      setState(
                                        () => currentlyPlayingIndex = index,
                                      );
                                    }
                                  },
                                  child: SvgPicture.asset(
                                    isPlaying
                                        ? "assets/icons/pause.svg"
                                        : "assets/icons/play.svg",
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: LinearProgressIndicator(
                                    value: progress.toDouble(),
                                    backgroundColor: const Color(0xff949292),
                                    color: ThemeColors.primaryColor,
                                    minHeight: 4,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                AppText(
                                  _formatDuration(_positions[index]),
                                  fontFamily: AppFontFamily.lato,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                  color: ThemeColors.black,
                                ),
                              ],
                            ),
                            const SizedBox(height: 4),
                            // Row(
                            //   children: [
                            //     const Spacer(),
                            //     AppText(
                            //       'Local MP3',
                            //       fontFamily: AppFontFamily.lato,
                            //       fontSize: 10,
                            //       fontWeight: FontWeight.w400,
                            //       color: Colors.black54,
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 6),
                      const Icon(
                        Icons.more_vert,
                        size: 22,
                        color: ThemeColors.black,
                      ),
                    ],
                  ),
                ),
                2.hSpace(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      "Share with your friends",
                      fontFamily: AppFontFamily.inter,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: ThemeColors.black,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: AppText(
                        'View All',
                        fontFamily: AppFontFamily.inter,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: ThemeColors.viewColor,
                        decorationColor: ThemeColors.viewColor,
                        textDecoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                3.hSpace(context),
                Expanded(
                  child: ListView.builder(
                    itemCount: requestList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final request = requestList[index];
                      final isSelected = selectedIndexes.contains(index);
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  request['imagePath']!,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),

                            SizedBox(width: context.h * 0.02),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    request['name']!,
                                    fontFamily: AppFontFamily.roboto,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: ThemeColors.black,
                                  ),
                                  AppText(
                                    request['followers']!,
                                    fontFamily: AppFontFamily.roboto,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeColors.black,
                                  ),
                                ],
                              ),
                            ),
                            AppButton(
                              label: isSelected ? "Selected" : "Select",
                              height: 40,
                              width: 100,
                              radius: 6,
                              txtSize: 14,
                              weight: FontWeight.w600,
                              txtClr:
                                  isSelected
                                      ? ThemeColors.white
                                      : ThemeColors.white,
                              backgroundColor:
                                  isSelected
                                      ? ThemeColors.primaryColor
                                      : Colors.transparent,
                              border:
                                  isSelected
                                      ? null
                                      : Border.all(
                                        color: Colors.white,
                                        width: 1.2,
                                      ),
                              ontap: () {
                                setState(() {
                                  if (isSelected) {
                                    selectedIndexes.remove(index);
                                  } else {
                                    selectedIndexes.add(index);
                                  }
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                2.hSpace(context),
                Center(
                  child: AppButton(
                    width: context.w * 0.35,
                    height: context.h * 0.05,
                    ontap: () {},
                    label: "Share",
                    radius: 4,
                    txtClr: ThemeColors.white,
                    txtSize: 14,
                    weight: FontWeight.w400,
                    backgroundColor: ThemeColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
