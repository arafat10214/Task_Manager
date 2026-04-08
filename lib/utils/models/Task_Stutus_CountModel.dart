<<<<<<< HEAD
class TaskStatusCountModel {
  final String status;
  final int count;

  TaskStatusCountModel({
    required this.status,
    required this.count,
  });

  factory TaskStatusCountModel.fromJson(Map<String, dynamic> json) {
    return TaskStatusCountModel(
      status: json['_id'],   // <-- important
      count: json['sum'],    // <-- important
    );
  }
=======
class TaskStatusCountModel {
  String? sId;
  int? sum;

  TaskStatusCountModel({this.sId, this.sum});

  TaskStatusCountModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    sum = json['sum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['sum'] = this.sum;
    return data;
  }
>>>>>>> 58110a0e2b4cafdae96934e7ef61c1356c6faf1a
}