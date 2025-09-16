//
//  ViewController.swift
//  LivenessSDK2Sample
//
//  Created by Amol Deshmukh on 29/04/22.
//

import UIKit
import IDentityLivenessSDK

class ViewController: UIViewController, UITextFieldDelegate {
    
    //Token Generation TextField
    @IBOutlet var authUrl_Textfield : UITextField!
    @IBOutlet var loginID_Textfield : UITextField!
    @IBOutlet var password_Textfield : UITextField!
    @IBOutlet var merchantID_Textfield : UITextField!
    @IBOutlet var clientID_Textfield : UITextField!
    @IBOutlet var clientSecret_Textfield : UITextField!
    
    //SDK Initialization TextField
    @IBOutlet var apiBaseURL_Textfield : UITextField!
    @IBOutlet var token_Textfield : UITextField!
    
    @IBOutlet var activityIndicator : UIActivityIndicatorView!
    @IBOutlet var sdkVersion_Label : UILabel!
    
    var states: [InitializationStage: InitializationState] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        sdkVersion_Label.text = "SDK Version : " + IDentitySDK.version
    }
    
    override func viewWillAppear(_ animated: Bool) {
        token_Textfield.text = ""
    }
    
    //MARK: - Step-1: Generate AccessToken
    @IBAction func generateAccessTokenTapped(_ sender:Any) {
        generateAccessToken()
    }

    //MARK: - Step-2: SDK Initialization
    @IBAction func initializeSDKTapped(_ sender:Any) {
        SDKInitializationAPICall()
    }
    
}
