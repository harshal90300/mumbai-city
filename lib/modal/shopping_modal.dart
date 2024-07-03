

class Shopping {
    String? id;
    String? catName;

    Shopping({this.id, this.catName});

    Shopping.fromJson(Map<String, dynamic> json) {
        id = json["id"];
        catName = json["cat_name"];
    }

    static List<Shopping> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Shopping.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["id"] = id;
        _data["cat_name"] = catName;
        return _data;
    }
           static List<Shopping>getShop(List image){
      return image.map((e) => Shopping.fromJson(e)).toList();
    }


}