//
//  HostDataModel.swift
//  Identity 2.0
//
//  Created by Amol Deshmukh on 14/01/22.
//

import Foundation

public struct hostDataResponse: Codable {

    // MARK: - Properties

    /// DMV data.
    public var textMatchResult: TextMatcherData?
    /// PEP data.
    public var pepresult: PEPData?
    /// Watch List data.
    public var wlsresult: WLSData?
    /// Negative Media data.
    public var nmresult: NMData?
    /// Criminal Record data.
    public var criminalRecord: CriminalRecordData?
    /// Sex Offender data.
    public var sexOffenders: SexOffendersData?

    init(dictionary: [String: Any]?) {
        if let DMVDictionary = dictionary?["textMatchResult"] as? [String: Any] {
            self.textMatchResult = TextMatcherData(dictionary: DMVDictionary)
        }
        if let PEPDictionary = dictionary?["pepresult"] as? [String: Any] {
            self.pepresult = PEPData(dictionary: PEPDictionary)
        }
        if let WLSDictionary = dictionary?["wlsresult"] as? [String: Any] {
            self.wlsresult = WLSData(dictionary: WLSDictionary)
        }
        if let NMDictionary = dictionary?["nmresult"] as? [String: Any] {
            self.nmresult = NMData(dictionary: NMDictionary)
        }
        if let CriminalRecordsDictionary = dictionary?["criminalRecord"] as? [String: Any] {
            self.criminalRecord = CriminalRecordData(dictionary: CriminalRecordsDictionary)
        }
        if let SexOffenderDictionary = dictionary?["sexOffenders"] as? [String: Any] {
            self.sexOffenders = SexOffendersData(dictionary: SexOffenderDictionary)
        }
    }
}

//MARK: - SubDirectory

/// DMV data.
public struct TextMatcherData: Codable {
    public var address: String?
    public var addressCityMatch: String?
    public var addressLine1Match: String?
    public var addressLine2Match: String?
    public var addressStateCodeMatch: String?
    public var addressZIP4Match: String?
    public var addressZIP5Match: String?
    public var documentCategoryMatch: String?
    public var driverLicenseExpirationDateMatch: String?
    public var driverLicenseIssueDateMatch: String?
    public var driverLicenseNumberMatch: String?
    public var hostTried: String?
    public var identiFraudHostTried: String?
    public var personBirthDateMatch: String?
    public var personFirstNameExactMatch: String?
    public var personFirstNameFuzzyAlternateMatch: String?
    public var personFirstNameFuzzyPrimaryMatch: String?
    public var personLastNameExactMatch: String?
    public var personLastNameFuzzyAlternateMatch: String?
    public var personLastNameFuzzyPrimaryMatch: String?
    public var personMiddleInitialMatch: String?
    public var personMiddleNameExactMatch: String?
    public var personMiddleNameFuzzyAlternateMatch: String?
    public var personMiddleNameFuzzyPrimaryMatch: String?
    public var personSexCodeMatch: String?
    public var servicePresent: String?
    public var thirdPartyVerificationResultDescription: String?
    public var verificationResult: String?
    
    init(dictionary: [String: Any]?) {
        self.address = dictionary?["address"] as? String
        self.addressCityMatch = dictionary?["addressCityMatch"] as? String
        self.addressLine1Match = dictionary?["addressLine1Match"] as? String
        self.addressLine2Match = dictionary?["addressLine2Match"] as? String
        self.addressStateCodeMatch = dictionary?["addressStateCodeMatch"] as? String
        self.addressZIP4Match = dictionary?["addressZIP4Match"] as? String
        self.addressZIP5Match = dictionary?["addressZIP5Match"] as? String
        self.documentCategoryMatch = dictionary?["documentCategoryMatch"] as? String
        self.driverLicenseExpirationDateMatch = dictionary?["driverLicenseExpirationDateMatch"] as? String
        self.driverLicenseIssueDateMatch = dictionary?["driverLicenseIssueDateMatch"] as? String
        self.driverLicenseNumberMatch = dictionary?["driverLicenseNumberMatch"] as? String
        self.hostTried = dictionary?["hostTried"] as? String
        self.identiFraudHostTried = dictionary?["identiFraudHostTried"] as? String
        self.personBirthDateMatch = dictionary?["personBirthDateMatch"] as? String
        self.personFirstNameExactMatch = dictionary?["personFirstNameExactMatch"] as? String
        self.personFirstNameFuzzyAlternateMatch = dictionary?["personFirstNameFuzzyAlternateMatch"] as? String
        self.personFirstNameFuzzyPrimaryMatch = dictionary?["personFirstNameFuzzyPrimaryMatch"] as? String
        self.personLastNameExactMatch = dictionary?["personLastNameExactMatch"] as? String
        self.personLastNameFuzzyAlternateMatch = dictionary?["personLastNameFuzzyAlternateMatch"] as? String
        self.personLastNameFuzzyPrimaryMatch = dictionary?["personLastNameFuzzyPrimaryMatch"] as? String
        self.personMiddleInitialMatch = dictionary?["personMiddleInitialMatch"] as? String
        self.personMiddleNameExactMatch = dictionary?["personMiddleNameExactMatch"] as? String
        self.personMiddleNameFuzzyAlternateMatch = dictionary?["personMiddleNameFuzzyAlternateMatch"] as? String
        self.personMiddleNameFuzzyPrimaryMatch = dictionary?["personMiddleNameFuzzyPrimaryMatch"] as? String
        self.personSexCodeMatch = dictionary?["personSexCodeMatch"] as? String
        self.servicePresent = dictionary?["servicePresent"] as? String
        self.thirdPartyVerificationResultDescription = dictionary?["thirdPartyVerificationResultDescription"] as? String
        self.verificationResult = dictionary?["verificationResult"] as? String

    }

}

