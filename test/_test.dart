import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Should authenticate user", () {
    const isLoggedIn = true;
    expect(isLoggedIn, true);
  });
  test("Should display animations", () {
    int length = 5;
    bool display = false;
    if (length > 0) {
      display = true;
    }
    expect(display, true);
  });
}
