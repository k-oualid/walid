import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  const Player({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
      ),
      body: AspectRatio(
        aspectRatio:16/9 ,
        child: BetterPlayer.network(
            "link of vedio mp4 ",
            betterPlayerConfiguration: BetterPlayerConfiguration(
              aspectRatio: 16/9,
            )
        ),
      ),
    );
  }
}
