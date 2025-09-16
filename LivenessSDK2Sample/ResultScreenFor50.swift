//
//  ResultScreenFor50.swift
//  IdentityLite 2.0
//
//  Created by daffolapmac-190 on 02/11/21.
//

import UIKit
import IDentityLivenessSDK
import SelfieCaptureLiveness

protocol ResultScreenFor50Delegate{
    func doneButtonPressed()
}

class ResultScreenFor50: UIView {
    
    public var delegate : ResultScreenFor50Delegate?
    
    //CapturedResult
    @IBOutlet weak var capturedResultLabel: UILabel!
    @IBOutlet weak var capturedResultContainerView: UIView!
    @IBOutlet weak var capturedResultSelfieImageView: UIImageView!
    
    //ProcessedResult
    @IBOutlet weak var processedResultHeadingLabel: UILabel!
    @IBOutlet weak var processedResultActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var processedResultLabel: UILabel!
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var processingTimerLabel: UILabel!
    
    //MARK: - Initialize UIView
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadViewFromNib()
    }
    
    private func loadViewFromNib(){
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        view.frame = bounds
        addSubview(view)
    }
    
    init(frame: CGRect, customerEnroll_Result : CustomerEnrollBiometricsResult) {
        super.init(frame: frame)
        loadViewFromNib()
        
        //Do the initial setup, and populate this XIB with your custom data
        addDesignToUI()
        self.capturedResultSelfieImageView.image = customerEnroll_Result.selfie.image
        self.submitAPI(customerEnroll_Result: customerEnroll_Result)
    }
    
    private func addDesignToUI(){
        doneButton.layer.cornerRadius = 6
        
        capturedResultContainerView.layer.cornerRadius = 6.0
        capturedResultContainerView.layer.shadowColor = UIColor.black.cgColor
        capturedResultContainerView.layer.shadowOpacity = 0.5
        capturedResultContainerView.layer.shadowOffset = .zero
        capturedResultContainerView.layer.shadowRadius = 1
        capturedResultSelfieImageView.layer.cornerRadius = 6
        
        processingTimerLabel.isHidden = true
    }
    
    @IBAction func doneButtonPressed(_ sender: UIButton) {
        self.delegate?.doneButtonPressed()
    }
    
}

//MARK: - Step-4: SDK Final Submit
//MARK: - Load XIB From Server Extracted Data
extension ResultScreenFor50{
    
    func submitAPI(customerEnroll_Result : CustomerEnrollBiometricsResult?) {
        
        //Populate the Processed Result Data
        customerEnroll_Result?.finalSubmit { result in
            self.processedResultHeadingLabel.isHidden = false
            self.processedResultActivityIndicator.stopAnimating()
            self.processedResultActivityIndicator.isHidden = true
            
            switch result {
            case .success(let response):
                print("Response SID-50 : ", response)
                
                //1. Unhide the Processed Result Label
                self.processedResultLabel.isHidden = false
                self.processedResultLabel.text = response.resultData?.verificationResult
                
            case .failure(let error):
                print(error)
                self.processedResultLabel.isHidden = false
                self.processedResultLabel.text = error.localizedDescription
                self.processedResultLabel.textColor = .red
            }
        }
    }
}
