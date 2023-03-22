class Castle{
  String? key;
  CastleData? castleData;

  //constructor
  Castle(this.key, this.castleData);
}

class CastleData{
  String? image;
  String? name;
  String?place;
  int? established;
  double? ticket_price;


  CastleData(this.image, this.name, this.place, this.established, this.ticket_price);

  CastleData.fromJson(Map<dynamic, dynamic> json){
    image = json["image"];
    name = json["name"];
    place = json["place"];
    established = json["established"];
    ticket_price = json["ticket_price"];
  }
}

