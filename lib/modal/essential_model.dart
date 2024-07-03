
class Essential {
    String? id;
    String? catName;

    Essential({this.id, this.catName});

    Essential.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        catName = json["cat_name"];
    }

    static List<Essential> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Essential.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["cat_name"] = catName;
        return _data;
    }

    static List<Essential>getImage(List image){
      return image.map((e) => Essential.fromJson(e)).toList();
        }
}