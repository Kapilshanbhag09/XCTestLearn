//
//  ViewController.swift
//  XCTestLearn
//
//  Created by Kapil Shanbhag on 28/05/24.
//

import UIKit

class ViewController: UIViewController {
    private var count: Int = 0

    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var testButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testLabel.text = "\(count)"
        testButton.setTitle("Add", for: .normal)
        testButton.accessibilityLabel = "MyAdd_Button"
    }
    func isEven(number: Int) -> Bool {
        return number % 2 == 0
    }

    @IBAction func testButtonTapped(_ sender: Any) {
        count += 1
        testLabel.text = "\(count)"
    }
}

