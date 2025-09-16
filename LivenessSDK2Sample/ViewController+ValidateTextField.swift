//
//  Untitled.swift
//  SDK2Sample
//
//  Created by Amol Deshmukh on 15/11/24.
//

import UIKit

//MARK: - UITextfield Delegate Method
extension ViewController {
    
    override func resignFirstResponder() -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

//MARK: - Validate TextField
extension ViewController {
    
    func isValidatedTextfield() -> Bool {
        
        //Validate the input data
        guard let baseAPIURLURL = apiBaseURL_Textfield.text , !baseAPIURLURL.isEmpty, !baseAPIURLURL.trimmingCharacters(in: .whitespacesAndNewlines).elementsEqual("") else{
                //Show alert
            self.displayAlert(title: "URL Can't Be Empty", Message: "")
            return false
        }
        
        guard let theLoginID = loginID_Textfield.text , !theLoginID.isEmpty, !theLoginID.trimmingCharacters(in: .whitespacesAndNewlines).elementsEqual("") else{
                //Show alert
            self.displayAlert(title: "LoginID Can't Be Empty", Message: "")
            return false
        }
        
        guard let thePassword = password_Textfield.text , !thePassword.isEmpty, !thePassword.trimmingCharacters(in: .whitespacesAndNewlines).elementsEqual("") else{
                //Show alert
            self.displayAlert(title: "Password Can't Be Empty", Message: "")
            return false
        }
        
        guard let theMerchantID = merchantID_Textfield.text , !theMerchantID.isEmpty, !theMerchantID.trimmingCharacters(in: .whitespacesAndNewlines).elementsEqual("") else{
                //Show alert
            self.displayAlert(title: "MerchantID Can't Be Empty", Message: "")
            return false
        }
        
        guard let theMerchantID = clientID_Textfield.text , !theMerchantID.isEmpty, !theMerchantID.trimmingCharacters(in: .whitespacesAndNewlines).elementsEqual("") else{
                //Show alert
            self.displayAlert(title: "ClientID Can't Be Empty", Message: "")
            return false
        }

        guard let theMerchantID = clientSecret_Textfield.text , !theMerchantID.isEmpty, !theMerchantID.trimmingCharacters(in: .whitespacesAndNewlines).elementsEqual("") else{
                //Show alert
            self.displayAlert(title: "Client Secret Can't Be Empty", Message: "")
            return false
        }

        return true
    }
}
