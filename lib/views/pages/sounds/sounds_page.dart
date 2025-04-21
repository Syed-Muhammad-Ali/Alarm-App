// ignore_for_file: deprecated_member_use

import 'package:alarm_app/res/routes/routes_name.dart';
import 'package:alarm_app/res/theme/theme_color.dart';
import 'package:alarm_app/views/pages/sounds/all_sounds/all_sounds_page.dart';
import 'package:alarm_app/views/pages/sounds/received_sounds/received_sounds_page.dart';
import 'package:alarm_app/views/pages/sounds/send_sounds/send_sounds_page.dart';
import 'package:alarm_app/views/widget/app_text.dart';
import 'package:alarm_app/views/widget/app_textfield.dart';
import 'package:alarm_app/views/widget/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

class SoundsPage extends StatefulWidget {
  const SoundsPage({super.key});

  @override
  State<SoundsPage> createState() => _SoundsPageState();
}

class _SoundsPageState extends State<SoundsPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  final AudioRecorder _audioRecorder = AudioRecorder();
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isRecording = false;
  bool _isPlaying = false;
  String? _filePath;
  final TextEditingController _titleController = TextEditingController();

  Future<void> _checkPermission() async {
    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw Exception('Microphone permission not granted');
    }
  }

  Future<void> _startRecording() async {
    await _checkPermission();

    final directory = await getApplicationDocumentsDirectory();
    final path =
        '${directory.path}/audio_${DateTime.now().millisecondsSinceEpoch}.m4a';
    _filePath = path;

    await _audioRecorder.start(
      const RecordConfig(encoder: AudioEncoder.aacLc),
      path: path,
    );

    setState(() {
      _isRecording = true;
    });
  }

  Future<void> _stopRecording() async {
    await _audioRecorder.stop();
    setState(() {
      _isRecording = false;
    });
  }

  Future<void> _playRecording() async {
    if (_filePath == null) return;
    await _audioPlayer.setFilePath(_filePath!);
    _audioPlayer.play();
    setState(() {
      _isPlaying = true;
    });

    _audioPlayer.playerStateStream.listen((state) {
      if (state.processingState == ProcessingState.completed) {
        setState(() {
          _isPlaying = false;
        });
      }
    });
  }

  Future<void> _stopPlayback() async {
    await _audioPlayer.stop();
    setState(() {
      _isPlaying = false;
    });
  }

  void _showRecordingDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return AlertDialog(
              backgroundColor: ThemeColors.grey,
              content: SizedBox(
                height: 240,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_filePath == null || _isRecording)
                      Column(
                        children: [
                          const SizedBox(height: 20),
                          const Icon(
                            Icons.multitrack_audio,
                            color: ThemeColors.primaryColor,
                            size: 80,
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: ThemeColors.primaryColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: IconButton(
                              iconSize: 36,
                              icon: Icon(
                                _isRecording ? Icons.stop : Icons.mic,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                if (_isRecording) {
                                  await _stopRecording();
                                } else {
                                  await _startRecording();
                                }
                                setModalState(() {});
                              },
                            ),
                          ),
                          const SizedBox(height: 20),
                          AppText(
                            _isRecording
                                ? "Recording..."
                                : "Press and Hold To Record",
                            fontFamily: AppFontFamily.lato,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ],
                      )
                    else
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteName.shareSoundsPage);
                              },
                              child: SvgPicture.asset("assets/icons/share.svg"),
                            ),
                          ),
                          2.hSpace(context),
                          AppTextfield(
                            hint: "Give Title",
                            ctr: _titleController,
                            textInputType: TextInputType.name,
                            autofillHints: const [AutofillHints.name],
                            cursorColor: ThemeColors.primaryColor,
                          ),

                          1.hSpace(context),
                          const Icon(
                            Icons.multitrack_audio,
                            color: ThemeColors.primaryColor,
                            size: 40,
                          ),
                          3.hSpace(context),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _buildActionIcon(
                                icon: Icons.replay,
                                bgColor: ThemeColors.primaryColor.withOpacity(
                                  0.28,
                                ),
                                iconColor: ThemeColors.primaryColor,
                                onTap: () {
                                  setState(() {
                                    _filePath = null;
                                    _titleController.clear();
                                  });
                                  Navigator.of(context).pop();
                                  _showRecordingDialog();
                                },
                              ),
                              const SizedBox(width: 16),
                              _buildActionIcon(
                                icon:
                                    _isPlaying ? Icons.stop : Icons.play_arrow,
                                bgColor: ThemeColors.primaryColor,
                                iconColor: ThemeColors.white,
                                onTap: () async {
                                  if (_isPlaying) {
                                    await _stopPlayback();
                                  } else {
                                    await _playRecording();
                                  }
                                  setModalState(() {});
                                },
                              ),
                              const SizedBox(width: 16),
                              _buildActionIcon(
                                icon: Icons.save,
                                bgColor: ThemeColors.primaryColor,
                                iconColor: ThemeColors.white,
                                onTap: () {
                                  if (_filePath != null &&
                                      _titleController.text.isNotEmpty) {
                                    Navigator.of(context).pop();
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(gradient: ThemeColors.appGradient),
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: AppText(
                        'Alarm',
                        fontFamily: AppFontFamily.roboto,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: ThemeColors.black,
                      ),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: 12,
                    //     vertical: 10,
                    //   ),
                    //   decoration: BoxDecoration(
                    //     color: Colors.white.withOpacity(0.25),
                    //     borderRadius: BorderRadius.circular(16),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       Container(
                    //         width: 60,
                    //         height: 60,
                    //         decoration: BoxDecoration(
                    //           color: Colors.white,
                    //           borderRadius: BorderRadius.circular(10),
                    //         ),
                    //         child: const Icon(
                    //           Icons.music_note,
                    //           color: Colors.orange,
                    //           size: 30,
                    //         ),
                    //       ),
                    //       const SizedBox(width: 12),
                    //       Expanded(
                    //         child: Column(
                    //           crossAxisAlignment: CrossAxisAlignment.start,
                    //           children: [
                    //             const Text(
                    //               'I Don’t Care',
                    //               style: TextStyle(
                    //                 fontSize: 16,
                    //                 fontWeight: FontWeight.bold,
                    //                 color: Colors.black,
                    //               ),
                    //             ),
                    //             const SizedBox(height: 6),
                    //             Row(
                    //               children: [
                    //                 GestureDetector(
                    //                   onTap: () {
                    //                     if (_isPlaying) {
                    //                       _audioPlayer.pause();
                    //                     } else {
                    //                       _audioPlayer.play();
                    //                     }
                    //                   },
                    //                   child: Icon(
                    //                     _isPlaying
                    //                         ? Icons.pause_circle
                    //                         : Icons.play_circle,
                    //                     color: Colors.orange,
                    //                     size: 24,
                    //                   ),
                    //                 ),
                    //                 const SizedBox(width: 8),
                    //                 Expanded(
                    //                   child: LinearProgressIndicator(
                    //                     value:
                    //                         _position.inMilliseconds /
                    //                         (_duration.inMilliseconds == 0
                    //                             ? 1
                    //                             : _duration.inMilliseconds),
                    //                     backgroundColor: Colors.grey.shade300,
                    //                     color: Colors.grey.shade600,
                    //                     minHeight: 4,
                    //                   ),
                    //                 ),
                    //                 const SizedBox(width: 8),
                    //                 Text(
                    //                   _formatDuration(_position),
                    //                   style: const TextStyle(
                    //                     fontSize: 12,
                    //                     color: Colors.black,
                    //                   ),
                    //                 ),
                    //               ],
                    //             ),
                    //             const SizedBox(height: 4),
                    //             const Text(
                    //               'Recording',
                    //               style: TextStyle(
                    //                 fontSize: 12,
                    //                 color: Colors.black45,
                    //               ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    2.hSpace(context),
                    TabBar(
                      controller: _tabController,
                      labelColor: ThemeColors.secondaryColor,
                      unselectedLabelColor: ThemeColors.white,
                      indicatorColor: ThemeColors.secondaryColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      indicator: const UnderlineTabIndicator(
                        borderSide: BorderSide(
                          // width: 3.0,
                          color: ThemeColors.secondaryColor,
                        ),
                        insets: EdgeInsets.symmetric(horizontal: 80),
                      ),
                      indicatorWeight: 3,
                      tabs: const [
                        Tab(text: "All"),
                        Tab(text: "Send"),
                        Tab(text: "Received"),
                      ],
                    ),
                    Flexible(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          AllSoundsPage(),
                          SendSoundsPage(),
                          ReceivedSoundsPage(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: ThemeColors.primaryColor,
        foregroundColor: ThemeColors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        buttonSize: const Size(56, 56),
        elevation: 5.0,
        children: [
          SpeedDialChild(
            child: const Icon(
              Icons.music_note,
              color: ThemeColors.primaryColor,
            ),
            label: 'Local',
            labelStyle: const TextStyle(color: ThemeColors.black),
            onTap: () {},
          ),
          SpeedDialChild(
            child: const Icon(Icons.mic, color: ThemeColors.primaryColor),
            label: 'Record',
            labelStyle: const TextStyle(color: ThemeColors.black),
            onTap: _showRecordingDialog,
          ),
        ],
      ),
    );
  }

  Widget _buildActionIcon({
    required IconData icon,
    required Color bgColor,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Icon(icon, color: iconColor, size: 32),
      ),
    );
  }
}
