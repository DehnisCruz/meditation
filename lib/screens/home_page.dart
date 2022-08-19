import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

import '../models/item_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final AudioPlayer audioPlayer= AudioPlayer();
  int? _playingIndex;

  List<Item> items = [
    Item(
      name: 'Forest Sounds',
      imagePath: 'meditation_images/forest.jpeg',
      audioPath: 'meditation_audios/forest.mp3',
    ),
    Item(
      name: 'Night Sounds',
      imagePath: 'meditation_images/night.jpeg',
      audioPath: 'meditation_audios/night.mp3',
    ),
    Item(
      name: 'Ocean Waves',
      imagePath: 'meditation_images/waves.jpg',
      audioPath: 'meditation_audios/waves.mp3',
    ),
    Item(
      name: 'Waterfall',
      imagePath: 'meditation_images/quedas.jpg',
      audioPath: 'meditation_audios/waterfall.mp3',
    ),
    Item(
      name: 'Windy Day',
      imagePath: 'meditation_images/wind.jpeg',
      audioPath: 'meditation_audios/wind.mp3',
    ),
    Item(
      name: 'Birds',
      imagePath: 'meditation_images/birds.webp',
      audioPath: 'meditation_audios/Birds.mp3',
    ),
    Item(
      name: 'Rain',
      imagePath: 'meditation_images/rain.webp',
      audioPath: 'meditation_audios/rain.mp3',
    ),
    Item(
      name: 'Fireplace',
      imagePath: 'meditation_images/fireplace.jpg',
      audioPath: 'meditation_audios/fireplace.mp3',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Relax',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(items[index].imagePath),
                    ),
                  ),
                  child: ListTile(
                    leading: BorderedText(
                      strokeWidth: 4,
                      strokeColor: Colors.black,
                      child: Text(items[index].name,style:
                        GoogleFonts.adventPro(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    trailing: IconButton(
                      icon: _playingIndex == index ?
                      FaIcon(Icons.stop_circle_outlined, size: 30,):
                      FaIcon(Icons.play_circle_outline_outlined, size: 30,),
                      onPressed: () {
                        if(_playingIndex == index) {
                          setState(() {
                            _playingIndex = null;
                          });
                          audioPlayer.stop();
                        } else {
                          audioPlayer.setAsset(items[index].audioPath);
                          audioPlayer.play();

                          setState(() {
                            _playingIndex = index;
                          });
                        }
                      },
                    ),
                  )
                ),
              );
            }),
      ),
    );
  }
}

