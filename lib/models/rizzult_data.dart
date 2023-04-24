import 'package:realm/realm.dart';

@RealmModel()
class _Rizzult {
  @PrimaryKey()
  late ObjectId id;
  late String owner; // ID of owner

  // other data
  late DateTime createdAt;
  late int badsQuantity;
  late int wantMeFrQuantity;
  late int goingToTalkToQuantity;
  late int howManyTalkedToQuantity;
  late int numbersGottenQuantity;
  late String descriptionOfSituation;
  late Set<RizzLocation> location;

  late String submitter; // ID of person who submitted
  // this can be friend ID or users.
  // If submitter is not user then there will be a rizz review

  @override
  String toString() {
    return '_Rizzult{id: $id, owner: $owner, createdAt: $createdAt, badsQuantity: $badsQuantity, wantMeFrQuantity: $wantMeFrQuantity, goingToTalkToQuantity: $goingToTalkToQuantity, howManyTalkedToQuantity: $howManyTalkedToQuantity, numbersGottenQuantity: $numbersGottenQuantity, descriptionOfSituation: $descriptionOfSituation, location: $location, submitter: $submitter}';
  }
}

class RizzLocation {
  late String coordinates;
  late String name;
}
