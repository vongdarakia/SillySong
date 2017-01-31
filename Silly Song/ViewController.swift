//
//  ViewController.swift
//  Silly Song
//
//  Created by Akia Vongdara on 1/7/17.
//  Copyright © 2017 Akia Vongdara. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lyricsView: UITextView!

    let bananaFanaTemplate = ["<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>", "Banana Fana Fo F<SHORT_NAME>", "Me My Mo M<SHORT_NAME>", "<FULL_NAME>"].joined(separator: "\n")
    
    func shortNameForName(name: String) -> String {
        var lowercaseName = name.lowercased()
        let vowelSet = "aeiouáéíóúäëïöüâêîôû"
        
        let characters = lowercaseName.characters

        for c1 in characters {
            if (!vowelSet.contains("\(c1)")) {
                lowercaseName.remove(at: lowercaseName.startIndex)
            }
            else {
                break
            }
        }
        return lowercaseName.isEmpty ? name.lowercased() : lowercaseName;
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
    }

    
    @IBAction func reset(_ sender: Any) {
        nameField.text = "";
        lyricsView.text = "";
    }
    
    
    @IBAction func displayLyrics(_ sender: Any) {
        lyricsView.text = lyrics(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
    }
}

