import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:switch_theme/theme/bloc/theme_event.dart';

import '../../share_preference_controller.dart';

class ThemeBloc extends Bloc<ThemeEvent, bool> {
  ThemeBloc() : super(false) {
    on<SetInitialTheme>(
      (event, emit) {
        bool hasThemeDarek = isDark();

        emit(hasThemeDarek);
      },
    );

    on<ChangeTheme>(
      (event, emit) {
        bool hasThemeDarek = isDark();

        emit(!hasThemeDarek);
        setTheme(!hasThemeDarek);
      },
    );
  }

  void setTheme(bool isDarkTheme) {
    SharedPreferenceController.setIsDarkTheme(darkTheme: isDarkTheme);
  }

  bool isDark() => SharedPreferenceController.getDarkTheme;
}
