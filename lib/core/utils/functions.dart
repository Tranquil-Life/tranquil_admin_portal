String formatWithCommas(String numberString) {
  // Reverse the string to process from right to left
  String reversed = numberString.split('').reversed.join();
  StringBuffer formatted = StringBuffer();

  for (int i = 0; i < reversed.length; i++) {
    if (i > 0 && i % 3 == 0) {
      formatted.write(','); // Add a comma every 3 digits
    }
    formatted.write(reversed[i]);
  }

  // Reverse the result to get the final formatted string
  return formatted.toString().split('').reversed.join();
}