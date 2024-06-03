import 'package:_provider/component/drawer.dart';
import 'package:_provider/models/playlist_provder.dart';
import 'package:_provider/models/song.dart';
import 'package:_provider/pages/song_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //get the playlist provider
  late final dynamic playlistProvider;
  @override
  void initState() {
    super.initState();

    //get playlist provider
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  //go to a son
  void goToSong(int songIndex) {
    playlistProvider.currentSongIndex = songIndex;

    //navigator to song page

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SongPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text("P L A Y L I S T"),
        ),
        drawer: const MyDrawer(),
        body: Consumer<PlaylistProvider>(builder: (context, value, child) {
          //get the playlist
          final List<Song> playlist = value.playlist;

          //return list view UI

          return ListView.builder(
              itemCount: playlist.length,
              itemBuilder: (context, index) {
                // get individual song
                final Song song = playlist[index];
                return ListTile(
                  title: Text(song.songName),
                  subtitle: Text(song.artistName),
                  leading: Image.asset(song.albumArtImagePath),
                  onTap: () => goToSong(index),
                );
              });
        }));
  }
}
