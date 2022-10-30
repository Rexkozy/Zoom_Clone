import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_clone_app/services/auth.dart';
import 'package:zoom_clone_app/services/firestore.dart';

class JitsuService {
  final AuthService _auth = AuthService();
  final FireStoreService _firestore = FireStoreService();

  Future<void> createMeeting({
    required String meetingName,
    required bool isAudioMuted,
    required bool isVideoMuted,
    String username = "Guest",
  }) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      String name;
      if (username == "Guest") {
        name = await _auth.user.displayName!;
      } else {
        name = username;
      }
      var options = JitsiMeetingOptions(room: meetingName)
        ..userDisplayName = name
        ..userEmail = "myemail@email.com"
        ..userAvatarURL = "https://someimageurl.com/image.jpg" // or .png
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      _firestore.addToMeeting(meetingName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print("error: $error");
    }
  }


  
}
