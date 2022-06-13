//
//  Service.swift
//  MCH2022-MobilaApp
//
//  Created by Ванурин Алексей Максимович on 12.06.2022.
//

import Foundation


final class MHCServiceImp {
    var baseURL: String = "http://194.87.248.180:5000/partners/"

    func getPartners(completion: @escaping ([PartnerCardCodable]) -> ()) {
        let urlSession = URLSession.shared
        let url = URL(string: "\(baseURL)")!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData)
        
        request.httpMethod = "GET"
    
        urlSession.dataTask(with: request) { data, response, error in
            if let data = data {
                            do {
                                let decoder = JSONDecoder()
                                decoder.keyDecodingStrategy = .useDefaultKeys

                                let decodedSearchResult = try decoder.decode(PartnersCodable.self, from: data)
                                
                                completion(decodedSearchResult.partners)
                            } catch {
                             print(error)
                    }
                }
        }.resume()
        
    }
}
