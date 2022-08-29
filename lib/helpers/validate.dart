class ValidateInput {
  String message;
  bool inValid;
  ValidateInput({this.message = "Input is valid.", this.inValid = true});

  static ValidateInput phoneNumber(String telA) {
    String tel = telA;
    if (tel.isEmpty) {
      return ValidateInput(message: "Cell phone number is required");
    }
    if (int.tryParse(tel) == null) {
      return ValidateInput(message: "Invalid number, Avoid special characters");
    }
    if (tel.length < 10) {
      return ValidateInput(message: "10 Figures required");
    }
    if (tel.length > 13) {
      return ValidateInput(message: "Too much figures");
    }
    if (tel.length > 10 && !tel.startsWith("+")) {
      return ValidateInput(message: "10 figures allowed or use country code");
    }
    if (tel.startsWith("+") && tel.length != 13) {
      return ValidateInput(message: "Invalid phone number");
    }

    return ValidateInput(inValid: false);
  }

  static ValidateInput name(String nameA) {
    String name = nameA.trim();
    if (name.isEmpty) {
      return ValidateInput(message: "Name is required");
    }
    if (name.contains(RegExp('[0-9]')) ||
        name.contains(RegExp(r'[!@#$%^;&*(),\/.?":{}|<>`_+]'))) {
      return ValidateInput(
          message: "Invalid name, Number or Special character not allowed.");
    }
    if (name.length < 5) {
      return ValidateInput(message: "Minimum of 5 characters allowed");
    }
    if (name.indexOf(' ') < 1) {
      return ValidateInput(message: "Both names required");
    }
    return ValidateInput(inValid: false);
  }

  static ValidateInput momoNumber(String numberA) {
    String number = numberA.trim();
    if (number.length != 10) {
      return ValidateInput(message: "Invalid MoMo number");
    }
    if (!number.startsWith('078') && !number.startsWith('079')) {
      return ValidateInput(message: "This is not MTN number");
    }
    if (phoneNumber(number).inValid) {
      return phoneNumber(number);
    }
    return ValidateInput(inValid: false);
  }

  static ValidateInput visaCard(String numberA) {
    String number = numberA.trim();
    if (number.isEmpty) {
      return ValidateInput(message: "Card number required");
    }
    if (number.replaceAll(' ', '').length != 16) {
      return ValidateInput(message: "Invalid card number");
    }
    return ValidateInput(inValid: false);
  }

  static ValidateInput expDate(String dateA) {
    String date = dateA;
    if (date.isEmpty) {
      return ValidateInput(message: "Exp date required");
    }
    if (!date.contains('/')) {
      return ValidateInput(message: "Invalid exp date format");
    }
    if (date.indexOf('/') != 2) {
      return ValidateInput(message: "Invalid date format");
    }
    if (int.tryParse(date.replaceFirst('/', '')) == null) {
      return ValidateInput(message: "Invalid date format");
    }
    if (date.length != 5) {
      return ValidateInput(message: "Invalid date length");
    }
    int currentYear = DateTime.now().year;
    int currentMonth = DateTime.now().month;
    int enteredYear = int.parse("${date[3]}${date[4]}");
    int enteredMonth = int.parse("${date[0]}${date[1]}");
    if (enteredMonth > 12) {
      return ValidateInput(message: "Invalid month");
    }
    if (currentYear > enteredYear + 2000) {
      return ValidateInput(message: "Your card has expired");
    }
    if (currentYear == enteredYear + 2000 && currentMonth > enteredMonth) {
      return ValidateInput(message: "Your card has expired");
    }

    if (enteredYear + 2000 - currentYear > 5) {
      return ValidateInput(message: "Invalid year");
    }

    return ValidateInput(inValid: false);
  }

  static ValidateInput cvv(String cvv) {
    String cvvNumber = cvv.trim();
    if (cvvNumber.isEmpty) {
      return ValidateInput(message: "CVV number required");
    }
    if (int.tryParse(cvvNumber) == null) {
      return ValidateInput(message: "Invalid CVV number");
    }
    if (cvvNumber.length < 3) {
      return ValidateInput(message: "Too short CVV number (3) required");
    }
    if (cvvNumber.length > 3) {
      return ValidateInput(message: "Too long CVV number (3) required");
    }
    return ValidateInput(inValid: false);
  }
}
