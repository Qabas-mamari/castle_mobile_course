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
  int? yearEstablished;
  double? ticketPrice;
  double? latitude;
  double? longitude;


  CastleData(this.image, this.name, this.place, this.yearEstablished, this.ticketPrice, this.latitude, this.longitude);

  //read data from firebase
  CastleData.fromJson(Map<dynamic, dynamic> json){
    image = json["image"];
    name = json["name"];
    place = json["place"];
    yearEstablished = checkInteger(json["established"]);
    ticketPrice = checkDouble(json["ticket_price"]);
    latitude = checkDouble(json['latitude']);
    longitude = checkDouble(["longitude"]);
  }

  //read data to firebase
  Map<String, dynamic> toJson(){
    return {
      "image": image,
      "name": name,
      "place": place,
      "established": yearEstablished,
      "ticket_price": ticketPrice,
      "latitude": latitude,
      "longitude": longitude,
    };
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

