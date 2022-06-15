class DataModel{
late List<dynamic> forecasts;
int? temp;
String? icon;
String? condition;

DataModel({
  required this.forecasts,
  required this.temp,
  required this.icon,
  required this.condition,
});
DataModel.fromJson(Map<String,dynamic> json){
  forecasts = json['forecasts'];
  temp = json['fact']['temp'];
  icon = json['fact']['icon'];
  condition = json['fact']['condition'];

}
}


class Forecasts {
  Parts? parts;

  Forecasts.fromJson(Map<String, dynamic> json) {
    parts = json['parts'];

  }
}
class Parts {
   late List <Hours> hours;
  Parts.fromJson(Map<String, dynamic> jsonMap) {
    hours = jsonMap['hours'];
  }
}

class Hours {
  String? hour;
  int? temp;
  String? condition;



  Hours.fromJson(Map jsonMap) {
    hour = jsonMap['hour'];
    temp = jsonMap['temp'];
    condition = jsonMap['condition'];
  }
}


