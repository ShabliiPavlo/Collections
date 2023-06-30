//
//  ArrayViewController.swift
//  Collections
//
//  Created by Pavel Shabliy on 29.06.2023.
//

import UIKit

class ArrayViewController: UIViewController {
    
    @IBOutlet weak var createArreyButton: UIButton!
    @IBOutlet weak var createArreyIndicator: UIActivityIndicatorView!
    
    // 1 column
    @IBOutlet weak var insertBeginingByOneIndicator: UIActivityIndicatorView!
    @IBOutlet weak var insertBeginingByOneButtom: UIButton!
    
    @IBOutlet weak var insertMiddleByOneIndicator: UIActivityIndicatorView!
    @IBOutlet weak var insertMiddleByOneButtom: UIButton!
    
    @IBOutlet weak var insertEndByOneIndicator: UIActivityIndicatorView!
    @IBOutlet weak var insertEndByOneButtom: UIButton!
    
    @IBOutlet weak var removeBeginingByOneIndicator: UIActivityIndicatorView!
    @IBOutlet weak var removeBeginingByOneButtom: UIButton!
    
    @IBOutlet weak var removeMiddleByOneIndicator: UIActivityIndicatorView!
    @IBOutlet weak var removeMiddleByOneButtom: UIButton!
    
    @IBOutlet weak var removeEndByOneIndicator: UIActivityIndicatorView!
    @IBOutlet weak var removeEndByOneButtom: UIButton!
    
    // 2 column
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func createArreyButtomPressed(_ sender: UIButton) {
        
        createArreyIndicator.isHidden = false
        createArreyIndicator.startAnimating()
        createArreyButton.setTitle("", for: .normal)
        
        DispatchQueue.main.async {
            self.createArreyButton.setTitle(self.measureExecutionTime {
                var array = Array(0..<10_000_000)
            }, for: .normal)
            
            DispatchQueue.main.async {
                self.createArreyIndicator.stopAnimating()
                self.createArreyIndicator.isHidden = true
                self.insertBeginingByOneButtom.isHidden = false
                self.insertMiddleByOneButtom.isHidden = false
                self.insertEndByOneButtom.isHidden = false
                self.removeBeginingByOneButtom.isHidden = false
                self.removeMiddleByOneButtom.isHidden = false
                self.removeEndByOneButtom.isHidden = false
            }
        }
    }
    
    @IBAction func insertBeginingByOneButtomPressed(_ sender: UIButton) {
        
        var array = Array(0..<10_000_000)
        insertBeginingByOneIndicator.isHidden = false
        insertBeginingByOneIndicator.startAnimating()
        insertBeginingByOneButtom.setTitle("", for: .normal)
        
        DispatchQueue.main.async {
            self.insertBeginingByOneButtom.setTitle(self.measureExecutionTime {
                for i in (0..<1000).reversed() {
                    array.insert(i, at: 0)
                }
            }, for: .normal)
            DispatchQueue.main.async {
                self.insertBeginingByOneIndicator.stopAnimating()
                self.insertBeginingByOneIndicator.isHidden = true
            }
        }
    }
    
    func measureExecutionTime(task: () -> Void) -> String {
        let startTime = CFAbsoluteTimeGetCurrent()
        task()
        let endTime = CFAbsoluteTimeGetCurrent()
        
        let executionTime = endTime - startTime
        return String(executionTime)
    }
}