/// PEP data.
public struct PEPData: Codable {
    public var createdOnPEP: String?
    public var orderIdPEP: String?
    public var orderStatus_PEP: String?
    public var orderUrlPEP: String?
    public var productId_PEP: String?
    public var resultCountPEP: String?
    
    init(dictionary: [String: Any]?) {
        self.createdOnPEP = dictionary?["createdOnPEP"] as? String
        self.orderIdPEP = dictionary?["orderIdPEP"] as? String
        self.orderStatus_PEP = dictionary?["orderStatus_PEP"] as? String
        self.orderUrlPEP = dictionary?["orderUrlPEP"] as? String
        self.productId_PEP = dictionary?["productId_PEP"] as? String
        self.resultCountPEP = dictionary?["resultCountPEP"] as? String
    }
}

/// Watch List data.
public struct WLSData: Codable {
    public var createdOnWLS: String?
    public var orderIdWLS: String?
    public var orderStatusWLS: String?
    public var orderUrlWLS: String?
    public var productIdWLS: String?
    public var resultCountWLS: String?
    
    init(dictionary: [String: Any]?) {
        self.createdOnWLS = dictionary?["createdOnWLS"] as? String
        self.orderIdWLS = dictionary?["orderIdWLS"] as? String
        self.orderStatusWLS = dictionary?["orderStatusWLS"] as? String
        self.orderUrlWLS = dictionary?["orderUrlWLS"] as? String
        self.productIdWLS = dictionary?["productIdWLS"] as? String
        self.resultCountWLS = dictionary?["resultCountWLS"] as? String
    }

}

/// Negative Media data.
public struct NMData: Codable {
    public var createdOnNM: String?
    public var orderIdNM: String?
    public var orderStatusNM: String?
    public var orderUrlNM: String?
    public var productIdNM: String?
    public var resultCountNM: String?
    public var vital4APIHostTried: String?
    
    init(dictionary: [String: Any]?) {
        self.createdOnNM = dictionary?["createdOnNM"] as? String
        self.orderIdNM = dictionary?["orderIdNM"] as? String
        self.orderStatusNM = dictionary?["orderStatusNM"] as? String
        self.orderUrlNM = dictionary?["orderUrlNM"] as? String
        self.productIdNM = dictionary?["productIdNM"] as? String
        self.resultCountNM = dictionary?["resultCountNM"] as? String
        self.vital4APIHostTried = dictionary?["vital4APIHostTried"] as? String
    }

}

/// Criminal Record data.
public struct CriminalRecordData: Codable {
    public var aliases: aliasesData?
    public var offenses: offensesData?
    public var profiles: profilesData?
    
    init(dictionary: [String: Any]?) {
        if let aliseDictionary = dictionary?["aliases"] as? [String: Any] {
            self.aliases = aliasesData(dictionary: aliseDictionary)
        }
        if let offenseDictionary = dictionary?["offenses"] as? [String: Any] {
            self.offenses = offensesData(dictionary: offenseDictionary)
        }
        if let profileDictionary = dictionary?["profiles"] as? [String: Any] {
            self.profiles = profilesData(dictionary: profileDictionary)
        }
    }
}

/// Sex Offender data.
public struct SexOffendersData: Codable {
    public var profiles: profilesData?
    
    init(dictionary: [String: Any]?) {
        if let profileDictionary = dictionary?["profiles"] as? [String: Any] {
            self.profiles = profilesData(dictionary: profileDictionary)
        }
    }

}


//MARK: - EndDirectory
/// Aliases data.
public struct aliasesData: Codable {
    public var firstName: String?
    public var fullName: String?
    public var lastName: String?
    public var middleName: String?
    
