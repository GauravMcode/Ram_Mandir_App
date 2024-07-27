import 'package:flutter/material.dart';
import 'package:ram_mandir_app/data/models/music.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


List<Music> getBhajans(BuildContext context) {
  return [
  Music(
      title: AppLocalizations.of(context)!.mTitle1,
      singer: AppLocalizations.of(context)!.mSinger1,
    imageUrl: "assets/music_bg/music01.jpg",
    audioPath: "assets/music/bhajan01.mp3",
    duration: const Duration(minutes: 4, seconds: 0),
  ),
  Music(
      title: AppLocalizations.of(context)!.mTitle2,
      singer: AppLocalizations.of(context)!.mSinger2,
    imageUrl: "assets/music_bg/music02.jpg",
    audioPath: "assets/music/bhajan02.mp3",
    duration: const Duration(minutes: 5, seconds: 47),
  ),
];
}
