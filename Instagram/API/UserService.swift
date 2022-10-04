//
//  UserService.swift
//  Instagram
//
//  Created by Elodie Cari on 10/4/22.
//

import FirebaseAuth

struct UserService {
    static func fetchUser(completion: @escaping(User) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let dictionnary = snapshot?.data() else { return }
            let user = User(dictionary: dictionnary)
            completion(user)
        }
        
    }
}
