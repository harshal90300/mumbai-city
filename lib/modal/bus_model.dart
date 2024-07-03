
class Bus {
    String? title;
    List<String>? data;

    Bus({this.title, this.data});

    Bus.fromJson(Map<String, dynamic> json) {
        title = json["title"];
        data = json["data"] == null ? null : List<String>.from(json["data"]);
    }

    static List<Bus> fromList(List<Map<String, dynamic>> list) {
        return list.map((map) => Bus.fromJson(map)).toList();
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["title"] = title;
        if(data != null) {
            _data["data"] = data;
        }
        return _data;
    }
        static List<Bus>getImage(List image){
      return image.map((e) => Bus.fromJson(e)).toList();
        }
}