//
//  ViewController.swift
//  DiaAPISwift
//
//  Created by jpteruel095 on 03/09/2020.
//  Copyright (c) 2020 jpteruel095. All rights reserved.
//

import UIKit
import DiaAPISwift
import Alamofire

enum Endpoint: EndpointProtocol{
    var host: String{
        "www.example.com"
    }
    
    case login
    
    var path: String{
        switch self {
        case .login:
            return "/login"
        }
    }
}

struct LoginRequest: RequestProtocol{
    let username: String
    let password: String
}

class ViewController: UIViewController {
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTapLoginButton(_ sender: Any) {
        self.login()
    }
    
    func login(){
        let request = LoginRequest(username: "user01",
                                   password: "P@ssw0rd!")
        Endpoint.login.request(request: request) { (json, error) in
            
        }
    }
}

