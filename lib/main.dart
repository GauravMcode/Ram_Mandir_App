import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:ram_mandir_app/Bloc/language_cubit.dart';
import 'package:ram_mandir_app/config/route_generator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:size_config/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final preference = await SharedPreferences.getInstance();

  String lang = preference.getString('language') ?? 'en';
  runApp(RamMandirApp(lang: lang));
}

class RamMandirApp extends StatelessWidget {
  final String lang;
  const RamMandirApp({super.key, required this.lang});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(Locale(lang)),
      child: SizeConfigInit(
        //for responsiveness
        referenceHeight: MediaQuery.of(context).size.height,
        referenceWidth: MediaQuery.of(context).size.width,
        builder: (context, orientation) => BlocBuilder<LanguageCubit, Locale>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              initialRoute: "/",
              locale: state,
              onGenerateRoute: RouteGenerator.generateRoutes,
            );
          },
        ),
      ),
    );
  }
}
