class NetworkModel {
  final String networkId;
  final String networkName;
  final String adminId;

  NetworkModel({
    required this.networkId,
    required this.networkName,
    required this.adminId,
  });

  factory NetworkModel.fromJson(Map<String, dynamic> json) {
    return NetworkModel(
      networkId: json['networkId'],
      networkName: json['networkName'],
      adminId: json['adminId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'networkId': networkId,
      'networkName': networkName,
      'adminId': adminId,
    };
  }
}