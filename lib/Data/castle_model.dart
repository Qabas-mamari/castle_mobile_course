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
    established = checkInteger(json["established"]);
    ticket_price = checkDouble(json["ticket_price"]);
  }

  int? checkInteger(established){
    if(established is String){
      return int.parse(established);
    }else if(established is double){
      return int.parse(established.toString());
    }else if(established is int){
      return established;
    }else{
      return 0;
    }
  }

  double? checkDouble(established){
    if(established is String){
      return double.parse(established);
    }else if(established is int){
      return double.parse(established.toString());
    }else if(established is double){
      return established;
    }else{
      return 0.0;
    }
  }
}

