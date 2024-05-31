import 'package:_provider/models/song.dart';
import 'package:flutter/material.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs

  final List<Song> _playlist = [
    Song(
        albumArtImagePath: "lib/Images/Screenshot from 2024-05-31 12-49-18.png",
        artistName: "Dawit_gatachew",
        audioPath: "lib/dave/01 Track 1.mp3",
        songName: "Track 1"),
    Song(
        albumArtImagePath: "lib/Images/Screenshot from 2024-05-31 12-49-18.png",
        artistName: "Dawit_gatachew",
        audioPath: "lib/dave/02 Track 2.mp3",
        songName: "Track 2"),
    Song(
        albumArtImagePath: "lib/Images/Screenshot from 2024-05-31 12-49-18.png",
        artistName: "Dawit_gatachew",
        audioPath: "lib/dave/03 Track 3000.mp3",
        songName: "Track 3"),
    Song(
        albumArtImagePath: "lib/Images/Screenshot from 2024-05-31 12-49-18.png",
        artistName: "Dawit_gatachew",
        audioPath: "lib/dave/04 Track 4.mp3",
        songName: "Track 4"),
    Song(
        albumArtImagePath: "lib/Images/Screenshot from 2024-05-31 12-49-18.png",
        artistName: "Dawit_gatachew",
        audioPath: "lib/dave/05 Track 5000.mp3",
        songName: "Track "),
    Song(
        albumArtImagePath: "lib/Images/Screenshot from 2024-05-31 12-49-18.png",
        artistName: "Dawit_gatachew",
        audioPath: "lib/dave/06 Track 6.mp3",
        songName: "Track 1"),
    Song(
        albumArtImagePath: "lib/Images/Screenshot from 2024-05-31 12-49-18.png",
        artistName: "Dawit_gatachew",
        audioPath: "lib/dave/07 Track 7000.mp3",
        songName: "Track 7"),
    Song(
        albumArtImagePath: "lib/Images/Screenshot from 2024-05-31 12-49-18.png",
        artistName: "Dawit_gatachew",
        audioPath: "lib/dave/08 Track 8.mp3",
        songName: "Track 8"),
    Song(
        albumArtImagePath: "lib/Images/Screenshot from 2024-05-31 12-49-18.png",
        artistName: "Dawit_gatachew",
        audioPath: "lib/dave/09 Track 9.mp3",
        songName: "Track 9"),
    Song(
        albumArtImagePath: "lib/Images/Screenshot from 2024-05-31 12-49-18.png",
        artistName: "Dawit_gatachew",
        audioPath: "lib/dave/10 Track 10.mp3",
        songName: "Track 10")
  ];
}
