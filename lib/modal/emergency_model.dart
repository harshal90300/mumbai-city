
class Emergency {
  
    String? title;
    List<String>? data;

    Emergency({this.title, this.data});

    Emergency.fromJson(Map<String, dynamic> json) {
        title = json["title"];
        data = json["data"] == null ? null : List<String>.from(json["data"]);
    }

    static List<Emergency> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Emergency.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["title"] = title;
        if(data != null) {
            _data["data"] = data;
        }
        return _data;
    }
        static List<Emergency>getImage(List image){
      return image.map((e) => Emergency.fromJson(e)).toList();
        }
}