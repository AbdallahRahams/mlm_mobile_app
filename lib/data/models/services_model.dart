class Service {
  final String id;
  final String name;             // Changed from title to name
  final String description;
  final String category;
  final String imageUrl;         // Changed from iconUrl to imageUrl
  final String companyName;      // Add new field
  final double rating;           // Add new field
  final double price;            // Add new field

  Service({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.companyName,  
    required this.rating,       
    required this.price,  
  });
}
