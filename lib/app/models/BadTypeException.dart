// ignore_for_file: file_names

class BadTypeException implements Exception {
  BadTypeException({String? message}) : super() {
    if (message != null) this.message = message;
  }

  String message = 'Bad type';
}
