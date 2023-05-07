class Helper {
  static String? isValidPhoneNumber(String phoneNumber) {
    // Check if the phone number is exactly 10 digits long

    if (phoneNumber.length != 10) {
      return "Invalid Number";
    }

    // Check if the phone number contains only digits
    if (!RegExp(r'^\d{10}$').hasMatch(phoneNumber)) {
      return "Invalid Number";
    }

    // Check if the phone number starts with a valid prefix
    if (!RegExp(r'^[6789]').hasMatch(phoneNumber)) {
      return "Enter Valid Number";
    }

    // If all checks pass, the phone number is valid
    return null;
  }

  static String? isValidName(String name) {
    // Check if the name contains only letters and spaces
    if (!RegExp(r'^[a-zA-Z ]+$').hasMatch(name)) {
      return "Enter Valid Name";
    }

    // If all checks pass, the name is valid
    return null;
  }
}