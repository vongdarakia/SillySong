//
//  ExtensionViewController.swift
//  Silly Song
//
//  Created by Akia Vongdara on 1/31/17.
//  Copyright © 2017 Akia Vongdara. All rights reserved.
//

import UIKit

extension ViewController {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
