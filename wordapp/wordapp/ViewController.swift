//
//  ViewController.swift
//  wordapp
//
//  Created by Manavarthi,Sanjay Krishna on 2/22/22.
//

import UIKit

class ViewController: UIViewController {

   
    
    @IBOutlet weak var displaylable: UILabel!
    
    @IBOutlet weak var enterletter: UITextField!
    
    
    @IBOutlet weak var Hintlable: UILabel!
    
    
    @IBOutlet weak var checkbutton: UIButton!
    
    

    @IBOutlet weak var statuslable: UILabel!
    
    
    @IBOutlet weak var playagain: UIButton!
    
    
    var words=[["SWIFT","Programming Language"],["CAT","Friendlypet"],["CAR","Four wheeler"],["Iphone","Most used Mobile"]]
    
    var count = 0;
        var word = ""
        var lettersGuessed = ""

    
override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    checkbutton.isEnabled = false;
            word = words[count][0]
            displaylable.text = ""
            for letter in word{
                displaylable.text! += "- "
            }
            Hintlable.text = "Hint: "+words[count][1]
            statuslable.text = ""
    
    }



    
    
    @IBAction func checkbtn(_ sender: UIButton) {
        
        var letter = enterletter.text!
                lettersGuessed = lettersGuessed + letter
                 var revealedWord = ""
                for l in word{
                    if lettersGuessed.contains(l){
                        revealedWord += "\(l)"
                    }
                    else{
                        revealedWord += "_ "
                    }
                }
                displaylable.text = revealedWord
                enterletter.text = ""
                
                if displaylable.text!.contains("_") == false{
                    playagain.isHidden = false;
                    checkbutton.isEnabled = false;
                }
            }
    
    
    @IBAction func playbtn(_ sender: UIButton) {
        
        
        playagain.isHidden = true
               //clear the label
               lettersGuessed = ""
               count += 1
               if count == words.count{
                   
                   statuslable.text = "Congruations! You are done with the game!"
               }
               else{
               word = words[count][0]
               Hintlable.text = "Hint: "
               Hintlable.text! += words[count][1]
               checkbutton.isEnabled = true
               
               displaylable.text = ""
                   updateunderscores()
               }
    }
    
    
    @IBAction func enterlablechanged(_ sender: UITextField) {
        
        var textEnterd = enterletter.text!;
                textEnterd = String(textEnterd.last ?? " ").trimmingCharacters(in: .whitespaces)
                enterletter.text = textEnterd
                
                if textEnterd.isEmpty{
                    checkbutton.isEnabled = false
                }
                else{
                    checkbutton.isEnabled = true
                }
        
        
    }
func updateunderscores(){
        
        for letter in word{
            displaylable.text! += "- "
}

}
}

