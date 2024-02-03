import 'package:flutter_bloc/flutter_bloc.dart';

class MusicCubit extends Cubit<int> {
  MusicCubit() : super(0);

  setIndex(int index) {
    emit(index);
  }
}
