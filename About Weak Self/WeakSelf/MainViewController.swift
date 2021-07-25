//
//  MainViewController.swift
//  WeakSelf
//
//  Created by vongvorovongvong on 2021/07/26.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pushButtonAction(_ sender: Any) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TimerViewController") as? TimerViewController else {
            return
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

