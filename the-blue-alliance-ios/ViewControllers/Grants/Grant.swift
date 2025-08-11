import Foundation
import UIKit

struct Grant {
    let name: String
    let applicationLink: String
    let status: GrantStatus
    let openDate: String?
    let closeDate: String?
    let requiresEmployee: Bool?
    let requires501c3: Bool?
    
    enum GrantStatus: String, CaseIterable {
        case open = "Open"
        case closed = "Closed"
        case unsure = "Unsure"
        
        var displayName: String {
            return rawValue
        }
        
        var color: UIColor {
            switch self {
            case .open:
                return UIColor.systemGreen
            case .closed:
                return UIColor.systemRed
            case .unsure:
                return UIColor.systemOrange
            }
        }
    }
    
    init(name: String, applicationLink: String, status: GrantStatus, openDate: String?, closeDate: String?, requiresEmployee: Bool?, requires501c3: Bool?) {
        self.name = name
        self.applicationLink = applicationLink
        self.status = status
        self.openDate = openDate
        self.closeDate = closeDate
        self.requiresEmployee = requiresEmployee
        self.requires501c3 = requires501c3
    }
    
    // Helper computed properties
    var isOpen: Bool {
        return status == .open
    }
    
    var isClosed: Bool {
        return status == .closed
    }
    
    var hasEmployeeRequirement: Bool {
        return requiresEmployee == true
    }
    
    var has501c3Requirement: Bool {
        return requires501c3 == true
    }
    
    var requirementsText: String {
        var requirements: [String] = []
        
        if hasEmployeeRequirement {
            requirements.append("Employee Required")
        }
        
        if has501c3Requirement {
            requirements.append("501(c)(3) Required")
        }
        
        if requirements.isEmpty {
            return "No Special Requirements"
        }
        
        return requirements.joined(separator: ", ")
    }
    
    var dateText: String {
        if let closeDate = closeDate, closeDate != "No" && closeDate != "Unsure" {
            return "Closes: \(closeDate)"
        } else if let openDate = openDate, openDate != "No" && openDate != "Unsure" {
            return "Opens: \(openDate)"
        } else {
            return "No Date Available"
        }
    }
}

