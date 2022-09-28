import 'package:bloc/bloc.dart';

class AppBarCubit extends Cubit<double> {
  AppBarCubit() : super(0);

  void setOffset(double offset) => emit(offset);
}

class AppBarSize extends Cubit<double> {
  AppBarSize() : super(100);
  void setsize(double ofsset, double screenwi) {
    screenwi >= 1200
        ? emit(60)
        : ofsset < 500
            ? emit(100)
            : emit(50);
  }
}
