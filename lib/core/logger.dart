import 'dart:developer';

extension Logger on String {
  void toast({bool? additional}) {
    if (additional == true) {
      log("Logger: $this");
    } else {
      log(this);
    }
  }
}
