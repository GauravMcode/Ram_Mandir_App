import 'package:flutter/material.dart';
import 'package:ram_mandir_app/data/models/event.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

List<Event> getEvents(BuildContext context) {
  return [
  Event(
    year: 1528,
      title: AppLocalizations.of(context)!.title1,
      description: AppLocalizations.of(context)!.desc1,
    image: "assets/images/1528.png",
  ),
  Event(
    year: 1853,
      title: AppLocalizations.of(context)!.title2,
      description: AppLocalizations.of(context)!.desc2,
    image: "assets/images/1853.png",
  ),
  Event(
    year: 1949,
      title: AppLocalizations.of(context)!.title3,
      description: AppLocalizations.of(context)!.desc3,
    image: "assets/images/1949.jpg",
  ),
  Event(
    year: 1950,
      title: AppLocalizations.of(context)!.title4,
      description: AppLocalizations.of(context)!.desc4,
    image: "assets/images/1950.jpg",
  ),
  Event(
    year: 1986,
      title: AppLocalizations.of(context)!.title5,
      description: AppLocalizations.of(context)!.desc5,
    image: "assets/images/1986.gif",
  ),
  Event(
    year: 1992,
      title: AppLocalizations.of(context)!.title6,
      description: AppLocalizations.of(context)!.desc6,
    image: "assets/images/1992.png",
  ),
  Event(
    year: 2010,
      title: AppLocalizations.of(context)!.title7,
      description: AppLocalizations.of(context)!.desc7,
    image: "assets/images/2010.png",
  ),
  Event(
    year: 2019,
      title: AppLocalizations.of(context)!.title8,
      description: AppLocalizations.of(context)!.desc8,
    image: "assets/images/2019.png",
  ),
  Event(
    year: 2023,
      title: "\"${AppLocalizations.of(context)!.title9}\"",
      description: AppLocalizations.of(context)!.desc9,
    image: "assets/images/2023.png",
  ),
];


}
