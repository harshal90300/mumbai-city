
class Bank {
    String? images;
    String? id;
    String? placeName;
    String? contact;
    String? description;
    String? website;
    String? lattitude;
    String? longtitude;
    String? address;

    Bank({this.images, this.id, this.placeName, this.contact, this.description, this.website, this.lattitude, this.longtitude, this.address});

    Bank.fromJson(Map<String, dynamic> json) {
        images = json["images"];
        id = json["id"];
        placeName = json["place_name"];
        contact = json["contact"];
        description = json["description"];
        website = json["website"];
        lattitude = json["lattitude"];
        longtitude = json["longtitude"];
        address = json["address"];
    }

    static List<Bank> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Bank.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["images"] = images;
        _data["id"] = id;
        _data["place_name"] = placeName;
        _data["contact"] = contact;
        _data["description"] = description;
        _data["website"] = website;
        _data["lattitude"] = lattitude;
        _data["longtitude"] = longtitude;
        _data["address"] = address;
        return _data;
    }
    static List<Bank>getImage(List image){
      return image.map((e) => Bank.fromJson(e)).toList();
    }
}