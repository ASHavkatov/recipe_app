String MinusDate(String createdDate) {
  DateTime created;
  try {
    created = DateTime.parse(createdDate);
  } catch (e) {
    print("Error parsing date: $createdDate, using default date.");
    created = DateTime.now().subtract(const Duration(days: 30)); // 1 oy oldin
  }

  DateTime now = DateTime.now();
  int years = now.year - created.year;
  int months = now.month - created.month;

  if (months < 0) {
    years -= 1;
    months += 12;
  }

  if (years > 0) {
    return "$years year ago";
  } else {
    return "$months month ago";
  }
}
