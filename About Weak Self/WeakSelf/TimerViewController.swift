//
//  TimerViewController.swift
//  WeakSelf
//
//  Created by vongvorovongvong on 2021/07/26.
//

import UIKit

class TimerViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    private var timer: Timer = Timer()
    private var repeatCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: { [weak self] timer in
                    guard let self = self else { return }
                    self.repeatCount += 1
                    print("Repeat Count: \(self.repeatCount)")
                    self.timerLabel.text = "\(self.repeatCount)"
        })
    }
    
    deinit {
        print("Deinit")
        self.timer.invalidate()
    }
}

