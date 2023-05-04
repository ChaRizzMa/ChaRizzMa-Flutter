class RizzultInformation {
  int? badsQuantity;
  String? createdAt;
  String? descriptionOfSituation;
  int? goingToTalkToQuantity;
  int? howManyTalkedToQuantity;
  String? id;
  int? numbersGottenQuantity;
  String? owner;
  String? ownerUsername;
  String? submitterUuid;
  int? wantMeFrQuantity;

  RizzultInformation({
    required this.badsQuantity,
    required this.createdAt,
    required this.descriptionOfSituation,
    required this.goingToTalkToQuantity,
    required this.howManyTalkedToQuantity,
    required this.id,
    required this.numbersGottenQuantity,
    required this.owner,
    this.ownerUsername,
    this.submitterUuid,
    required this.wantMeFrQuantity,
  });

  factory RizzultInformation.fromMap(Map<String, dynamic> map) {
    return RizzultInformation(
      badsQuantity: map["badsQuantity"],
      createdAt: map["created_at"],
      descriptionOfSituation: map["descriptionOfSituation"],
      goingToTalkToQuantity: map["goingToTalkToQuantity"],
      howManyTalkedToQuantity: map["howManyTalkedToQuantity"],
      id: map["id"],
      numbersGottenQuantity: map["numbersGottenQuantity"],
      owner: map["owner"],
      ownerUsername: map["owner_username"],
      submitterUuid: map["submitter_uuid"],
      wantMeFrQuantity: map["wantMeFrQuantity"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "badsQuantity": badsQuantity,
      "created_at": createdAt,
      "descriptionOfSituation": descriptionOfSituation,
      "goingToTalkToQuantity": goingToTalkToQuantity,
      "howManyTalkedToQuantity": howManyTalkedToQuantity,
      "id": id,
      "numbersGottenQuantity": numbersGottenQuantity,
      "owner": owner,
      "owner_username": ownerUsername,
      "submitter_uuid": submitterUuid,
      "wantMeFrQuantity": wantMeFrQuantity,
    };
  }
}
