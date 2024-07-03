
class Car {
    String? id;
    String? personName;
    String? personEmail;
    String? contactNumber;
    String? carTypes;

    Car({this.id, this.personName, this.personEmail, this.contactNumber, this.carTypes});

    Car.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        personName = json["person_name"];
        personEmail = json["person_email"];
        contactNumber = json["contact_number"];
        carTypes = json["car_types"];
    }

    static List<Car> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Car.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["person_name"] = personName;
        _data["person_email"] = personEmail;
        _data["contact_number"] = contactNumber;
        _data["car_types"] = carTypes;
        return _data;
    }
      static List<Car>getImage(List image){
      return image.map((e) => Car.fromJson(e)).toList();
      
    }
}