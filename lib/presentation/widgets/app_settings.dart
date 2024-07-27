import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ram_mandir_app/Bloc/language_cubit.dart';

class AppSettings extends StatelessWidget {
  const AppSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
          color: Colors.orange, borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Text(
            "App Settings",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20,
                shadows: [
                  Shadow(
                      color: Colors.black,
                      offset: Offset(2, 1),
                      blurRadius: 0.5)
                ]),
          ),
          const SizedBox(height: 20),
          Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "${AppLocalizations.of(context)!.language} : ",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )),
          RadioListTile(
            value: "hi",
            groupValue:
                BlocProvider.of<LanguageCubit>(context).state.toString(),
            title: Text(AppLocalizations.of(context)!.hindi),
            onChanged: (value) async {
              await BlocProvider.of<LanguageCubit>(context)
                  .setLocale(const Locale("hi"));
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
          ),
          RadioListTile(
            value: "en",
            groupValue:
                BlocProvider.of<LanguageCubit>(context).state.toString(),
            title: Text(AppLocalizations.of(context)!.english),
            onChanged: (value) async {
              await BlocProvider.of<LanguageCubit>(context)
                  .setLocale(const Locale("en"));
              if (context.mounted) {
                Navigator.of(context).pop();
              }
            },
          )
        ],
      ),
    );
  }
}
