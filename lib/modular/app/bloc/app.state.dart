import 'package:equatable/equatable.dart';

class AppState extends Equatable {
  final int currentIndex;
  final List<dynamic> business;
  final bool isDark;
  AppState({this.currentIndex = 0, this.business, this.isDark = false});
  AppState copyWith({int currentIndex, List<dynamic> business, bool isDark}) =>
      AppState(
        currentIndex: currentIndex ?? this.currentIndex,
        business: business ?? this.business,
        isDark: isDark ?? this.isDark,
      );
  @override
  List<Object> get props => [
        currentIndex,
        business,
        isDark,
      ];
}