// Sample data based on the spreadsheet
extension Grant {
    static let sampleGrants: [Grant] = [
        Grant(name: "AiAA", 
              applicationLink: "https://aiaa.org/get-involved/educators/Classroom-Grants/", 
              status: .closed, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: false),
        
        Grant(name: "Akamai Foundation", 
              applicationLink: "https://www.akamai.com/company/corporate-responsibility/akamai-foundation", 
              status: .closed, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "AT&T", 
              applicationLink: "https://giving.att.com/Account/login.aspx?ReturnUrl=%2f", 
              status: .unsure, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: true, 
              requires501c3: nil),
        
        Grant(name: "BAE Grant", 
              applicationLink: "https://www.baesystems.com/en-us/partnership/community-investment/community-investment-partners/first/first-team-grants-application", 
              status: .open, 
              openDate: nil, 
              closeDate: "September 13", 
              requiresEmployee: false, 
              requires501c3: false),
        
        Grant(name: "Bauch", 
              applicationLink: "https://www.bauschfoundation.org/", 
              status: .unsure, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: nil),
        
        Grant(name: "Bloomingdales", 
              applicationLink: "https://www.bloomingdales.com/c/b-the-change/corporate-grants/", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: nil),
        
        Grant(name: "BMW", 
              applicationLink: "https://www.bmwgroup-werke.com/spartanburg/en/responsibility/social-responsibility/corporate-sponsorship.html", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "Boeing FIRST Grant", 
              applicationLink: "https://usfirst.submittable.com/submit/298791/2024-2025-boeing-team-grant-application", 
              status: .closed, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: true, 
              requires501c3: nil),
        
        Grant(name: "Canon USA", 
              applicationLink: "https://canonusa.allegiancetech.com/cgi-bin/qwebcorporate.dll?9JXBU6", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "Coca-Cola", 
              applicationLink: "https://coca-cola.smartsimple.com/s_Login.jsp", 
              status: .unsure, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: nil),
        
        Grant(name: "Con Edison", 
              applicationLink: "https://www.coned.com/en/community-affairs/strategic-partnerships/apply-for-a-grant", 
              status: .closed, 
              openDate: nil, 
              closeDate: "June 30", 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "Costco", 
              applicationLink: "https://www.costco.com/charitable-giving-faq.html", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "DoDStem", 
              applicationLink: "https://dodstem.us/first/", 
              status: .closed, 
              openDate: nil, 
              closeDate: "June 13", 
              requiresEmployee: true, 
              requires501c3: false),
        
        Grant(name: "Dow", 
              applicationLink: "https://corporate.dow.com/en-us/about/partnerships/citizenship/tomorrows-innovators/first-robotics.html", 
              status: .open, 
              openDate: nil, 
              closeDate: "August 12", 
              requiresEmployee: nil, 
              requires501c3: nil),
        
        Grant(name: "Dr. Scholl Foundation", 
              applicationLink: "https://www.drschollfoundation.com/application-procedures/preferences-limitations/", 
              status: .closed, 
              openDate: "October 1", 
              closeDate: nil, 
              requiresEmployee: nil, 
              requires501c3: true),
        
        Grant(name: "Ecolab", 
              applicationLink: "https://www.ecolab.com/corporate-responsibility/social/community-involvement", 
              status: .open, 
              openDate: nil, 
              closeDate: "August 11", 
              requiresEmployee: nil, 
              requires501c3: true),
        
        Grant(name: "EMC Insurance", 
              applicationLink: "https://www.emcinsurance.com/aboutemc/community-involvement", 
              status: .unsure, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: nil, 
              requires501c3: nil),
        
        Grant(name: "Eversource", 
              applicationLink: "https://www.eversource.com/content/residential/about/community/supporting-the-community/charitable-contributions-volunteerism", 
              status: .unsure, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "Fabworks", 
              applicationLink: "https://www.fabworks.com/resources/partnerships/sponsorshipinfo", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: false),
        
        Grant(name: "FIRST Grant Submittables", 
              applicationLink: "https://usfirst.submittable.com/submit", 
              status: .closed, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: nil, 
              requires501c3: nil),
        
        Grant(name: "Ford", 
              applicationLink: "https://www.fordphilanthropy.org/deed", 
              status: .unsure, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: true, 
              requires501c3: nil),
        
        Grant(name: "Gene Haas", 
              applicationLink: "https://webportalapp.com/sp/login/ghf_first_sae_competitions", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "General Dynamics NASSCO", 
              applicationLink: "https://nassco.com/about-us/charitable-contributions/", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: true, 
              requires501c3: true),
        
        Grant(name: "GM", 
              applicationLink: "", 
              status: .unsure, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: true, 
              requires501c3: false),
        
        Grant(name: "Grants.gov", 
              applicationLink: "https://www.grants.gov/", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: nil, 
              requires501c3: nil),
        
        Grant(name: "Hershey", 
              applicationLink: "https://forms.donationx.org/form/4762f381-bf89-4d95-9e33-66c75633f0fe", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "Honda", 
              applicationLink: "https://csr.honda.com/longform-content/honda-usa-foundation-funding/", 
              status: .closed, 
              openDate: "September 1", 
              closeDate: "October 31", 
              requiresEmployee: nil, 
              requires501c3: true),
        
        Grant(name: "Indiana FIRST Grants", 
              applicationLink: "https://indianafirst.submittable.com/submit/257192/2023-2024-first-indiana-robotics-grant-application/eligibility", 
              status: .closed, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "Indiana Toyota Grant", 
              applicationLink: "https://www.firstindianarobotics.org/toyota-grant/", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: nil, 
              requires501c3: true),
        
        Grant(name: "Intuitive grant", 
              applicationLink: "https://www.intuitive-foundation.org/first-robotics/", 
              status: .open, 
              openDate: nil, 
              closeDate: "Late August", 
              requiresEmployee: false, 
              requires501c3: false),
        
        Grant(name: "Investors Foundation", 
              applicationLink: "https://investorsfoundation.org/", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "JB Hunt", 
              applicationLink: "https://www.jbhunt.com/our-company/esg/social-responsibility/company-giving", 
              status: .closed, 
              openDate: "December", 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "John Deere", 
              applicationLink: "https://johndeerefirst.submittable.com/submit", 
              status: .open, 
              openDate: nil, 
              closeDate: "November 1", 
              requiresEmployee: false, 
              requires501c3: false),
        
        Grant(name: "Johnson & Johnson Vision", 
              applicationLink: "https://www.jjvision.com/corporate-social-responsibility", 
              status: .unsure, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "Kars4Kids", 
              applicationLink: "https://www.kars4kidsgrants.org/#apply", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "Lockheed Martin", 
              applicationLink: "https://contact.lockheedmartin.com/sponsorship-and-promotional-offer-requests-1", 
              status: .unsure, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: nil, 
              requires501c3: nil),
        
        Grant(name: "Max and Victoria Dreyfus Foundation", 
              applicationLink: "https://www.mvdreyfusfoundation.org/application-guidelines", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: false),
        
        Grant(name: "Michael and Susan Dell Foundation", 
              applicationLink: "https://www.dell.org/how-we-fund/apply/", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: false),
        
        Grant(name: "Motorola Solutions", 
              applicationLink: "https://www.motorolasolutions.com/en_us/about/motorola-solutions-foundation/annual-grants.html", 
              status: .closed, 
              openDate: "November", 
              closeDate: nil, 
              requiresEmployee: nil, 
              requires501c3: nil),
        
        Grant(name: "Msc", 
              applicationLink: "https://www.mscdirect.com/corporate/community-relations-partners", 
              status: .closed, 
              openDate: "March 1", 
              closeDate: "May 31", 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "MSOE", 
              applicationLink: "https://www.msoe.edu/about-msoe/k-12-stem-at-msoe/first-frc-ftc-amp-fll-team-sponsorship/", 
              status: .closed, 
              openDate: "October 12", 
              closeDate: "January 24", 
              requiresEmployee: false, 
              requires501c3: false),
        
        Grant(name: "NASA", 
              applicationLink: "https://robotics.nasa.gov/category/nasa-grants/", 
              status: .closed, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: false),
        
        Grant(name: "NI", 
              applicationLink: "https://www.ni.com/pdf/forms/us/grant-request-application.pdf", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "Nikon", 
              applicationLink: "https://nikon.tfaforms.net/179", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: false),
        
        Grant(name: "Northrop Grumman", 
              applicationLink: "https://www.northropgrumman.com/corporate-responsibility/corporate-citizenship/corporate-contributions-guidelines", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "Optimum", 
              applicationLink: "https://www.optimum.com/optimum-partners-with-firstrobotics", 
              status: .closed, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: false),
        
        Grant(name: "Pershing Square Foundation", 
              applicationLink: "https://prizeapplication.smapply.io/", 
              status: .closed, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: nil),
        
        Grant(name: "PTC", 
              applicationLink: "https://docs.google.com/forms/d/e/1FAIpQLScVmjnd6srr86qa9V5zz70Jsy0Plm2rBlqaYLlZ1uj59fxPOA/formResponse", 
              status: .open, 
              openDate: nil, 
              closeDate: "September 26", 
              requiresEmployee: false, 
              requires501c3: false),
        
        Grant(name: "Raytheon", 
              applicationLink: "https://rtx.sandbox.versaic.com/login", 
              status: .closed, 
              openDate: "June 1", 
              closeDate: "August 2", 
              requiresEmployee: nil, 
              requires501c3: true),
        
        Grant(name: "Regeneron", 
              applicationLink: "https://regeneron.versaic.com/login", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: nil, 
              requires501c3: true),
        
        Grant(name: "Rev Robotics", 
              applicationLink: "https://www.revrobotics.com/blog/team-rev-sponsorship/", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: nil, 
              requires501c3: nil),
        
        Grant(name: "Rockland Trust", 
              applicationLink: "https://www.rocklandtrust.com/about-us/explore/charitable-giving", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "Rockwell Automation", 
              applicationLink: "https://www.rockwellautomation.com/en-us/company/news/articles/giving-guidelines.html", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: true, 
              requires501c3: nil),
        
        Grant(name: "Saint-Gobain Corporation Foundation", 
              applicationLink: "https://www.saint-gobain-northamerica.com/company/corporate-social-responsibility/our-foundation/direct-grants", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "Samsung South Carolina", 
              applicationLink: "https://www.samsungscrequests.com/", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: nil, 
              requires501c3: true),
        
        Grant(name: "Siemens", 
              applicationLink: "https://solidedge.siemens.com/en/firstrobotics/", 
              status: .closed, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: true, 
              requires501c3: nil),
        
        Grant(name: "Society for Science", 
              applicationLink: "https://www.societyforscience.org/outreach-and-equity/stem-action-grants/", 
              status: .closed, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "Sony", 
              applicationLink: "https://www.sony.com/en_us/SCA/social-responsibility/giving-guidelines.html", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "State Farm", 
              applicationLink: "https://www.statefarm.com/about-us/corporate-responsibility/community-grants", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: nil, 
              requires501c3: true),
        
        Grant(name: "Swyft", 
              applicationLink: "https://docs.google.com/forms/d/e/1FAIpQLSedhF8yWVuGr7cs_WAJX5iRHuY3cKmCZF7WiCj9PEFC-vMA-g/viewform", 
              status: .open, 
              openDate: nil, 
              closeDate: "January 17", 
              requiresEmployee: false, 
              requires501c3: false),
        
        Grant(name: "TD Bank", 
              applicationLink: "https://www.td.com/us/en/about-us/communities/ready-commitment/funding-opportunities/community-sponsorships", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "TE Connectivity", 
              applicationLink: "https://www.te.com/en/about-te/corporate-responsibility/request-funding.html", 
              status: .closed, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: nil, 
              requires501c3: true),
        
        Grant(name: "Toshiba", 
              applicationLink: "https://www.toshiba.com/taf/612.jsp", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: false),
        
        Grant(name: "Toyota", 
              applicationLink: "https://toyotadonation.versaic.com/login", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: nil, 
              requires501c3: true),
        
        Grant(name: "Union Pacific Grant", 
              applicationLink: "https://www.up.com/aboutup/community/foundation-backup/grant-program/criteria-eligibility/index.htm", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "United Therapeutics", 
              applicationLink: "https://www.unither.com/about-us/corporate-giving", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: nil, 
              requires501c3: true),
        
        Grant(name: "Verizon", 
              applicationLink: "https://www.verizon.com/about/responsibility/giving-and-grants", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: true, 
              requires501c3: nil),
        
        Grant(name: "Walmart", 
              applicationLink: "https://walmart.org/how-we-give/program-guidelines/spark-good-local-grants-guidelines", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "Weinberg Foundation", 
              applicationLink: "https://hjweinbergfoundation.org/grants/how-we-give/", 
              status: .unsure, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "Wells Fargo", 
              applicationLink: "https://www.wellsfargo.com/about/corporate-responsibility/community-giving/", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: nil, 
              requires501c3: nil),
        
        Grant(name: "West Coast Products", 
              applicationLink: "https://docs.google.com/forms/d/e/1FAIpQLSd-t9kXURvYlsIZ94yy8r2wtq8F5GCF3Fp2o6agqSHexz7xFw/viewform", 
              status: .closed, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: false),
        
        Grant(name: "Wolfspeed Grant", 
              applicationLink: "https://usfirst.submittable.com/submit/310267/2025-wolfspeed-grant-application", 
              status: .closed, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: nil, 
              requires501c3: false),
        
        Grant(name: "Yawkey Foundation", 
              applicationLink: "https://yawkeyfoundation.org/giving-process/guidelines-eligibility/", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: true),
        
        Grant(name: "Geico", 
              applicationLink: "https://www.geico.com/philanthropic-foundation/", 
              status: .closed, 
              openDate: "October 1", 
              closeDate: "December 31", 
              requiresEmployee: nil, 
              requires501c3: true),
        
        Grant(name: "Westinghouse", 
              applicationLink: "https://westinghousenuclear.com/About/Community-and-Education/Charitable-Giving-Program/Program-Details-and-Application-Process", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: nil, 
              requires501c3: true),
        
        Grant(name: "American Honda Foundation", 
              applicationLink: "https://www.cybergrants.com/pls/cybergrants/quiz.display_question?x_gm_id=2587&x_quiz_id=1338&x_order_by=1", 
              status: .closed, 
              openDate: "February 1", 
              closeDate: nil, 
              requiresEmployee: nil, 
              requires501c3: nil),
        
        Grant(name: "Rural Technology Fund", 
              applicationLink: "https://ruraltechfund.org/apply-for-grants/", 
              status: .open, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: false, 
              requires501c3: nil),
        
        Grant(name: "NEA Foundation", 
              applicationLink: "https://www.neafoundation.org/educator-grants-and-fellowships/", 
              status: .unsure, 
              openDate: nil, 
              closeDate: nil, 
              requiresEmployee: nil, 
              requires501c3: nil)
    ]
} 