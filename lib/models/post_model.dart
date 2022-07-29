
class Post {
  int? id;
  String name;
  String phone;


  Post({required this.name, required this.phone,this.id});

  Post.fromJson(Map<String, dynamic> json)
      : //id = json['id'],
        name = json['name'],
        phone = json['phone'];

  Map<String, dynamic> toJson() => {
    //'id': id,
    'name': name,
    'phone': phone,
  };
}