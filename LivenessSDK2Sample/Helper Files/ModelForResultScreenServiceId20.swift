//
//  ModelForResultScreenServiceId20.swift
//  Identity 2.0
//
//  Created by daffolapmac-190 on 02/11/21.
//

import Foundation

struct ExtractedIdData : Codable{
    var MRZValid: String? = ""
    var MRZErrorMessages: String? = ""
    var MRZData: String? = ""
    var DateofBirth: String? = ""
    var DateofBirth_Parsed: String? = ""
    var ExpiryDate: String? = ""
    var ExpiryDate_Parsed: String? = ""
    var IDNumber: String? = ""
    var FirstName: String? = ""
    var IssuingCountry: String? = ""
    var Nationality: String? = ""
    var LastName: String? = ""
    var MiddleName: String? = ""
    var Gender: String? = ""
    var Name: String? = ""
    var MRZCode: String? = ""
    var AddressLine1: String? = ""
    var BarCodeDataParsed_PDF_417: String? = ""
    var BarcodeDataParsed: String? = ""
    var City: String? = ""
    var Country: String? = ""
    var DateOfExpiry: String? = ""
    var DateOfIssue: String? = ""
    var DocumentTypeCode: String? = ""
    var Eyes: String? = ""
    var IDCountry: String? = ""
    var IDCountry_ISO2: String? = ""
    var IDData: String? = ""
    var IDState: String? = ""
    var IDType: String? = ""
    var IssueDate: String? = ""
    var State: String? = ""
    var ZipCode: String? = ""
}

struct MyMRZResult : Codable{

//    var ocrText : String
    var documentType : String
    var countryCode : String
    var surnames : String
    var givenNames : String
    var documentNumber : String
    var nationality : String
    var birthDate : Date? = nil
    var sex : String? = nil
    var expiryDate : Date? = nil
    var personalNumber : String
    var personalNumber2 : String? = nil
    
    var isDocumentNumberValid : Bool
    var isBirthDateValid : Bool
    var isExpiryDateValid :  Bool
    var isPersonalNumberValid :  Bool? = nil
    var allCheckDigitsValid : Bool

    var birthDateString: String?
    var expiryDateString: String?
}
