class TopicModel{
  final int id;
  final String topicName;
  final int numberOfTopicRequests;
  final int numberOfUsers;
  final int numberOfSuggestions;

  TopicModel({
    required this.id,
    required this.topicName,
    required this.numberOfTopicRequests,
    required this.numberOfUsers,
    required this.numberOfSuggestions,
  });

  factory TopicModel.fromJson(Map<String, dynamic> json) {
    return TopicModel(
      id: json['id'] ?? 0,
      topicName: json['topic_name'] ?? '',
      numberOfTopicRequests: json['number_of_topic_requests'] ?? 0,
      numberOfUsers: json['number_of_users'] ?? 0,
      numberOfSuggestions: json['number_of_suggestions'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'topic_name': topicName,
      'number_of_topic_requests': numberOfTopicRequests,
      'number_of_users': numberOfUsers,
      'number_of_suggestions': numberOfSuggestions,
    };
  }
}