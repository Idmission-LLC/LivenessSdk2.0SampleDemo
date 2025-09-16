//
//  KYCViewController.swift
//  LivenessSDK2Sample
//
//  Created by Amol Deshmukh on 29/04/22.
//

import UIKit
import IDentityLivenessSDK
import SelfieCaptureLiveness

class KYCViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func CompleteKYC(_ sender:Any) {
        
        // first prompt for the customer's unique number
        let alert = UIAlertController(title: "Unique Customer Number", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addTextField { textField in
            textField.placeholder = "Customer #"
            textField.keyboardType = .numberPad
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            if let uniqueNumber = alert.textFields?.first?.text, !uniqueNumber.isEmpty {
                self.startIDValidationAndCustomerEnroll(uniqueNumber: uniqueNumber)
            } else {
                self.CompleteKYC(sender)
            }
        }))
        present(alert, animated: true)
    }
    
    //MARK: - Step-3: SDK Core Functions
    // Service Code 50 - ID Validation And Customer Enroll
    private func startIDValidationAndCustomerEnroll(uniqueNumber: String) {
        
        let commonCustomerData = CommonCustomerDataRequest()
        let personalData = PersonalCustomerEnrollBiometricsRequestData(uniqueNumber: uniqueNumber)
        let options = AdditionalCustomerEnrollBiometricRequestData()
        
        IDentitySDK.customerEnrollBiometrics(from: self, customerDataOptions: commonCustomerData, personalData: personalData, options: options) { result in
            switch result {
            case .success(let customerEnrollBiometricsResult):
                
                //1. Show Client Side Extracted Data on View
                let resultForCustomerEnrollmentCustomView = ResultScreenFor50(frame: self.view.bounds, customerEnroll_Result: customerEnrollBiometricsResult)
                resultForCustomerEnrollmentCustomView.delegate = self
                resultForCustomerEnrollmentCustomView.tag = 1
                self.view.addSubview(resultForCustomerEnrollmentCustomView)
                
            case .failure(let error):
                // Handle error
                print(error.localizedDescription)
            }
        }
        
    }
                
}

//MARK: - Done Button Delegate
extension KYCViewController : ResultScreenFor50Delegate {
    
    func doneButtonPressed() {
        if let viewWithTag = self.view.viewWithTag(1){
            viewWithTag.removeFromSuperview()
        }
    }
    
    func displayAlert(title : String, Message:String){
        let alert = UIAlertController(title: title, message: Message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}
