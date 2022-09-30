//
//  AuthenticationService.swift
//  Instagram
//
//  Created by Elodie Cari on 9/30/22.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    
    static func loginUserIn(_ email: String, password: String, completion: @escaping(AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    static func registerUser(_ credentials: AuthCredentials, completion: @escaping(Error?) -> Void) {
        
        ImageUploader.uploadImage(image: credentials.profileImage) { imageUrl in
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { result, error in
                
                if let error = error {
                    print("Failed to register user \(credentials.email) with error \(error.localizedDescription)")
                    return
                }
                
                guard let uid = result?.user.uid else { return }
                let data: [String: Any] = [
                    "email": credentials.email,
                    "fullname": credentials.fullname,
                    "username": credentials.username,
                    "profileImageUrl": imageUrl,
                    "uid": uid]
                Firestore.firestore().collection("users").document(uid).setData(data, completion: completion)
            }
        }
    }
}
