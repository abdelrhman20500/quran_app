class NumOfJuz {
   int? number;

  // Constructor
   NumOfJuz({
    required this.number,

  });

  // Factory method to create a TextItem from JSON
  factory NumOfJuz.fromJson(Map<String, dynamic> json) {
    return NumOfJuz(
      number: json['number'] as int,
     );
  }

  // Method to convert a TextItem to JSON
  Map<String, dynamic> toJson() {
    return {
      'number': number,
    };
  }
}