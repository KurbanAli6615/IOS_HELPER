//
//  CommonUtility.swift
//  ShobaikLobaik
//
//  Created by PC103-PC on 06/10/21.
//

import Foundation
import CryptoSwift
import UIKit
import Alamofire

class CommonUtility {
    
    static let shared = CommonUtility()
    
    func getAESEncryptedString<T: Encodable>(dicJson: T) -> String {
        do {            
            let jsonEncoder = JSONEncoder()
            let jsonData = try jsonEncoder.encode(dicJson)
            let str: String = String(data: jsonData, encoding: String.Encoding.utf8) ?? ""
            
             let aes = try AES(key: AES_KEY, iv: AES_IV, padding: .pkcs7)
             let encryptedBytes = try aes.encrypt([UInt8](str.data(using: .utf8) ?? Data()))
            let str1 = Data(encryptedBytes).base64EncodedString()
            return str1
        } catch {return ""}
    }
}

extension String: ParameterEncoding {

    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        return request
    }
}
