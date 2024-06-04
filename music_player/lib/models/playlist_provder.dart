import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:music_player/models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  //playlist of songs

  final List<Song> _playlist = [
    Song(
        albumArtImagePath: "lib/Images/bemeh.png",
        artistName: "Dawit Getachew",
        audioPath: "dave/01 Track 1.mp3",
        songName: "በምህረቱ"),
    Song(
        albumArtImagePath: "lib/Images/nafekalew.png",
        artistName: "Dawit Getachew",
        audioPath: "dave/02 Track 2.mp3",
        songName: "እናፍቃለሁ"),
    Song(
        albumArtImagePath: "lib/Images/shekemen.png",
        artistName: "Dawit Getachew",
        audioPath: "dave/03 Track 3000.mp3",
        songName: "ሸክሜን"),
    Song(
        albumArtImagePath: "lib/Images/tezeyelegnal.png",
        artistName: "Dawit Getachew",
        audioPath: "dave/04 Track 4.mp3",
        songName: "ትዝ ይለኛል"),
    Song(
        albumArtImagePath: "lib/Images/deges.png",
        artistName: "Dawit Getachew",
        audioPath: "dave/05 Track 5000.mp3",
        songName: "ድግስ አዘጋጅቷል"),
    Song(
        albumArtImagePath: "lib/Images/derogena.png",
        artistName: "Dawit Getachew",
        audioPath: "dave/06 Track 6.mp3",
        songName: "ድሮ ገና"),
    Song(
        albumArtImagePath: "lib/Images/etebeke.png",
        artistName: "Dawit Getachew",
        audioPath: "dave/07 Track 7000.mp3",
        songName: "ሁኔታዎችን አይቼ"),
    Song(
        albumArtImagePath: "lib/Images/keadmasbas.png",
        artistName: "Dawit Getachew",
        audioPath: "dave/08 Track 8.mp3",
        songName: "ከአድማስ ባሻገር"),
    Song(
        albumArtImagePath: "lib/Images/bemabelwes.png",
        artistName: "Dawit Getachew",
        audioPath: "dave/09 Track 9.mp3",
        songName: "በማዕበል ውስጥ ሆኖ"),
    Song(
        albumArtImagePath: "lib/Images/zelalem.png",
        artistName: "Dawit Getachew",
        audioPath: "assets/dave/10 Track 10.mp3",
        songName: "ዘላለም አይጠፋም"),
    Song(
        albumArtImagePath: "lib/Images/mekneyat alakerbem.png",
        artistName: "Dawit Getachew",
        audioPath: "dave/11 Track 11.mp3",
        songName: "ምክንያት አላቀርብም")
  ];

  // current song playing index
  int? _currentSongIndex;

  /*

  A U D I O P L A Y E R

  */
  // audio player
  final AudioPlayer _audioPlayer = AudioPlayer();

  // durations
  Duration _currentDuration = Duration.zero;
  Duration _totalDuration = Duration.zero;

  // constructor
  PlaylistProvider() {
    listenToDuration();
  }
  //initially not playing
  bool _isPlaying = false;

  // play the song
  void play() async {
    final String path = _playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop();
    await _audioPlayer.play(AssetSource(path));
    _isPlaying = true;
    notifyListeners();
  }

  // pause current song
  void pause() async {
    await _audioPlayer.pause();
    _isPlaying = false;
    notifyListeners();
  }

  // resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isPlaying = false;
    notifyListeners();
  }
  // pause or resume

  void pauseOrResume() async {
    if (_isPlaying) {
      pause();
    } else {
      resume();
    }
  }

  // seek  to a specific psition in the crrent song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // play next song
  void playNextSong() {
    if (_currentSongIndex! < _playlist.length - 1) {
      //go to the next song if it's not the last song
      currentSongIndex = _currentSongIndex! + 1;
    } else {
      //if it's the last song, loop back to the first song
      currentSongIndex = 0;
    }
  }

  // play previous song
  void playPreviouSong() async {
    // if more than 2 seconds have passed, restart the current song
    if (_currentDuration.inSeconds > 2) {
    }
    // if it's within first 2 scond of teh song, go to previous song

    else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        //if it's the first song, loop back to last song
        currentSongIndex = _playlist.length - 1;
      }
    }
  }

  // list to duration
  void listenToDuration() {
    // listen  for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDuration = newDuration;
      notifyListeners();
    });

    //listen for current duration

    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    //listen for song completion

    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }
  // dispose audio player

  /*
  GETTERS
  */

  List<Song> get playlist => _playlist;
  int? get currentSongIndex => _currentSongIndex;
  bool get isPlaying => _isPlaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDuration;
  /*
  S E T T E RS
  */

  set currentSongIndex(int? newIndex) {
    // update current song index
    _currentSongIndex = newIndex;
    if (newIndex != null) {
      play();
    }
    //update UI
    notifyListeners();
  }
}
