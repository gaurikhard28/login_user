class profile_Model{
  final int phone;
  final String? Name;
  final String? email;
  final String? address;

  profile_Model({required this.Name, this.email, required this.phone, this.address});

  //mapping json data
  factory profile_Model.fromJSON(Map<String, dynamic> jsonMap){
    final data = profile_Model(
        Name: jsonMap["Name"],
        email: jsonMap["email"],
        phone: jsonMap["phone"],
        address: jsonMap["address"],

    );
    return data;
  }
}
