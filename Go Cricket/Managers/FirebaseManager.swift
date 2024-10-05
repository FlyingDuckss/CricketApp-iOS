//
//  FirebaseManager.swift
//  Go Cricket
//
//  Created by Usama on 03/10/2024.
//


import Foundation
import Firebase
import FirebaseAuth

class FirebaseManager {
    
    static let shared = FirebaseManager()
    
    private init() {
        
    }
    
    // MARK: - Authentication
    /// Sign in a user with email and password
    func signIn(email: String, password: String, completion: @escaping (Result<User?, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(authResult?.user))
        }
    }
    
    /// Sign out the current user
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
    // MARK: - Realtime Database
    
    /// Write user data to the database

    func writeUserData(userId: String, userData: [String: String], completion: @escaping (Error?) -> Void) {
        let databaseRef = Database.database().reference()
        databaseRef.child("users").child(userId).setValue(userData) { error, _ in
            completion(error)
        }
    }
    
    /// Read user data from the database
    func readUserData(userId: String, completion: @escaping (Result<[String: Any]?, Error>) -> Void) {
        let databaseRef = Database.database().reference()
        databaseRef.child("users").child(userId).observeSingleEvent(of: .value) { snapshot in
            guard let value = snapshot.value as? [String: Any] else {
                completion(.failure(NSError(domain: "FirebaseManager", code: 404, userInfo: [NSLocalizedDescriptionKey: "User data not found."])))
                return
            }
            completion(.success(value))
        } withCancel: { error in
            completion(.failure(error))
        }
    }
}
