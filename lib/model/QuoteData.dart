class QuoteData {

  num price;
  num percent_1h;
  num percent_24h;
  num percent_7d;
  num market_cap;
  num volume_24h;
  String last_updated;


  QuoteData(this.price,this.percent_1h,this.percent_24h,this.percent_7d,this.volume_24h,this.market_cap,this.last_updated);

  factory QuoteData.fromJSON(Map<String,dynamic> json){
    return QuoteData(json["price"],json["percent_change_1h"],json["percent_change_24h"],json["percent_change_7d"],json["volume_24h"],json["market_cap"],json["last_updated"]);
  }
}