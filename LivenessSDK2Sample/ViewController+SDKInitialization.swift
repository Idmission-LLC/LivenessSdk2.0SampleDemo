//
//  ViewController+SDKInitialization.swift
//  LivenessSDK2Sample
//
//  Created by Amol Deshmukh on 25/02/25.
//

import IDentityLivenessSDK
import SelfieCaptureLiveness

//MARK: - SDK Initialization Method
extension ViewController {
    
    func SDKInitializationAPICall() {
        
        guard let apiBaseUrl = apiBaseURL_Textfield.text, apiBaseUrl != "" else {
            displayAlert(title: "", Message: "Please enter valid ApiBaseUrl.")
            return
        }
        guard let generatedToken = token_Textfield.text, apiBaseUrl != "" else {
            displayAlert(title: "", Message: "Please enter valid token.")
            return
        }
        
        self.activityIndicator.startAnimating()
        
        //1. Customize SDK properties
        SDKCustomization()
        
        //2. initialize SDK
        IDentitySDK.delegate = self
        IDentitySDK.apiBaseUrl = apiBaseUrl
        IDentitySDK.initializeSDK(accessToken: generatedToken) { error in
            if let error = error {
                self.activityIndicator.stopAnimating()
                print("!!! initialize SDK ERROR: \(error.localizedDescription)")
                self.displayAlert(title: "Error", Message: "SDK initialization credentials are not correct")
            } else {
                print("!!! initialize SDK SUCCESS")
//                self.performSegue(withIdentifier: "CompleteKYC_SegueID", sender: nil)
            }
        }
        
    }
    
    func displayAlert(title : String, Message:String){
        let alert = UIAlertController(title: title, message: Message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
}

extension ViewController: InitializationDelegate {
    func updateInitialization(stage: IDentityLivenessSDK.InitializationStage, state: IDentityLivenessSDK.InitializationState) {
        
        //1. Debug-Purpose : Just to print information in logs
        let stage_state_Value = "\(stage.rawValue) \(state.rawValue)"
        switch stage {
        case .login: print("Login Status :", stage_state_Value)
        case .searchCompanyTemplateDetails: print("Template Download Status :", stage_state_Value)
        case .passiveFaceTrainingModelLabel: print("FaceModel Download Status :", stage_state_Value)
        case .focusFaceTrainingModelLabel: print("FaceFocusModel Download Status :", stage_state_Value)
        @unknown default: print("Unknown Status :", stage_state_Value)
        }
        
        //2. check for completion of the stage states
        states[stage] = state
        if states[.login] == .downloaded &&
            ([.ok, .downloaded].contains(states[.searchCompanyTemplateDetails])) &&
            ([.ok, .downloadedFromS3].contains(states[.passiveFaceTrainingModelLabel])) &&
            ([.ok, .downloadedFromS3].contains(states[.focusFaceTrainingModelLabel])) {
            
            activityIndicator.stopAnimating()
            self.performSegue(withIdentifier: "CompleteKYC_SegueID", sender: nil)
            
        } else if states[.login] == .error || states[.searchCompanyTemplateDetails] == .error  {
            
            print("!!! initialize SDK ERROR ")
            activityIndicator.stopAnimating()
            self.displayAlert(title: "Error", Message: "SDK initialization Error")
            
        }
    }
}

extension ViewController {
    
    func SDKCustomization() {
        
        //SelfieCapture Customization
        SelfieCapture.options.minFaceWidth = 0.6
        SelfieCapture.options.eyeOpenProbability = 0.4
        SelfieCapture.options.minHeadEulerAngle = -10
        SelfieCapture.options.maxHeadEulerAngle = 10
        SelfieCapture.options.minRelativeNoseHeight = 0.48
        SelfieCapture.options.maxRelativeNoseHeight = 0.67
        SelfieCapture.options.labelsConfidenceThreshold = 0.79
        SelfieCapture.options.faceMaskProbabilityThreshold = 0.79
        SelfieCapture.options.liveFaceProbabilityThreshold = 0.9
        SelfieCapture.options.consecutiveFakeFaceLimit = 10
        SelfieCapture.options.lightIntensityThreshold = 0.05
        SelfieCapture.options.isDebugMode = false
        SelfieCapture.options.enableInstructionScreen = true
        SelfieCapture.options.capture4K = false
        SelfieCapture.options.uploadFaceData = true
        
        //SelfieCapture Camera Screen Customization
        SelfieCapture.strings.alignOval = "Align your face inside oval"
        SelfieCapture.strings.moveAway = "Move ID Away"
        SelfieCapture.strings.moveCloser = "Move ID Closer"
        SelfieCapture.strings.leftEyeClosed = "Left eye are closed"
        SelfieCapture.strings.rightEyeClosed = "right eye are closed"
        SelfieCapture.strings.faceMaskDetected = "Face mask detected"
        SelfieCapture.strings.sunglassesDetected = "Glasses Detected"
        SelfieCapture.strings.removeHat = "hat Detected"
        SelfieCapture.strings.fakeFace = "Fake face Detected"
        SelfieCapture.strings.realFace = "real face Detected"
        SelfieCapture.strings.straightenHead = "Make Sure your head is straight"
        SelfieCapture.strings.moveFaceDown = "Move face Down"
        SelfieCapture.strings.moveFaceUp = "Move face Up"
        SelfieCapture.strings.moveFaceDown = "Move face Down"
        SelfieCapture.strings.capturingFace = "Capturing Face"
        SelfieCapture.strings.tooMuchLight = "Too much light around face"
        SelfieCapture.colors.backgroundColor = .clear
        SelfieCapture.colors.successLabelBackgroundColor = .green
        SelfieCapture.colors.errorLabelBackgroundColor = .red
        SelfieCapture.colors.successLabelTextColor = .white
        SelfieCapture.colors.errorLabelTextColor = .white
        SelfieCapture.fonts.labelFont = UIFont.systemFont(ofSize: 14)
//        SelfieCapture.images.silhouetteImage = UIImage(named: "Selfiecapture")
//        SelfieCapture.images.retryScreenImage = UIImage(named: "SelfieRetryImage")
        
        //SelfieCapture Retry Screen Customization
        SelfieCapture.strings.retryScreenText = "Live face not Detected. Please try again"
        SelfieCapture.strings.retryButtonText = "Retry"
        SelfieCapture.strings.cancelButtonText = "Cancel"
        SelfieCapture.colors.retryScreenBackgroundColor = .white
        SelfieCapture.colors.retryScreenLabelTextColor = .black
        SelfieCapture.colors.retryScreenImageTintColor = .blue
        SelfieCapture.colors.retryScreenButtonTextColor = .blue
        SelfieCapture.colors.retryScreenButtonBackgroundColor = .clear
        SelfieCapture.fonts.retryScreenLabelFont = UIFont.systemFont(ofSize: 16)
        SelfieCapture.fonts.retryScreenButtonFont = UIFont.systemFont(ofSize: 14)
        
    }
}
