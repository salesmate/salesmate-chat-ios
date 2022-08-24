//
//  ViewController.swift
//  Sample-Swift
//
//  Created by Vishal Nandoriya on 27/07/22.
//

import UIKit
import SalesmateChatSDK

class ViewController: UIViewController {

    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set Visitor Id
        setVerifiedId()
    }

    func setVerifiedId() {
        guard !SalesmateChat.getVisitorId().isEmpty else {
            return
        }
        SalesmateChat.setVerifiedID(SalesmateChat.getVisitorId())
    }
    
    //MARK: - IBActions
    @IBAction func presentMessenger(_ sender: UIButton) {
        SalesmateChat.presentMessenger(from: self)
    }

    @IBAction func logEvent(_ sender: Any) {
        
        let eventName = "Testing Event"
        let key = "testEventKey"
        let value = "testEventValue"
        
        SalesmateChat.logEventWith(eventName: eventName, withData: [key:value]);
        
        
        self.showAlertWithTitle(title: "Event Queued for delivery", andMessage: "");
    }

    @IBAction func loginPressed(_ sender: Any) {
        userLogin()
    }
    
    @IBAction func updatePressed(_ sender: UIButton) {
        
        /// Update
        // SalesmateChat.update(userId: "", email: "", firstName: "", lastName: "", completion: nil)
    }

    @IBAction func logout(_ sender: Any) {
        SalesmateChat.logout()
        self.showAlertWithTitle(title: "Salesmate Chat", andMessage: "Logout Success")
    }
}

extension ViewController {
    
    func userLogin() {
        let userId = randomFakeUserId()
        let email = randomFakeEmail()
        let firstName = randomFakeFirstName()
        let lastName = randomFakeLastName()

        SalesmateChat.loginWith(userId: userId, email: email, firstName: firstName, lastName: lastName, completion: { (success, error)  in
            if error == nil {
                DispatchQueue.main.async {
                    self.showAlertWithTitle(title: "Salesmate Chat", andMessage: "Login Success")
                }
            }
        })
    }

    func randomFakeUserId() -> String {
        let userIdList = ["Henry123", "William234", "Geoffrey345", "Jim456", "Yvonne567", "Jamie678", "Leticia789", "Priscilla890", "Sidney012", "Nancy109", "Edmund298", "Bill376", "Megan037"]
        return userIdList.randomElement()!
    }

    func randomFakeEmail() -> String {
        let emailList = ["Henry@test.com", "William@test.com", "Geoffrey@test.com", "Jim@test.com", "Yvonne@test.com", "Jamie@test.com", "Leticia@test.com", "Priscilla@test.com", "Sidney@test.com", "Nancy@test.com", "Edmund@test.com", "Bill@test.com", "Megan@test.com"]
        return emailList.randomElement()!
    }

    func randomFakeFirstName() -> String {
        let firstNameList = ["Henry", "William", "Geoffrey", "Jim", "Yvonne", "Jamie", "Leticia", "Priscilla", "Sidney", "Nancy", "Edmund", "Bill", "Megan"]
        return firstNameList.randomElement()!
    }
    
    func randomFakeLastName() -> String {
        let lastNameList = ["Pearson", "Adams", "Cole", "Francis", "Andrews", "Casey", "Gross", "Lane", "Thomas", "Patrick", "Strickland", "Nicolas", "Freeman"]
        return lastNameList.randomElement()!
    }

    func showAlertWithTitle(title:String, andMessage message:String){
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let cancelAction = UIAlertAction(title: "OK", style: .cancel, handler: nil);
        alertVC.addAction(cancelAction);
        self.present(alertVC, animated: true, completion: nil);
    }

}
