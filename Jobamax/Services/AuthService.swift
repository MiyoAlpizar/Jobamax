//
//  AuthService.swift
//  Jobamax
//
//  Created by Miyo Alpízar on 01/11/20.
//

import Firebase

class AuthService {
    static let shared = AuthService()
    
    private init () { }
    
    func signUp(with email: String, password: String, completion: @escaping(Result<String, Error>) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let result = result else { return }
            completion(.success(result.user.uid))
        }
    }
    
}
