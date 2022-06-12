//
//  Service.swift
//  MCH2022-MobilaApp
//
//  Created by Ванурин Алексей Максимович on 12.06.2022.
//

import Foundation


final class MHCService {
    var baseURL: String = "194.87.248.180/partners"

    func getPartners() {
        var urlSession = URLSession.shared
        var url = URL(string: "\(baseURL)")!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData)
        
        request.httpMethod = "GET"
        
        let task = urlSession.dataTask(with: request) { data, response, error in
            <#code#>
        }
        
        //URLSession.dataTask(v)
    }
}
