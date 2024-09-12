class NetworkDetails {
  final String networkId;
  final String networkName;
  final List<String> members;
  final double totalRevenue;

  NetworkDetails({
    required this.networkId,
    required this.networkName,
    required this.members,
    required this.totalRevenue,
  });

  // Factory constructor to create a NetworkDetails instance from a Map (used by SQLite)
  factory NetworkDetails.fromMap(Map<String, dynamic> map) {
    return NetworkDetails(
      networkId: map['networkId'],
      networkName: map['networkName'],
      members: List<String>.from(map['members'].split(',')),  // Assuming the members are stored as a comma-separated string
      totalRevenue: map['totalRevenue'],
    );
  }

  // Method to convert NetworkDetails to a Map (used by SQLite)
  Map<String, dynamic> toMap() {
    return {
      'networkId': networkId,
      'networkName': networkName,
      'members': members.join(','),  // Convert the list of members to a comma-separated string
      'totalRevenue': totalRevenue,
    };
  }

  // Factory constructor to create a NetworkDetails instance from JSON (still useful for network operations)
  factory NetworkDetails.fromJson(Map<String, dynamic> json) {
    return NetworkDetails(
      networkId: json['networkId'],
      networkName: json['networkName'],
      members: List<String>.from(json['members']),
      totalRevenue: json['totalRevenue'],
    );
  }

  // Method to convert NetworkDetails to JSON
  Map<String, dynamic> toJson() {
    return {
      'networkId': networkId,
      'networkName': networkName,
      'members': members,
      'totalRevenue': totalRevenue,
    };
  }
}
