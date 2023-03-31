class a{
  a({required this.name,required this.address, this.id});
  String name;
  int? id;
  String address;
  factory a.fromJson(Map<String,dynamic> json)=>a(address: json['address'],name:json['name'],id:json['id']);
  Map<String,dynamic> toJson()=>{
    'name':name,
    'address':address,
    'id':id
  };
}