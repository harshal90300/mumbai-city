
class Cafe {
    String? images;
    String? id;
    String? placeName;
    String? description;
    String? lattitude;
    String? longtitude;
    String? website;
    String? address;
    String? contact;
    String? status;

    Cafe({this.images, this.id, this.placeName, this.description, this.lattitude, this.longtitude, this.website, this.address, this.contact, this.status});

    Cafe.fromJson(Map<String, dynamic> json) {
        images = json["images"];
        id = json["id"];
        placeName = json["place_name"];
        description = json["description"];
        lattitude = json["lattitude"];
        longtitude = json["longtitude"];
        website = json["website"];
        address = json["address"];
        contact = json["contact"];
        status = json["status"];
    }

    static List<Cafe> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Cafe.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["images"] = images;
        _data["id"] = id;
        _data["place_name"] = placeName;
        _data["description"] = description;
        _data["lattitude"] = lattitude;
        _data["longtitude"] = longtitude;
        _data["website"] = website;
        _data["address"] = address;
        _data["contact"] = contact;
        _data["status"] = status;
        return _data;
    }
        static List<Cafe>getImage(List image){
      return image.map((e) => Cafe.fromJson(e)).toList();
    }
}