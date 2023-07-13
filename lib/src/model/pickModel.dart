class SelectedModel {
  List<Drinks>? drinks;

  SelectedModel({this.drinks});

  SelectedModel.fromJson(Map<String, dynamic> json) {
    if (json['drinks'] != null) {
      drinks = <Drinks>[];
      json['drinks'].forEach((v) {
        drinks!.add(new Drinks.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.drinks != null) {
      data['drinks'] = this.drinks!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Drinks {
  String? item;
  int? orderItemCount;
  int? temp;
  int? shotCount;

  Drinks({this.item, this.orderItemCount, this.temp, this.shotCount});

  Drinks.fromJson(Map<String, dynamic> json) {
    item = json['item'];
    orderItemCount = json['orderItemCount'];
    temp = json['temp'];
    shotCount = json['shotCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item'] = this.item;
    data['orderItemCount'] = this.orderItemCount;
    data['temp'] = this.temp;
    data['shotCount'] = this.shotCount;
    return data;
  }
}
