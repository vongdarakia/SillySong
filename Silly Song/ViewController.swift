//
//  ViewController.swift
//  Silly Song
//
//  Created by Akia Vongdara on 1/7/17.
//  Copyright © 2017 Akia Vongdara. All rights reserved.
//

import UIKit

//extension ViewController: UITextViewDelegate {
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return false
//    }
//}

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!
    
    let bananaFanaTemplate = ["<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>", "Banana Fana Fo F<SHORT_NAME>", "Me My Mo M<SHORT_NAME>", "<FULL_NAME>"].joined(separator: "\n")
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
    
    func shortNameForName(name: String) -> String {
        let lowercaseName = name.lowercased()
        let vowelSet = "aeiouáéíóúäëïöüâêîôû"
        
//        var i = 0;
        
        for c1 in vowelSet.characters {
            if (lowercaseName.contains("\(c1)")) {
                let range: Range<String.Index> = lowercaseName.range(of: "\(c1)")!;
                let index: Int = lowercaseName.distance(from: lowercaseName.startIndex, to: range.lowerBound)
                let index2 = lowercaseName.index(lowercaseName.startIndex, offsetBy: index)
                return lowercaseName.substring(from: index2);
            }
        }
//        for c1 in lowercaseName.unicodeScalars {
//            if vowelSet.contains(c1) {
//                return lowercaseName.substring(from: lowercaseName.index(after: c1));
//            }
////            for c2 in vowelSet {
////                if (c1 == c2)
////                    return lowercaseName.substring(from: i);
////                
////            }
//            i += 1
//        }
        return "";
    }
    
    func lyrics(lyricsTemplate: String, fullName: String) -> String {
        let shortName = shortNameForName(name: fullName)
        
        let lyrics = lyricsTemplate
            .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
            .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
        
        return lyrics
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reset(_ sender: Any) {
        nameField.text = "";
        lyricsView.text = "";
    }
    
    
    @IBAction func displayLyrics(_ sender: Any) {
        lyricsView.text = lyrics(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        
    }
    
    

}

