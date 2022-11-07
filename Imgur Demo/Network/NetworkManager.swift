//
//  NetworkManager.swift
//  Imgur Demo
//
//  Created by Aadeez Shaikh on 07/11/22.
//

import Foundation
import Alamofire

class NetworkManager{
    
    public static let shared = NetworkManager()
    
    private init() {}
    
    struct BlankParams: Encodable {}
    
    func getAllImages(query: String, page: Int, completeListener: @escaping (GalleryResponse?) -> Void) {
        let header: HTTPHeaders = [
            "Authorization": "Client-ID \(ServerConfig.CLIENT_ID)"
        ]
        print(ServerConfig.API_URL + "search/top/week/\(page)?q=\(query)")
        AF.request(ServerConfig.API_URL + "search/top/week/\(page)?q=\(query)",
                   method: .get,
                   parameters: BlankParams(),
                   encoder: URLEncodedFormParameterEncoder.default,
                   headers: header).response { response in
            switch response.result {
            case .success(let repData):
                if let data = repData {
                    let loginResp = try! JSONDecoder().decode(GalleryResponse.self, from: data)
                    completeListener(loginResp)
                } else {
                    completeListener(nil)
                }
            case .failure(let error):
                print(error)
                completeListener(nil)
            }
        }
    }
    
    
    
}
