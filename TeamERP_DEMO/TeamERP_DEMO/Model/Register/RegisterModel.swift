//
//  RegisterModel.swift
//  TeamERP_DEMO
//
//  Created by Minh Thanh iOS on 7/24/17.
//  Copyright © 2017 thanhnm_dev91. All rights reserved.
//

import UIKit

class RegisterModel: Mi {
    var username    =   "HanTH100"
    var email    =   "thhan3111@gmail.com"
    var userTag    =   [String]()
    var avatar    =   "/file/user/user-default-avatar.png"
    var userID    =   "165cc133-526f-4e8a-90fd-d3ad18ac4a2f"
    var createAt    =   "2017-07-24T07:28:14.435Z"
}

class RegisterModel_Request: Mi {
    var username = ""
    var password = ""
    var email = ""
}

extension ERequest{
    class func registerPost(request : RegisterModel_Request, success : @escaping ((RegisterModel)->Void), failure :@escaping ((String)->Void))
    {
        Services.request(api: .postRegister, type: .services, method: .post, param: request.dictionary() as Dictionary<String, AnyObject>, success: { (data) in
            success(RegisterModel.init(dictionary: (data.dictionaryResponse!)))
        }) { (err) in
            failure(err)
        }
    }
}
