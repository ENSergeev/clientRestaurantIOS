//
//  NetworkService.swift
//  RestaurantIOS
//
//  Created by Evgeniy Sergeev on 28.04.2023.
//

import Foundation
class NetworkService {
    static let shared = NetworkService(); private init() {}
    private let lockalhost = "http://127.0.0.1:8080"
    func auth(login: String, password: String) async throws -> User {
        print("один \(login)")
        print("один \(password)")
        let dto = UserDTO(login: login, password: password)
        print(dto)
        guard let url = URL(string: "\(lockalhost)\(APIMethod.auth.rawValue)") else {throw NetworkError.badURL}
        print(url)
        var request = URLRequest(url: url)
        print("раз \(request)")
        let h = request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        print("два \(request)")
        print("два \(h)")
        request.httpMethod = "POST"
        print("три \(request)")
        print("три \(request.httpMethod!)")
        let encoder = JSONEncoder()
        let data = try encoder.encode(dto)
        print("четыре \(data)")
        request.httpBody = data
        print("пять \(data)")
        let userResponce = try await URLSession.shared.data(for: request)
        print("шесть \(userResponce)")
        let userData = userResponce.0
        print("шесть \(userResponce.0)")
        let decoder = JSONDecoder()
        let user = try decoder.decode(User.self, from:userData)
        print("семь \(user)")
        return user
        
    }
}
    
    

struct UserDTO: Codable{
    let login: String
    let password: String
}
    
//    enum APIMethod: String {
//
//    }
//}
    enum APIMethod: String {
        case auth = "/users/auth"
    }
enum NetworkError: Error {
    case badURL
    
}
