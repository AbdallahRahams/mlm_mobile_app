class Validators {
  // Validate email
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }
    final emailRegExp = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    if (!emailRegExp.hasMatch(email)) {
      return 'Invalid email address';
    }
    return null;
  }

  // Validate password
  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }
    if (password.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  // Validate phone number
  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegExp = RegExp(r'^\+?[1-9]\d{1,14}$');
    if (!phoneRegExp.hasMatch(phoneNumber)) {
      return 'Invalid phone number';
    }
    return null;
  }
}
