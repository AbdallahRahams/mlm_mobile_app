import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:iconsax/iconsax.dart';
import '../../../app_colors.dart';
import '../../../text_styles.dart';
import 'trainingsPage.dart';

class TrainingVideoPage extends StatefulWidget {
  final Training training;

  const TrainingVideoPage({super.key, required this.training});

  @override
  _TrainingVideoPageState createState() => _TrainingVideoPageState();
}

class _TrainingVideoPageState extends State<TrainingVideoPage> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.training.videoUrl);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: false,
      errorBuilder: (context, errorMessage) {
        return Center(
          child: Text(
            errorMessage,
            style: AppTextStyles.bodyText1.copyWith(color: Colors.redAccent),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.training.title,
          style: AppTextStyles.heading2.copyWith(color: AppColors.primary),
        ),
        backgroundColor: AppColors.backgroundLight,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _chewieController != null && _chewieController!.videoPlayerController.value.isInitialized
                  ? Chewie(controller: _chewieController!)
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 20),
                        Text(
                          "Loading Video...",
                          style: AppTextStyles.bodyText1,
                        ),
                      ],
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Training Date: ${widget.training.date}",
                  style: AppTextStyles.bodyText2.copyWith(
                    color: Colors.grey,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  widget.training.status,
                  style: AppTextStyles.bodyText2.copyWith(
                    color: widget.training.status == "Completed" ? Colors.green : Colors.redAccent,
                    fontSize: screenWidth * 0.04,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}