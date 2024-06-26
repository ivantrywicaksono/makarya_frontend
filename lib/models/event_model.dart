part of models;

class Event {
  int id;
  int community_id;
  String name;
  String location;
  String image;
  DateTime date;
  TimeOfDay time;
  int price;

  Event({
    required this.id,
    required this.community_id,
    required this.name,
    required this.location,
    required this.image,
    required this.date,
    required this.time,
    required this.price,
  });

  DateTime getDateTime() {
    DateTime dateTime =
        DateTime(date.year, date.month, date.day, time.hour, time.minute);
    return dateTime;
  }

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      date: DateTime.parse(json['date']),
      time: TimeOfDay.fromDateTime(
          DateTime.parse("${DateFormat('yyyy-MM-dd').format(DateTime.parse(json['date']))} ${json['time']}")),
      image: json['image'],
      price: int.parse(json['price'].toString()),
      community_id: int.parse(json['community_id'].toString()),
    );
  }

  Map<String, String> toMap() {
    return {
      'id': id.toString(),
      'name': name,
      'location': location,
      'date': date.toString(),
      'time': "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00",
      'price': price.toString(),
      'image': image,
      'community_id': community_id.toString(),
    };
  }
}
