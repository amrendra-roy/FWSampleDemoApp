//
//  ViewController.swift
//  FWSampleDemoApp
//
//  Created by Amrendra on 08/01/23.
//

import UIKit
import FWAmarRechargeSDK
import FWAmarInvestmentSDK
import FWAmarFramewokrFromGitOnly

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let frameworkClassIns = RechargeFWClass()
        frameworkClassIns.doRecharge(for: "BSNL")
        frameworkClassIns.doRechargeByUsingHelperPrivateMethod()
        //frameworkClassIns.sayHelloPrivate() //Should not able to access from out side of framework
        
        // Access resources from Framework
        let frameworkBundle = Bundle(for: RechargeFWClass.self)
        if let path = frameworkBundle.path(forResource: "AmarResources", ofType: "bundle") {
            let resourceBundle = Bundle(url: URL(fileURLWithPath: path))
            let image = UIImage(named: "JyotiPhoto.png", in: resourceBundle, compatibleWith: nil)
            print("Image from FrameWork Bundle = \(String(describing: image))")
            imageView.image = image
        }
        
        paymetnCardUses()
        
        
        // Access function from a project which is not availble locally in this path 'FWAmarFramewokrFromGitOnly'
        let testFileInFramework = TestFileInFramework()
        testFileInFramework.testMethodFromFramework()
        testFileInFramework.testAnotherMethodFromFramework()
    }
    
    func paymetnCardUses() {
        let emp1 = PaymentManager(with: PaymentManager.EmployeeLevel.Trainee(true))
        print("Trainee payment in provision = \(emp1.calculatePayment()) \n")
        
        let emp5 = PaymentManager(with: PaymentManager.EmployeeLevel.Trainee(false))
        print("Trainee payment NOT in provision = \(emp5.calculatePayment()) \n")
        
        let emp2 = PaymentManager(with: .Engineer)
        print("Engineer payment is = \(emp2.calculatePayment()) \n")
        
        let emp3 = PaymentManager(with: .Lead)
        print("Lead payment = \(emp3.calculatePayment()) \n")
        
        let emp4 = PaymentManager(with: .Manager)
        print("Manager payment = \(emp4.calculatePayment()) \n")
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let investmentFrameworkIns = APIManagerClient()
        investmentFrameworkIns.fetchUserLoginDemo()
        print("investmentFramework inst = \(investmentFrameworkIns)")
        
    }
    
    // AMAR: ToDo
    // Sdk view controller able to present, but need more work to manage callback, navigation and others
    @IBAction func presentUIViewControllerFromSDK(_ sender: UIButton) {
        let invesetmentSDKIns = APIManagerClient()
        if let vc = invesetmentSDKIns.presentViewControllerFromSDK(duration: 2, amount: 23422.09, handler: { keyValue in
            print("SDK has dismissed with value = \(keyValue)")
        }) {
            vc.isModalInPresentation = true
            //vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
}


