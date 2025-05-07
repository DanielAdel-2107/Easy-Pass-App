class RequestModel {
  final String id,
      ownerId,
      ticketId,
      userId,
      userName,
      status,
      ticketName,
      ticketLocation,
      moreData,
      fromTime,
      toTime,
      image,
      date,
      price,
      ticketType;
  final bool payed;

  RequestModel(
      {required this.id,
      required this.ownerId,
      required this.ticketId,
      required this.userId,
      required this.userName,
      required this.status,
      required this.payed,
      required this.moreData,
      required this.ticketLocation,
      required this.fromTime,
      required this.toTime,
      required this.image,
      required this.date,
      required this.price,
      required this.ticketType,

      required this.ticketName});
  factory RequestModel.fromJson(Map<String, dynamic> json) {
    return RequestModel(
      id: json['id'],
      ownerId: json['owner_id'],
      ticketId: json['ticket_id'],
      userId: json['user_id'],
      userName: json['user_name'],
      status: json['status'],
      ticketName: json['ticket_name'],
      payed: json['payed'],
      date: json['date'],
      fromTime: json['from_time'],
      toTime: json['to_time'],
      image: json['image'],
      price: json['price'],
      ticketType: json['ticket_type'],
      moreData: json['more_data'],
      ticketLocation: json['ticket_location'],
    );
  }
  toJson() => {
        "id": id,
        "owner_id": ownerId,
        "ticket_id": ticketId,
        "user_id": userId,
        "user_name": userName,
        "status": status,
        "ticket_name": ticketName,
        "payed": payed
      };
  @override
  String toString() {
    return "RequestModel{id: $id, owner_id: $ownerId, ticket_id: $ticketId, user_id: $userId, user_name: $userName, status: $status, ticket_name: $ticketName payed: $payed}";
  }
}
