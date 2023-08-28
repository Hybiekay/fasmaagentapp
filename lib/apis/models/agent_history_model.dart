class AgentHistory {
  bool success;
  List<HistoryEntry> data;
  String message;

  AgentHistory({
    required this.success,
    required this.data,
    required this.message,
  });

  factory AgentHistory.fromJson(Map<String, dynamic> json) {
    return AgentHistory(
      success: json['success'] ?? false,
      data: (json['data'] as List<dynamic>)
          .map((entryJson) => HistoryEntry.fromJson(entryJson))
          .toList(),
      message: json['message'] ?? '',
    );
  }
}

class HistoryEntry {
  String id;
  DateTime createdAt;
  DateTime updatedAt;
  String agentId;
  String driverId;
  String title;
  String name;
  String message;

  HistoryEntry({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.agentId,
    required this.driverId,
    required this.title,
    required this.name,
    required this.message,
  });

  factory HistoryEntry.fromJson(Map<String, dynamic> json) {
    return HistoryEntry(
      id: json['id'] ?? '',
      createdAt: DateTime.parse(json['createdAt'] ?? ''),
      updatedAt: DateTime.parse(json['updatedAt'] ?? ''),
      agentId: json['agentId'] ?? '',
      driverId: json['driverId'] ?? '',
      title: json['title'] ?? '',
      name: json['name'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
