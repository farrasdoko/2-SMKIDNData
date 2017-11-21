//
//  DaftarViewController.swift
//  DataSMKIDN
//
//  Created by Gw on 16/11/17.
//  Copyright © 2017 Gw. All rights reserved.
//

import UIKit
//import library
import Alamofire
import SwiftyJSON
class DaftarViewController: UIViewController {

    @IBOutlet weak var etEmail: UITextField!
    @IBOutlet weak var etPassword: UITextField!
    @IBOutlet weak var etUsername: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func btnDaftar(_ sender: Any) {
        
        //declare var to put on value of each widget textfield
        let nilaiUser = etUsername.text
        let nilaiPassword = etPassword.text
        let nilaiEmail = etEmail.text
        
        //check if wiget is empty
        if ((nilaiUser?.isEmpty)! || (nilaiEmail?.isEmpty)! || (nilaiPassword?.isEmpty)!){
            
            //muncul alert dalog
            let alertWarning = UIAlertController(title: "Warning", message: "This is Required", preferredStyle: .alert)
            let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertWarning.addAction(aksi)
            present(alertWarning, animated: true, completion: nil)
        }else{
            //if widget is empty
            //make parameter to dsimpan ke database
            let params = ["email" : nilaiEmail!, "password" : nilaiPassword!, "username" : nilaiUser]
            //print value of params that has sent
            print(params)
            
            let url = "http://localhost/ServerKelas/index.php/DataGuru/daftar"
            
            Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler: { (responseServer) in
                
                print(responseServer.result.isSuccess)
                
                if responseServer.result.isSuccess{
                    let json = JSON(responseServer.result.value as Any)
                    //muncul alert dialog
                    let alertWarning = UIAlertController(title: "Congrats", message: "Data Is Saved", preferredStyle: .alert)
                    let aksi = UIAlertAction(title: "OK", style: .default, handler: nil)
                    alertWarning.addAction(aksi)
                    self .present(alertWarning, animated: true, completion: nil)
                }
            })
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
