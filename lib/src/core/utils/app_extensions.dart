import 'app_exports.dart';

extension AppStrings on String {
  String get twoDigits => toString().padLeft(2, '0');

  String get commaSeparatedString {
    return toString().replaceAll('[', '').replaceAll(']', '');
  }

  String get formatDuration {
    try {
      final parts = split(':');
      if (parts.length == 2) {
        final minutes = int.tryParse(parts[0]) ?? 0;
        final seconds = int.tryParse(parts[1]) ?? 0;
        if (minutes < 1) {
          return '$minutes Hrs';
        }
        return '$minutes Hrs $seconds Sec';
      } else if (parts.length == 3) {
        final hours = int.tryParse(parts[0]) ?? 0;
        final minutes = int.tryParse(parts[1]) ?? 0;
        if (hours < 1) {
          return '$minutes Mins';
        }
        return '$hours Hrs $minutes Min';
      } else {
        return this;
      }
    } catch (e) {
      return this;
    }
  }

  String get filterException {
    if (contains("Exception: ")) {
      return replaceAll("Exception: ", '');
    }
    return this;
  }
}

extension Spacing on num {
  SizedBox get ph => SizedBox(height: toDouble().h);

  SizedBox get pw => SizedBox(width: toDouble().w);
}
