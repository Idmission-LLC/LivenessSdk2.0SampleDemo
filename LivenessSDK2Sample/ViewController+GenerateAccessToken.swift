//
//  ViewController+GenerateAccessToken.swift
//  SDK2Sample
//
//  Created by Amol Deshmukh on 15/11/24.
//

import Foundation

//MARK: - Generate Access Token
extension ViewController {
    
    func generateAccessToken(){
        
        if isValidatedTextfield() {
            
            //Show LoadingView
            self.activityIndicator.startAnimating()

            //Prepare Request Data
            let theAuthenticationURL = authUrl_Textfield.text!
            let theLoginID = loginID_Textfield.text!
            let thePassword = password_Textfield.text!
            let theClientID = clientID_Textfield.text!
            let theClientSecret = clientSecret_Textfield.text!
            guard let url = URL(string: theAuthenticationURL) else { return }
            let formString = "username=\(theLoginID)&password=\(thePassword)&client_id=\(theClientID)&client_secret=\(theClientSecret)&grant_type=password&scope=api_access"
            guard let formData = formString.data(using: .utf8) else { return }

            //Generate Access Token API Call
            post(url: url, form: formData) { result in
                //Hide LoadingView
                self.activityIndicator.stopAnimating()

                switch result {
                case .success(let data):
                    do {
                        if let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
                           let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
                            print(String(decoding: jsonData, as: UTF8.self))
                        } else {
                            print("json data malformed")
                        }
                        let response = try JSONDecoder.snakeCase.decode(TokenResponse.self, from: data)
                        self.token_Textfield.text = response.accessToken
                    } catch {
                        print("Token Generation Exception")
                    }
                case .failure(let error):
                    print("Token Generation Failed", error)
                }
            }

        }
    }
    func post(url: URL, form: Data, completion: @escaping DataCompletion) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = form
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                } else if let data = data {
                    completion(.success(data))
                } else {
                    completion(.failure(error!))
                }
            }
        }.resume()
    }

}

extension JSONDecoder {
    static var snakeCase: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}

struct TokenResponse: Decodable {
    var accessToken: String
    var expiresIn: Int
    var refreshExpiresIn: Int
    var scope: String
    var sessionState: String
    var tokenType: String
}

typealias DataCompletion = (Result<Data, Error>) -> Void
