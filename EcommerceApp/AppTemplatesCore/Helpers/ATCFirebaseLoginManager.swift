//
//  ATCFirebaseLoginManager.swift
//  AppTemplatesFoundation
//
//  Created by Florian Marcu on 2/6/17.
//  Copyright © 2017 iOS App Templates. All rights reserved.
//

import FirebaseAuth

public class ATCFirebaseLoginManager {
    static func login(credential: FIRAuthCredential, completionBlock: @escaping (_ user: ATCUser?) -> Void) {
        FIRAuth.auth()?.signIn(with: credential, completion: { (firebaseUser, error) in
            completionBlock(ATCFirebaseLoginManager.atcUser(for: firebaseUser))
        })
    }

    static func signIn(email: String, pass: String, completionBlock: @escaping (_ user: ATCUser?) -> Void) {
        FIRAuth.auth()?.signIn(withEmail: email, password: pass) { (user, error) in
            if let error = error, let errCode = FIRAuthErrorCode(rawValue: error._code) {
                switch errCode {
                case .errorCodeUserNotFound:
                    FIRAuth.auth()?.createUser(withEmail: email, password: pass) { (user, error) in
                        if error == nil {
                            ATCFirebaseLoginManager.signIn(email: email, pass: pass, completionBlock:completionBlock)
                        }
                    }
                default:
                    return
                }
            } else {
                completionBlock(ATCFirebaseLoginManager.atcUser(for: user))
            }
        }
    }

    static func atcUser(for firebaseUser: FIRUser?) -> ATCUser? {
        guard let fUser = firebaseUser else { return nil }
        return ATCUser(uid: fUser.uid, firstName: fUser.displayName ?? "", lastName: "", avatarURL: fUser.photoURL?.absoluteString ?? "", email: fUser.email ?? "")
    }
}
