
class Hotel {
    String? images;
    String? id;
    String? placeName;
    String? contact;
    String? website;
    String? description;
    String? lattitude;
    String? longtitude;
    String? address;

    Hotel({this.images, this.id, this.placeName, this.contact, this.website, this.description, this.lattitude, this.longtitude, this.address});

    Hotel.fromJson(Map<String, dynamic> json) {
        images = json["images"];
        id = json["id"];
        placeName = json["place_name"];
        contact = json["contact"];
        website = json["website"];
        description = json["description"];
        lattitude = json["lattitude"];
        longtitude = json["longtitude"];
        address = json["address"];
    }

    static List<Hotel> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Hotel.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["images"] = images;
        _data["id"] = id;
        _data["place_name"] = placeName;
        _data["contact"] = contact;
        _data["website"] = website;
        _data["description"] = description;
        _data["lattitude"] = lattitude;
        _data["longtitude"] = longtitude;
        _data["address"] = address;
        return _data;
    }
        static List<Hotel>getImage(List image){
      return image.map((e) => Hotel.fromJson(e)).toList();
}
}