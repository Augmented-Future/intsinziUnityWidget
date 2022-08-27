class ValidateInput {
  String message;
  bool isValid;
  ValidateInput({this.message = "Input is valid.", this.isValid = true});
  static ValidateInput phoneNumber(String tel) {
    bool isValid = false;
    String trimmed = tel.trim();
    print(trimmed);
    print(tel);
    return ValidateInput();
    // if (tel.isEmpty) {
    //   return ValidateInput(
    //       message: "Phone number is required", isValid: isValid);
    // } else if (tel.length < 5) {}

    // return ValidateInput();
  }
}
