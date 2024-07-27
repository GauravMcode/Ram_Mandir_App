import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit(Locale locale) : super(locale);

  setLocale(Locale state) async {
    final preference = await SharedPreferences.getInstance();
    await preference.setString("language", state.toString());
    emit(state);
  }
}
