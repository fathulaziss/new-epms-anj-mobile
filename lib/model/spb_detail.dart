import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class SPBDetail extends Equatable {
  String? spbId;
  String? ophId;
  int? ophBunchesDelivered;
  int? ophLooseFruitDelivered;
  String? ophBlockCode;
  String? ophTphCode;
  String? ophCardId;

  SPBDetail(
      {this.spbId,
      this.ophId,
      this.ophBunchesDelivered,
      this.ophLooseFruitDelivered,
      this.ophBlockCode,
      this.ophTphCode,
      this.ophCardId});

  SPBDetail.fromJson(Map<String, dynamic> json) {
    spbId = json['spb_id'];
    ophId = json['oph_id'];
    ophBunchesDelivered = json['oph_bunches_delivered'];
    ophLooseFruitDelivered = json['oph_loose_fruit_delivered'];
    ophBlockCode = json['oph_block_code'];
    ophTphCode = json['oph_tph_code'];
    ophCardId = json['oph_card_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['spb_id'] = spbId;
    data['oph_id'] = ophId;
    data['oph_bunches_delivered'] = ophBunchesDelivered;
    data['oph_loose_fruit_delivered'] = ophLooseFruitDelivered;
    data['oph_block_code'] = ophBlockCode;
    data['oph_tph_code'] = ophTphCode;
    data['oph_card_id'] = ophCardId;
    return data;
  }

  @override
  List<Object> get props => [spbId!, ophId!];

  @override
  bool get stringify => false;
}

//add ari
class SPBDetCombine {
  String? ophBlockCode;
  int? ophBunchesDelivered;
  int? ophLooseFruitDelivered;
}
//add ari