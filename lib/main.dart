import 'package:alarm_app/res/routes/routes.dart';
import 'package:alarm_app/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RouteName.onboardingPage,
      getPages: AppRoutes.appRoutes(),
    );
  }
}

class VoiceRecorderPage extends StatefulWidget {
  const VoiceRecorderPage({super.key});

  @override
  State<VoiceRecorderPage> createState() => _VoiceRecorderPageState();
}

class _VoiceRecorderPageState extends State<VoiceRecorderPage> {
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
              backgroundColor: Colors.grey[850],
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
                            color: Colors.orange,
                            size: 80,
                          ),
                          const SizedBox(height: 10),
                          IconButton(
                            iconSize: 48,
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
                          Text(
                            _isRecording
                                ? "Recording..."
                                : "Press and Hold To Record",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      )
                    else
                      Column(
                        children: [
                          TextField(
                            controller: _titleController,
                            decoration: const InputDecoration(
                              hintText: "Give Title",
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Icon(
                            Icons.multitrack_audio,
                            color: Colors.orange,
                            size: 40,
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                iconSize: 48,
                                icon: const Icon(
                                  Icons.replay,
                                  color: Colors.orange,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _filePath = null;
                                    _titleController.clear();
                                  });
                                  Navigator.of(context).pop();
                                  _showRecordingDialog();
                                },
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                iconSize: 48,
                                icon: Icon(
                                  _isPlaying ? Icons.stop : Icons.play_arrow,
                                  color: Colors.orange,
                                ),
                                onPressed: () async {
                                  if (_isPlaying) {
                                    await _stopPlayback();
                                  } else {
                                    await _playRecording();
                                  }
                                  setModalState(() {});
                                },
                              ),
                              const SizedBox(width: 10),
                              IconButton(
                                iconSize: 48,
                                icon: const Icon(
                                  Icons.save,
                                  color: Colors.orange,
                                ),
                                onPressed: () {
                                  if (_filePath != null &&
                                      _titleController.text.isNotEmpty) {
                                    // Save or upload logic here
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
  void dispose() {
    _audioRecorder.dispose();
    _audioPlayer.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[300],
      body: const Center(
        child: Text(
          "Floating Menu with Recorder UI",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.add,
        activeIcon: Icons.close,
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Rounded square shape
        ),
        buttonSize: const Size(56, 56), // Circular size
        elevation: 6.0,

        children: [
          SpeedDialChild(
            child: const Icon(Icons.mic, color: Colors.orange),
            label: 'Record',
            labelStyle: const TextStyle(color: Colors.black),
            onTap: _showRecordingDialog,
          ),
          SpeedDialChild(
            child: const Icon(Icons.music_note, color: Colors.orange),
            label: 'Local',
            labelStyle: const TextStyle(color: Colors.black),
            onTap: () {}, // Future logic
          ),
        ],
      ),
    );
  }
}
