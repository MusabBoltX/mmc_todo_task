import 'dart:developer';

import 'package:flutter/foundation.dart';

appPrint(message) {
  if (kDebugMode) {
    print("APP-PRINT => $message \n\n");
  }
}

appLog(message) {
  if (kDebugMode) {
    log("APP-LOG => $message\n\n");
  }
}
