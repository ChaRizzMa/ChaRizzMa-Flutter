import 'package:realm/realm.dart';

@RealmModel()
class _UserData {
  // object ID = the userID
  @PrimaryKey()
  late ObjectId id;

  late final String username;
  late String attractionPreference;
  late String pronouns;
  late double currentRizz;
  late double initialRizzConfidence;
  late double intialAttractionConfidence;
  late String firstName;
  late String lastName;
  late List<String> friends; // string contains friends userID

  @override
  String toString() {
    return '_UserData{id: $id, username: $username, attractionPreference: $attractionPreference, pronouns: $pronouns, currentRizz: $currentRizz, initialRizzConfidence: $initialRizzConfidence, intialAttractionConfidence: $intialAttractionConfidence, firstName: $firstName, lastName: $lastName, friends: $friends}';
  }
}
