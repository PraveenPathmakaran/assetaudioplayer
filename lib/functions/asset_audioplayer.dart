//list of asset audio songs
import 'package:assets_audio_player/assets_audio_player.dart';

import 'design_funcions.dart';

List<Audio> audioSongsList = [
  Audio(
    'assets/images/Bathing-At-Cannes.mp3',
    metas: Metas(
      title: 'Bathing-At-Cannes',
      artist: 'Bathing-At-Cannes',
      image: MetasImage.asset('assets/music.png'),
    ),
  ),
  Audio(
    'assets/images/Beat-of-Master-(Instrumental)-MassTamilan.io.mp3',
    metas: Metas(
      title: 'Beat-of-Master-(Instrumental)-MassTamilan',
      artist: 'Beat-of-Master-(Instrumental)-MassTamilan',
      image: MetasImage.asset('assets/music.png'),
    ),
  ),
  Audio(
    'assets/images/Dhimu-Dhimu.mp3',
    metas: Metas(
      title: 'Dhimu-Dhimu',
      artist: 'Dhimu-Dhimu',
      image: MetasImage.asset('assets/music.png'),
    ),
  ),
  Audio(
    'assets/images/Engeyum-Kaadhal.mp3',
    metas: Metas(
      title: 'Engeyum-Kaadhal',
      artist: 'Engeyum-Kaadhal',
      image: MetasImage.asset('assets/music.png'),
    ),
  ),
  Audio(
    'assets/images/Kutti-Story-MassTamilan.io.mp3',
    metas: Metas(
      title: 'Kutti-Story-MassTamilan',
      artist: 'Kutti-Story-MassTamilan',
      image: MetasImage.asset('assets/music.png'),
    ),
  ),
  Audio(
    'assets/images/Lolita.mp3',
    metas: Metas(
      title: 'Lolita',
      artist: 'Lolita',
      image: MetasImage.asset('assets/music.png'),
    ),
  ),
  Audio(
    'assets/images/Master-the-Blaster-MassTamilan.io.mp3',
    metas: Metas(
      title: 'Master-the-Blaster-MassTamilan',
      artist: 'Master-the-Blaster-MassTamilan',
      image: MetasImage.asset('assets/music.png'),
    ),
  ),
  Audio(
    'assets/images/Nangaai.mp3',
    metas: Metas(
      title: 'Nangaai',
      artist: 'Nangaai',
      image: MetasImage.asset('assets/music.png'),
    ),
  ),
  Audio(
    'assets/images/Nenjil-Nenjil.mp3',
    metas: Metas(
      title: 'Nenjil-Nenjil',
      artist: 'Nenjil-Nenjil',
      image: MetasImage.asset('assets/music.png'),
    ),
  ),
  Audio(
    'assets/images/Dhimu-Dhimu.mp3',
    metas: Metas(
      title: 'Dhimu-Dhimu',
      artist: 'Dhimu-Dhimu',
      image: MetasImage.asset('assets/music.png'),
    ),
  ),
  Audio(
    'assets/images/Oru-Kutti-Katha-MassTamilan.io.mp3',
    metas: Metas(
      title: 'Oru-Kutti-Katha-MassTamilan',
      artist: 'Oru-Kutti-Katha-MassTamilan',
      image: MetasImage.asset('assets/music.png'),
    ),
  ),
  Audio(
    'assets/images/Thee-Illai.mp3',
    metas: Metas(
      title: 'Thee-Illai',
      artist: 'Thee-Illai',
      image: MetasImage.asset('assets/music.png'),
    ),
  ),
  Audio(
    'assets/images/Vaathi-Coming-MassTamilan.io.mp3',
    metas: Metas(
      title: 'Vaathi-Coming-MassTamilan',
      artist: 'Vaathi-Coming-MassTamilan',
      image: MetasImage.asset('assets/music.png'),
    ),
  ),
  Audio(
    'assets/images/Vaathi-Kabaddi-MassTamilan.io.mp3',
    metas: Metas(
      title: 'Vaathi-Kabaddi-MassTamilan',
      artist: 'Vaathi-Kabaddi-MassTamilan',
      image: MetasImage.asset('assets/music.png'),
    ),
  ),
  Audio(
    'assets/images/Vaathi-Raid-MassTamilan.io.mp3',
    metas: Metas(
      title: 'Vaathi-Raid-MassTamilan',
      artist: 'Vaathi-Raid-MassTamilan',
      image: MetasImage.asset('assets/music.png'),
    ),
  ),
];

//playlist setup
void setupPlaylist() async {
  await audioPlayer.open(Playlist(audios: audioSongsList),
      autoStart: false,
      loopMode: LoopMode.playlist,
      showNotification: true,
      notificationSettings: NotificationSettings(stopEnabled: false));
}
