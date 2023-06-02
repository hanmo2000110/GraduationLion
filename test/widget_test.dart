import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
      'CheckEmail should return true for valid email with handong.ac.kr domain',
      () {
    // Arrange
    String validEmail = 'example@handong.ac.kr';

    // Act
    bool result = checkEmail(validEmail);

    // Assert
    expect(result, true,
        reason: 'Expected the result to be true for a valid email.');
  });

  test(
      'CheckEmail should return false for invalid email without handong.ac.kr domain',
      () {
    // Arrange
    String invalidEmail = 'example@gmail.com';

    // Act
    bool result = checkEmail(invalidEmail);

    // Assert
    expect(result, false,
        reason:
            'Expected the result to be false for an invalid email without the handong.ac.kr domain.');
  });

  test('CheckEmail should return false for invalid email without "@" symbol',
      () {
    // Arrange
    String invalidEmail = 'examplehandong.ac.kr';

    // Act
    bool result = checkEmail(invalidEmail);

    // Assert
    expect(result, false,
        reason:
            'Expected the result to be false for an invalid email without the "@" symbol.');
  });

  test(
      'CheckEmail should return false for invalid email with multiple "@" symbols',
      () {
    // Arrange
    String invalidEmail = 'example@handong@ac.kr';

    // Act
    bool result = checkEmail(invalidEmail);

    // Assert
    expect(result, false,
        reason:
            'Expected the result to be false for an invalid email with multiple "@" symbols.');
  });

  test(
      'CheckEmail should return false for invalid email with leading "@" symbol',
      () {
    // Arrange
    String invalidEmail = '@handong.ac.kr';

    // Act
    bool result = checkEmail(invalidEmail);

    // Assert
    expect(result, false,
        reason:
            'Expected the result to be false for an invalid email with a leading "@" symbol.');
  });
}

bool checkEmail(String googleUser) {
  return (googleUser.contains("@handong.ac.kr") &&
      googleUser != "@handong.ac.kr");
}