    init(dictionary: [String: Any]?) {
        self.firstName = dictionary?["firstName"] as? String
        self.fullName = dictionary?["fullName"] as? String
        self.lastName = dictionary?["lastName"] as? String
        self.middleName = dictionary?["middleName"] as? String
    }

}

/// Offenses data.
public struct offensesData: Codable {
    public var addmissionDate: String?
    public var ageOfVictim: String?
    public var arrestingAgency: String?
    public var caseNumber: String?
    public var category: String?
    public var chargeFillingDate: String?
    public var closedDate: String?
    public var code: String?
    public var counts: String?
    public var courts: String?
    public var dateConvicted: String?
    public var dateOfCrime: String?
    public var dateOfWarrant: String?
    public var description: String?
    public var dispositionDate: String?
    public var facility: String?
    public var jurisdication: String?
    public var prisonerNumber: String?
    public var relationshipToVictim: String?
    public var releaseDate: String?
    public var section: String?
    public var sentence: String?
    public var sentenceDate: String?
    public var subsection: String?
    public var title: String?
    public var warrantDate: String?
    public var warrantNumber: String?
    public var weaponsUsed: String?
    
    init(dictionary: [String: Any]?) {
        self.addmissionDate = dictionary?["addmissionDate"] as? String
        self.ageOfVictim = dictionary?["ageOfVictim"] as? String
        self.arrestingAgency = dictionary?["arrestingAgency"] as? String
        self.caseNumber = dictionary?["caseNumber"] as? String
        self.category = dictionary?["category"] as? String
        self.chargeFillingDate = dictionary?["chargeFillingDate"] as? String
        self.closedDate = dictionary?["closedDate"] as? String
        self.code = dictionary?["code"] as? String
        self.counts = dictionary?["counts"] as? String
        self.courts = dictionary?["courts"] as? String
        self.dateConvicted = dictionary?["dateConvicted"] as? String
        self.dateOfCrime = dictionary?["dateOfCrime"] as? String
        self.dateOfWarrant = dictionary?["dateOfWarrant"] as? String
        self.description = dictionary?["description"] as? String
        self.dispositionDate = dictionary?["dispositionDate"] as? String
        self.facility = dictionary?["facility"] as? String
        self.jurisdication = dictionary?["jurisdication"] as? String
        self.prisonerNumber = dictionary?["prisonerNumber"] as? String
        self.relationshipToVictim = dictionary?["relationshipToVictim"] as? String
        self.releaseDate = dictionary?["releaseDate"] as? String
        self.section = dictionary?["section"] as? String
        self.sentence = dictionary?["sentence"] as? String
        self.subsection = dictionary?["subsection"] as? String
        self.title = dictionary?["title"] as? String
        self.warrantDate = dictionary?["warrantDate"] as? String
        self.warrantNumber = dictionary?["warrantNumber"] as? String
        self.weaponsUsed = dictionary?["weaponsUsed"] as? String

    }

}

/// Profiles data.
public struct profilesData: Codable {
    public var address: String?
    public var city: String?
    public var convictionType: String?
    public var country: String?
    public var countryCode: String?
    public var countryName: String?
    public var dobOfBirth: String?
    public var drivingLicenseVerificationResult: String?
    public var firstName: String?
    public var fullName: String?
    public var internalId: String?
    public var lastName: String?
    public var middleName: String?
    public var photoUrl: String?
    public var postalCode: String?
    public var sex: String?
    public var source: String?
    public var state: String?
    public var street1: String?
    public var street2: String?
    public var verificationResult: String?
    
    init(dictionary: [String: Any]?) {
        self.address = dictionary?["address"] as? String
        self.city = dictionary?["city"] as? String
        self.convictionType = dictionary?["convictionType"] as? String
        self.country = dictionary?["country"] as? String
        self.countryCode = dictionary?["countryCode"] as? String
        self.countryName = dictionary?["countryName"] as? String
        self.dobOfBirth = dictionary?["dobOfBirth"] as? String
        self.drivingLicenseVerificationResult = dictionary?["drivingLicenseVerificationResult"] as? String
        self.firstName = dictionary?["firstName"] as? String
        self.fullName = dictionary?["fullName"] as? String
        self.internalId = dictionary?["internalId"] as? String
        self.lastName = dictionary?["lastName"] as? String
        self.middleName = dictionary?["middleName"] as? String
        self.photoUrl = dictionary?["photoUrl"] as? String
        self.postalCode = dictionary?["postalCode"] as? String
        self.sex = dictionary?["sex"] as? String
        self.source = dictionary?["source"] as? String
        self.state = dictionary?["state"] as? String
        self.street1 = dictionary?["street1"] as? String
        self.street2 = dictionary?["street2"] as? String
        self.verificationResult = dictionary?["verificationResult"] as? String
    }

}
