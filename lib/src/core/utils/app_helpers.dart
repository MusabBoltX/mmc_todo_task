// import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AppHelpers {

  // static final ImagePicker _picker = ImagePicker();
  //
  // static Future<XFile?> pick() async {
  //   return await _picker.pickImage(source: ImageSource.gallery);
  // }
  //
  // static Future<XFile?> capture() async {
  //   return await _picker.pickImage(source: ImageSource.camera);
  // }

  /// Give time like 3 minutes/seconds ago etc
  static String getFormattedDate(DateTime date) {
    DateTime dateTime = DateTime.now().toLocal();
    DateTime newDate = date.toLocal();
    int inDays = dateTime.difference(date.toLocal()).inDays;
    int inHours = dateTime.difference(date.toLocal()).inHours;
    int inMinutes = dateTime.difference(date.toLocal()).inMinutes;
    int inSeconds = dateTime.difference(date.toLocal()).inSeconds;
    if (dateTime.year == newDate.year) {
      if (dateTime.month == newDate.month) {
        if (dateTime.day == newDate.day) {
          if (inHours > 0) {
            return "$inHours hours";
          } else if (inMinutes > 0) {
            return "$inMinutes minutes";
          } else {
            return "$inSeconds seconds";
          }
        } else if (inDays == 1 || inDays == 0) {
          return "yesterday";
        } else {
          return "Earlier";
        }
      }
      return "Earlier";
    }
    return "Earlier";
  }

  static DateFormat formatter = DateFormat('yyyy-MM-dd');
}
