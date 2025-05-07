class TicketModel {
  final String moreData,
      ticketLocation,
      ticketName,
      id,
      date,
      image,
      toTime,
      fromTime,
      price,adminId,category;
  final bool resell,suspended;

  TicketModel(
      {required this.moreData,
      required this.ticketLocation,
      required this.ticketName,
      required this.id,
      required this.date,
      required this.image,
      required this.toTime,
      required this.fromTime,
      required this.adminId,
      required this.category,
      required this.resell,
      required this.suspended,
      required this.price});
  factory TicketModel.fromJson(Map<String, dynamic> json) {
    return TicketModel(
      moreData: json['more_data'],
      ticketLocation: json['ticket_location'],
      ticketName: json['ticket_name'],
      id: json['id'],
      date: json['date'],
      image: json['image'],
      toTime: json['to_time'],
      fromTime: json['from_time'],
      price: json['price'],
      suspended: json['suspended'],
      category: json['ticket_type'],
      adminId: json['admin_id'],
      resell: json['resell'],
    );
  }
  @override
  String toString() {
    return "TicketModel{more_data: $moreData, ticket_location: $ticketLocation, ticket_name: $ticketName, id: $id, date: $date, image: $image, to_time: $toTime, from_time: $fromTime, price: $price, admin_id: $adminId, ticket_type: $category resell: $resell suspended: $suspended}";
  }

 Map<String, dynamic> toJson() {
    return {
      'more_data': moreData,
      'ticket_location': ticketLocation,
      'ticket_name': ticketName,
      'id': id,
      'date': date,
      'image': image,
      'to_time': toTime,
      'from_time': fromTime,
      'price': price,
      'admin_id': adminId,
      'ticket_type': category,
      'resell': resell,
      'suspended': suspended
    };
  }
}
