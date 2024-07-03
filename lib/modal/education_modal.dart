




class Education {
    String? images;
    String? id;
    String? placeName;
    String? contact;
    String? description;
    String? website;
    String? lattitude;
    String? longtitude;
    String? address;

    Education({this.images, this.id, this.placeName, this.contact, this.description, this.website, this.lattitude, this.longtitude, this.address});

    Education.fromJson(Map<String, dynamic> json) {
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

    static List<Education> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Education.fromJson(map)).toList();
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
        static List<Education>getImage(List image){
      return image.map((e) => Education.fromJson(e)).toList();
    }
}