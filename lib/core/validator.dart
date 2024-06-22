extension EmailValidator on String {
  bool isValidEmail() {
    final RegExp emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );
    return emailRegex.hasMatch(this);
  }
}

extension AllAlphanumeric on String {
  bool isAllAlphanumeric() {
    final RegExp alphaNumericRegex = RegExp(r'^[a-zA-Z0-9]+$');
    return alphaNumericRegex.hasMatch(this);
  }
}