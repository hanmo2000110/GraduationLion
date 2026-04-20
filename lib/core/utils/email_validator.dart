bool isHandongEmail(String email) {
  final parts = email.trim().toLowerCase().split('@');

  return parts.length == 2 &&
      parts.first.isNotEmpty &&
      parts.last == 'handong.ac.kr';
}
