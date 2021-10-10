//
//  WebService.swift
//  ShobaikLobaik
//
//  Created by PC103-PC on 06/10/21.
//

import Foundation
import Alamofire

class WebService {
    
    static let shared = WebService()
    
    func webCallPost<T: Decodable, E:  Encodable>(url: String, params: E, responseType: T.Type,  completionHandler: @escaping (T?, String?) -> Void)
    {
        let encoded: String = CommonUtility.shared.getAESEncryptedString(dicJson: params)
        print("encoded")
        let headers: HTTPHeaders = [
            "api_key": "HSyyf/rnt00WILPm0U4qGw==",
            "app_lng": "1",
            "Content-Type": "text/plain"
        ]
        
        AF.request(url, method: .post, parameters: [:], encoding: encoded.debugDescription, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success( _):
                if let data = response.data {
                    do {
                        let obj = try JSONDecoder().decode(responseType.self, from: data)
                        completionHandler(obj,nil)
                    } catch let error as NSError {
                        print(error)
                        completionHandler(nil,"Something went wrong!")
                    }
                } else {
                    completionHandler(nil,"Something went wrong!")
                }
                break
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(nil,"Something went wrong!")
                break
            }
        }
    }
    
    func webCallGet<T: Decodable>(url: String, responseType: T.Type,  completionHandler: @escaping (T?, String?) -> Void)
    {
        let headers: HTTPHeaders = [
            "api_key": "HSyyf/rnt00WILPm0U4qGw==",
            "app_lng": "1",
            "Content-Type": "text/plain"
        ]
        
        AF.request(url, method: .get, parameters: [:], encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success( _):
                if let data = response.data {
                    do {
                        let obj = try JSONDecoder().decode(responseType.self, from: data)
                        completionHandler(obj,nil)
                    } catch let error as NSError {
                        print(error)
                        completionHandler(nil,"Something went wrong!")
                    }
                } else {
                    completionHandler(nil,"Something went wrong!")
                }
                break
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(nil,"Something went wrong!")
                break
            }
        }
    }
    
    
    func webCallDelete<T: Decodable, E:  Encodable>(url: String, params: E, responseType: T.Type,  completionHandler: @escaping (T?, String?) -> Void)
    {
        let encoded: String = ""
        let headers: HTTPHeaders = [
            "api_key": "HSyyf/rnt00WILPm0U4qGw==",
            "app_lng": "1",
            "Content-Type": "text/plain"
        ]
        
        AF.request(url, method: .delete, parameters: [:], encoding: encoded.debugDescription, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success( _):
                if let data = response.data {
                    do {
                        let obj = try JSONDecoder().decode(responseType.self, from: data)
                        completionHandler(obj,nil)
                    } catch let error as NSError {
                        print(error)
                        completionHandler(nil,"Something went wrong!")
                    }
                } else {
                    completionHandler(nil,"Something went wrong!")
                }
                break
            case .failure(let error):
                print(error.localizedDescription)
                completionHandler(nil,"Something went wrong!")
                break
            }
        }
    }
}

