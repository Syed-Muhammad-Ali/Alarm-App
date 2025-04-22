import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:alarm_app/views/widget/app_textfield.dart';
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:just_audio/just_audio.dart';

class SendSoundsPage extends StatefulWidget {
  const SendSoundsPage({super.key});

  @override
  State<SendSoundsPage> createState() => _SendSoundsPageState();
}

class _SendSoundsPageState extends State<SendSoundsPage> {
   final searchCtrl = TextEditingController();
  final List<String> audioTitles = [
    'I Don’t Care',
    'Stay With Me',
    'Let Her Go',
    'Shivers',
  ];

  final List<String> audioPaths = [
    'assets/images/sample.mp3',
    'assets/images/sample.mp3',
    'assets/images/sample.mp3',
    'assets/images/sample.mp3',
  ];

  final List<String> sentTo = [
    'Lady June',
    'Captain Ray',
    'Lady June',
    'Lady June',
  ];

  final List<double> ratings = [4.5, 4.0, 4.5, 4.5];

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

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          1.hSpace(context),
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
          Expanded(
            child: ListView.builder(
              itemCount: audioTitles.length,
              itemBuilder: (context, index) {
                final player = _players[index];
                final isPlaying =
                    currentlyPlayingIndex == index && player.playing;
                final progress =
                    _durations[index].inMilliseconds == 0
                        ? 0.0
                        : _positions[index].inMilliseconds /
                            _durations[index].inMilliseconds;
                return Container(
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
                              audioTitles[index],
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
                            Row(
                              children: [
                                AppText(
                                  'Sent To: ${sentTo[index]}',
                                  fontFamily: AppFontFamily.lato,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: ThemeColors.black,
                                ),
                                const SizedBox(width: 10),
                                AppText(
                                  ratings[index].toString(),
                                  fontFamily: AppFontFamily.lato,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: ThemeColors.black,
                                ),
                                const Icon(
                                  Icons.star,
                                  size: 14,
                                  color: ThemeColors.primaryColor,
                                ),
                                // const Spacer(),
                                // AppText(
                                //   'Local MP3',
                                //   fontFamily: AppFontFamily.lato,
                                //   fontSize: 10,
                                //   fontWeight: FontWeight.w400,
                                //   color: Colors.black54,
                                // ),
                              ],
                            ),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
