//
//  AuthService.swift
//  DDD.Attendance
//
//  Created by 황재욱 on 2021/08/06.
//  Copyright © 2021 DDD. All rights reserved.
//

import Moya

enum SocialAuthType: String {
  case apple = "APPLE"
  case google = "GOOGLE"
}

enum AuthService {
  case login(socialToken: String, type: SocialAuthType)
  case signUp(info: SignUpInfo)
}

extension AuthService: TargetType {
  var baseURL: URL {
    URL(string: "http://dddattendance-env.eba-k3pf5rsf.ap-northeast-2.elasticbeanstalk.com")!
  }
  
  var path: String {
    switch self {
    case .login:
      return ""
    case .signUp:
      return ""
    }
  }
  
  var method: Method {
    return .get
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case let .login(socialToken, type):
      return .requestPlain
    default:
      return .requestPlain
    }
  }
  
  var headers: [String : String]? {
    nil
  }
}
