
import 'package:movie_project/Domain/Entities/SessionEntity.dart';

import 'InterfaceModel.dart';

class SessionModel extends SessionEntity implements Model {
  SessionModel.getInstance();
  SessionModel.fromJson(Map<String, dynamic> json){
    success = json["success"];
    sessionId = json["session_id"];
  }

  @override
  Model fromJson(json) {
    return SessionModel.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => {
    "success": success,
    "session_id": sessionId,
  };

}