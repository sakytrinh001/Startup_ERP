//
//  Services.swift
//
//  Copyright © 2017. All rights reserved.
//

import UIKit
import Alamofire

class APIResponse: NSObject
{
    var error = true;
    var messageStatus = "";
    var message = "";
    var originalReponse : Any!
    var arrayResponse : Array<Any>! = []
    var dictionaryResponse : NSDictionary!  = NSDictionary.init()
}



let  services = Services.sharedInstance()
class Services: NSObject {
    static var instance: Services!
    var session : SessionManager = Alamofire.SessionManager.default
    class func sharedInstance() -> Services
    {
        if(self.instance == nil)
        {
            self.instance = (self.instance ?? Services())
        }
        return self.instance
    }

    

    class func request(api : APIFunction,type : ServicesType,method : HTTPMethod ,param : Dictionary <String, AnyObject>, success :@escaping ((APIResponse)->Void), failure :@escaping((String)->Void))
    {
        
        services.session = Alamofire.SessionManager.default
        let baseUrl = type.rawValue
        var endPoint = ""
        endPoint = baseUrl.appending(api.rawValue)
        var endParameter : Parameters = [:]
        for  (k,v) in  param
        {
            endParameter[k] = v
        }
        
        print("-----------endparameter \(endParameter)")
        
        
        services.session.request(endPoint, method: method, parameters:endParameter , encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            print("result : \(endPoint)---\n parameter : \(String(describing: response.result.value))")
            if(response.result.isSuccess)
            {
                let miResponse = APIResponse()
                let dictionaryResult  = response.result.value as! NSDictionary
                if (dictionaryResult.value(forKey: "result") is Array<Any>)
                {
                    miResponse.arrayResponse = NSArray.init(array: dictionaryResult.value(forKey: "result") as! NSArray) as! Array<Any>
                }
                
                if (dictionaryResult.value(forKey: "Error") is String)
                {
                    miResponse.error = (dictionaryResult.value(forKey: "Error") as! String).boolValue()
                }
                
                if ((dictionaryResult.value(forKey: "result")) != nil)
                {
                    miResponse.originalReponse =  dictionaryResult.value(forKey: "data")
                }
                if (dictionaryResult.value(forKey: "result") is NSDictionary)
                {
                    miResponse.dictionaryResponse = dictionaryResult.value(forKey: "result") as! NSDictionary
                }
                if (dictionaryResult.value(forKey: "message") is String)
                {
                    miResponse.message = dictionaryResult.value(forKey: "message") as! String
                }
                
                success(miResponse)
            }
            else
            {
                failure("Lôi kết nối")
            }

            
        }
    }

    class func requestX(api : APIFunction,type : ServicesType,method : HTTPMethod ,param : Dictionary <String, AnyObject>, success :@escaping ((APIResponse)->Void), failure :@escaping((String)->Void))

    {
        let baseUrl = type.rawValue
        
        var endPoint = ""
        endPoint = baseUrl.appending(api.rawValue)
        var endParameter : Parameters = [:]
        for  (k,v) in  param
        {
            endParameter[k] = v
        }
        
        if let theJSONData = try? JSONSerialization.data(
            withJSONObject: param,
            options: .prettyPrinted) {
            let theJSONText = String(data: theJSONData,
                                     encoding: .ascii)
            print("Parameter ---------- = \(theJSONText!)")
        }
        
        
        services.session = Alamofire.SessionManager.default
//        let header = ""
        
        var headerObject = HTTPHeaders()
//        if header != "" {
            headerObject = ["Content-Type": "application/json", "Accept": "application/json"]
//        }
        
        services.session.request(endPoint, method: method, parameters:endParameter , encoding: JSONEncoding.default, headers: headerObject).responseJSON { (response:DataResponse<Any>) in
            print("result : \(endPoint)---\n parameter : \(String(describing: response.result.value))")
            
            
            if(response.result.isSuccess)
            {
                let miResponse = APIResponse()
                miResponse.originalReponse =  response.result.value

                let dictionaryResult  = response.result.value as! NSDictionary
                if (dictionaryResult.value(forKey: "Result") is Array<Any>)
                {
                    miResponse.arrayResponse = NSArray.init(array: dictionaryResult.value(forKey: "Result") as! NSArray) as! Array<Any>
                }
                
                if (dictionaryResult.value(forKey: "Error") is String)
                {
                    miResponse.error = (dictionaryResult.value(forKey: "Error") as! String).boolValue()
                }
                
                if (dictionaryResult.value(forKey: "Result") is NSDictionary)
                {
                    miResponse.dictionaryResponse = dictionaryResult.value(forKey: "Result") as! NSDictionary
                }
                
                if (dictionaryResult.value(forKey: "Result") is String)
                {
                    miResponse.message = dictionaryResult.value(forKey: "Result") as! String
                }
                
                success(miResponse)
            }
            else
            {
                failure("Lôi kết nối")
            }
            
        }
    }    
}

extension String
{
    func boolValue() -> Bool
    {
        if(self.lowercased() == "false")
        {
            return false
        }
        else
        {
            return true;
        }
    }
}


