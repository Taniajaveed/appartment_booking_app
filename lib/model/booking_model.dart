class BookingData {
  final String propertyName;
  final String location;
  final String image;
  final double rating;

  final DateTime startDate;
  final DateTime endDate;

  final int adults;
  final int children;

  final double amount;
  final double tax;

  BookingData({
    required this.propertyName,
    required this.location,
    required this.image,
    required this.rating,
    required this.startDate,
    required this.endDate,
    required this.adults,
    required this.children,
    required this.amount,
    required this.tax,
  });

  double get total => amount + tax;
}
