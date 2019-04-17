//
//  ViewController.swift
//  CrosswordProject
//
//  Created by CampusUser on 4/10/19.
//  Copyright © 2019 Yarrcad. All rights reserved.
//

import UIKit
import PopupDialog
import Foundation
import AVFoundation

var level = 0
var state = 0

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
     var AudioPlayer = AVAudioPlayer()
    var clueLabel: UILabel!
    var menuButton: UIButton!
    var inputBox: UITextField!
    var popup: PopupDialog!
    
    var previousSelected : IndexPath?
    var previousNumber: Int?
    
    var data = Array("START")
    var moredata = [[0,0],[0,0],[0,0],[0,0],[0,0]]
    var clues = ["GOOOOOO","GOOOOOO","GOOOOOO","GOOOOOO","GOOOOOO"]
    var size = 5
    
    let pv = PopupDialogDefaultView.appearance()
    let pcv = PopupDialogContainerView.appearance()
    let ov = PopupDialogOverlayView.appearance()
    let db = DefaultButton.appearance()
    let cb = CancelButton.appearance()
    
    weak var timer: Timer?
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            switch state {
            case 1: switch level {
            case 1: self!.level1()
            case 2: self!.level2()
            case 3: self!.level3()
            default: break
                }
            case 2: self!.reset()
            case 3: if self!.AudioPlayer.isPlaying{self!.AudioPlayer.stop()}
                else{self!.AudioPlayer.play()}
            default: break
            }
            state = 0
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    deinit {
        stopTimer()
    }

    let mainButtonOne = DefaultButton(title: "Level 1") {
        level = 1
    }
    
    let mainButtonTwo = DefaultButton(title: "Level 2") {
        level = 2
    }
    
    let mainButtonThree = DefaultButton(title: "Level 3", height: 60) {
        level = 3
    }
    
    let mainButtonR = DefaultButton(title: "Restart Level") {
        state = 1
    }
    
    let mainButtonS = DefaultButton(title: "Select a New Level") {
        state = 2
    }
    
    let mainButtonT = DefaultButton(title: "Toggle Music", dismissOnTap: false) {
        //[weak popup] in popup?.shake()
        state = 3
    }
    
    func level1(){
        data = Array("C.FuturEh......la.B.L..en.a.o..cContracte.k.d..i.......o.Pattern")
        moredata = [[1,0], [2,0], [2,0], [2,0], [2,0], [2,0], [3,2], [1,0], [3,0], [1,0], [4,0], [5,0], [3,0], [1,0], [4,0], [5,0], [3,0], [6,1], [6,0], [4,6], [6,0], [5,6], [6,0], [6,0], [3,0], [1,0], [4,0], [5,0], [3,0], [3,0], [7,0], [7,0], [7,0], [7,0], [7,0], [7,0], [3,7]]
        clues = ["A possibility of something happening.", "The time or a period regarded as still to come.", "A formal and organized choice by vote of a person for a political office or other position.", "A place that holds money.", "Our ____ and savior.", "A written or spoken agreement.", "A repeated occurence."]
        self.size = 8
        self.collectionView.reloadData()
    }
    
    func level2(){
        data = Array("I.TeEnageRn...n....on...g....oo..Panic.tv...g...B.a..Deck.r.t...m...o.Ingrediento...n...z.Nightmare.")
        moredata = [[1,0], [2,0], [2,0], [3,2], [2,0], [2,0], [2,0], [2,0], [4,2], [1,0], [3,0], [4,0], [1,0], [3,0], [4,0], [1,0], [5,0], [3,5], [5,0], [5,0], [5,0], [4,0], [1,0], [3,0], [6,0], [1,0], [7,0], [3,7], [7,0], [7,0], [6,0], [1,0], [3,0], [6,0], [8,1], [8,0], [8,0], [8,0], [3,8], [8,0], [8,0], [8,0], [6,8], [8,0], [1,0], [3,0], [6,0], [9,1], [9,0], [9,0], [9,0], [3,9], [9,0], [9,0], [9,0], [6,9], [0,0]]
        clues = ["A new method, idea, product, etc.", "A person aged between 13 and 19 years.", "An arrangement to do something or go somewhere at a fixed time.", "The part of a plant which attaches it to the ground or to a support, typically underground.", "Sudden uncontrollable fear or anxiety, often causing wildly unthinking behavior.", "A yellowish-brown alloy of copper with up to one-third tin.", "Decorate or adorn brightly or festively.", "A component part or element of something.", "A frightening or unpleasant dream."]
        self.size = 10
        self.collectionView.reloadData()
    }
    
    func level3(){
        data = Array("PUzzLe.WiNdoW.n..o....e..o.d..s....r..r.e..TRansform.r...a........d...s........o.B.PoLice...g.e.u.a........q.t.s...R....Uninspired.G.e.n.o...n..o.e.......d.Rofflestomp..")
        moredata = [[1,0], [2,1], [1,0], [1,0], [3,1], [1,0], [4,0], [4,0], [5,4], [4,0], [4,0], [6,4], [2,0], [3,0], [5,0], [6,0], [2,0], [3,0], [5,0], [6,0], [2,0], [7,3], [8,7], [7,0], [7,4], [7,0], [7,5], [7,0], [7,0], [7,6], [2,0], [8,0], [2,0], [8,0], [2,0], [9,0], [10,8], [10,0], [11,10], [10,0], [10,0], [10,0], [2,0], [9,0], [8,0], [11,0], [9,0], [8,0], [11,0], [12,0], [13,9], [13,0], [13,8], [13,0], [13,11], [13,0], [13,0], [13,0], [13,12], [13,0], [14,0], [9,0], [10,0], [11,0], [12,0], [14,0], [9,0], [12,0], [14,0], [14,13], [14,0], [14,9], [14,0], [14,0], [14,0], [14,0], [14,0], [14,0], [14,0], ]
        clues = ["A game, toy, or problem designed to test ingenuity or knowledge.", "Unable to be found.", "Something you look through.", "Toy gun.", "Wiggly earth creature.", "What do PowerRangers do.", "Ra Ra ...", "Misspelled version of Bequeth", "THE POPO.", "Cowboy weapon.", "Tear something into two or more pieces.", "This puzzle is ...", "Like slime.", "To totally destroy an opponent who had no chance of winning. "]
        self.size = 13
        self.collectionView.reloadData()
    }
    
    func reset(){
        self.popup =  PopupDialog(title: "El Crossword App", message: "Select a Difficulty!\nDynamic Levels Comming SOON...", image: UIImage(named: "nytxword") ,tapGestureDismissal: false, panGestureDismissal: false)
        self.popup.addButtons([mainButtonOne, mainButtonTwo, mainButtonThree])
        data = Array("START")
        moredata = [[0,0],[0,0],[0,0],[0,0],[0,0]]
        clues = ["GOOOOOO","GOOOOOO","GOOOOOO","GOOOOOO","GOOOOOO"]
        size = 5
        clueLabel.text = "SELECT A CELL TO START!!!"
        self.collectionView.reloadData()
        self.present(popup, animated: true, completion: nil)
    }
    
    override func loadView() {
        super.loadView()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        let clueLabel = UILabel(frame: CGRect(x: 0, y: Int(UIScreen.main.bounds.height) - 200, width: Int(UIScreen.main.bounds.width), height: 60))
        let inputBox = UITextField(frame: CGRect(x: 0.0, y: 0.0, width: 100.0, height: 30.0))
        let menuButton = UIButton(frame: CGRect(x: Int(UIScreen.main.bounds.width) - 100, y: Int(UIScreen.main.bounds.height) - 125, width: 50, height: 50))
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        self.view.addSubview(clueLabel)
        self.view.addSubview(inputBox)
        self.view.addSubview(menuButton)
        inputBox.isHidden = true
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: collectionView.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor),
            self.view.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor),
            ])
        clueLabel.textAlignment = NSTextAlignment.center;
        clueLabel.text = "SELECT A CELL TO START!!!"
        clueLabel.numberOfLines = 2
        menuButton.setImage(UIImage(named: "cogerino"), for: .normal)
        menuButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        self.collectionView = collectionView
        self.clueLabel = clueLabel
        self.inputBox = inputBox
        self.menuButton = menuButton
        self.popup =  PopupDialog(title: "El Crossword App", message: "Select a Difficulty!\nDynamic Levels Comming SOON...", image: UIImage(named: "nytxword") ,tapGestureDismissal: false, panGestureDismissal: false)
    }
    
    @objc func buttonAction(sender: UIButton!) {
        self.popup =  PopupDialog(title: "El Crossword App", message: "Options", image: UIImage(named: "nytxword") ,tapGestureDismissal: true, panGestureDismissal: true)
        self.popup.addButtons([mainButtonR, mainButtonS, mainButtonT])
        self.present(popup, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        self.collectionView.alwaysBounceVertical = true
        self.collectionView.backgroundColor = .white
        pv.titleFont    = UIFont(name: "HelveticaNeue-Light", size: 24)!
        pv.titleColor   = .white
        pv.messageFont  = UIFont(name: "HelveticaNeue", size: 16)!
        pv.messageColor = UIColor(white: 0.8, alpha: 1)
        pcv.backgroundColor = UIColor(red:0.23, green:0.23, blue:0.27, alpha:1.00)
        pcv.cornerRadius    = 2
        pcv.shadowEnabled   = true
        pcv.shadowColor     = .black
        ov.blurEnabled     = true
        ov.blurRadius      = 30
        ov.liveBlurEnabled = true
        ov.opacity         = 0.7
        ov.color           = .black
        db.titleFont      = UIFont(name: "HelveticaNeue-Medium", size: 14)!
        db.titleColor     = .white
        db.buttonColor    = UIColor(red:0.25, green:0.25, blue:0.29, alpha:1.00)
        db.separatorColor = UIColor(red:0.20, green:0.20, blue:0.25, alpha:1.00)
        cb.titleFont      = UIFont(name: "HelveticaNeue-Medium", size: 14)!
        cb.titleColor     = UIColor(white: 0.6, alpha: 1)
        cb.buttonColor    = UIColor(red:0.25, green:0.25, blue:0.29, alpha:1.00)
        cb.separatorColor = UIColor(red:0.20, green:0.20, blue:0.25, alpha:1.00)
        self.inputBox.addTarget(self, action: #selector(textFieldEditingDidChange), for: .editingChanged)
        startTimer()
        let AssortedMusics = NSURL(fileURLWithPath: Bundle.main.path(forResource: "bensound-ukulele", ofType: "wav")!)
        AudioPlayer = try! AVAudioPlayer(contentsOf: AssortedMusics as URL)
        AudioPlayer.prepareToPlay()
        AudioPlayer.numberOfLoops = -1
        AudioPlayer.play()
    }
    
    
    @objc func textFieldEditingDidChange(_ sender: Any){
        let tempCellA = collectionView.cellForItem(at: previousSelected!) as! Cell
        if (tempCellA.backgroundColor != UIColor.green){
            tempCellA.input = self.inputBox.text
            tempCellA.textLabel.text = self.inputBox.text!.lowercased()
            self.inputBox.text = ""
            if(tempCellA.input!.lowercased() == tempCellA.letter!.lowercased()){
                tempCellA.good = true
            }
            else{
                tempCellA.good = false
            }
            var prevIndex = previousSelected
            repeat{
                if previousSelected!.row + 1 <= ((size * size) - 1){
                for n in previousSelected!.row + 1...((size * size) - 1){
                    let tempCellB = collectionView.cellForItem(at: [0,n]) as! Cell
                    if ((tempCellB.numbers[0] == previousNumber || tempCellB.numbers[1] == previousNumber)){
                        previousSelected = [0,n]
                        tempCellB.layer.borderColor = UIColor.red.cgColor
                        tempCellA.layer.borderColor = UIColor.yellow.cgColor
                        break
                    }
                }
                    if (previousSelected == prevIndex){
                        var test = true
                        for n in 0...((size * size) - 1){
                            let tempCellB = collectionView.cellForItem(at: [0,n]) as! Cell
                            if (tempCellB.good == false && (tempCellB.numbers[0] == previousNumber || tempCellB.numbers[1] == previousNumber)){
                                test = false
                            }
                        }
                        if test == true{
                            for n in 0...((size * size) - 1){
                                let tempCellB = collectionView.cellForItem(at: [0,n]) as! Cell
                                if (tempCellB.numbers[0] == previousNumber || tempCellB.numbers[1] == previousNumber){
                                    tempCellB.backgroundColor = UIColor.green
                                }
                            }
                        }
                        var SUPERTEST = true
                        for n in 0...((size * size) - 1){
                            let tempCellB = collectionView.cellForItem(at: [0,n]) as! Cell
                            if (tempCellB.good == false  && tempCellB.letter != "."){
                                SUPERTEST = false
                            }
                        }
                        if SUPERTEST == true{
                            reset()
                            
                        }
                        else{
                            previousSelected = [0,0]
                            prevIndex = [0,0]
                            tempCellA.layer.borderColor = UIColor.yellow.cgColor
                            let tempCellB = collectionView.cellForItem(at: [0,0]) as! Cell
                            if(previousNumber == 1 && (tempCellB.numbers[0] == previousNumber || tempCellB.numbers[1] == previousNumber)){
                                tempCellB.layer.borderColor = UIColor.red.cgColor
                                break
                            }
                        }
                        if test == true {
                            break
                        }
                    }
                    else{
                        var test = true
                        for n in 0...((size * size) - 1){
                            let tempCellB = collectionView.cellForItem(at: [0,n]) as! Cell
                            if (tempCellB.good == false && (tempCellB.numbers[0] == previousNumber || tempCellB.numbers[1] == previousNumber)){
                                test = false
                            }
                        }
                        if test == true{
                            for n in 0...((size * size) - 1){
                                let tempCellB = collectionView.cellForItem(at: [0,n]) as! Cell
                                if (tempCellB.numbers[0] == previousNumber || tempCellB.numbers[1] == previousNumber){
                                    tempCellB.backgroundColor = UIColor.green
                                }
                            }
                        }
                        var SUPERTEST = true
                        for n in 0...((size * size) - 1){
                            let tempCellB = collectionView.cellForItem(at: [0,n]) as! Cell
                            if (tempCellB.good == false && tempCellB.letter != "."){
                                SUPERTEST = false
                            }
                        }
                        if SUPERTEST == true{
                            reset()
                            break
                        }
                        else{
                            let tempCellB = collectionView.cellForItem(at: previousSelected!) as! Cell
                            if (tempCellB.backgroundColor != UIColor.green || test == true){
                                break
                            }
                        }
                    }
                }
            } while (true)
        }
        else{
            self.inputBox.text = ""
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        self.popup.addButtons([mainButtonOne, mainButtonTwo, mainButtonThree])
        self.present(self.popup, animated: true, completion: nil)
    }
}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as! Cell
        let data = self.data[indexPath.item]
        cell.letter = String(data)
        if cell.letter == "." {
            cell.backgroundColor = UIColor.black
        }
        else if cell.letter != cell.letter?.lowercased(){
            cell.numbers[0] = moredata[0][0]
            cell.numbers[1] = moredata[0][1]
            moredata.removeFirst()
            cell.numberLabel.text = String(cell.numbers[0])
        }
        else {
            cell.numbers[0] = moredata[0][0]
            cell.numbers[1] = moredata[0][1]
            moredata.removeFirst()
        }
        if size < 8{
            cell.numberLabel.text = ""
            cell.textLabel.text = cell.letter
            cell.textLabel.textColor = UIColor.green
            cell.backgroundColor = UIColor.blue
        }
        else{
            cell.textLabel.textColor = UIColor.black
        }
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let currentCell = collectionView.cellForItem(at: indexPath) as! Cell
        if size < 8 {
            state = 1
        }
        else {
            if (currentCell.letter != "." && indexPath != previousSelected && currentCell.backgroundColor != UIColor.green){
                inputBox.becomeFirstResponder()
                previousNumber = currentCell.numbers[0]
                clueLabel.text = clues[Int(currentCell.numbers[0]) - 1]
                for n in 0...((size * size) - 1){
                    let tempCell = collectionView.cellForItem(at: [0,n]) as! Cell
                    if (tempCell.numbers[0] == previousNumber || tempCell.numbers[1] == previousNumber){
                        if(n == indexPath.row){
                         tempCell.layer.borderColor = UIColor.red.cgColor
                        }
                        else{
                            tempCell.layer.borderColor = UIColor.yellow.cgColor
                        }
                    }
                    else {
                        tempCell.layer.borderColor = UIColor.black.cgColor
                    }
                }
                previousSelected = indexPath
            }
            else if (currentCell.letter != "." && indexPath == previousSelected && currentCell.backgroundColor != UIColor.green){
                inputBox.becomeFirstResponder()
                if (previousNumber == currentCell.numbers[0] && currentCell.numbers[1] != 0){
                    previousNumber = currentCell.numbers[1]
                    clueLabel.text = clues[Int(currentCell.numbers[1]) - 1]
                }
                else{
                    previousNumber = currentCell.numbers[0]
                    clueLabel.text = clues[Int(currentCell.numbers[0]) - 1]
                }
                for n in 0...((size * size) - 1){
                    let tempCell = collectionView.cellForItem(at: [0,n]) as! Cell
                    if (tempCell.numbers[0] == previousNumber || tempCell.numbers[1] == previousNumber){
                        if(n == indexPath.row){
                            tempCell.layer.borderColor = UIColor.red.cgColor
                        }
                        else{
                            tempCell.layer.borderColor = UIColor.yellow.cgColor
                        }
                    }
                    else {
                        tempCell.layer.borderColor = UIColor.black.cgColor
                    }
                }
                previousSelected = indexPath
            }
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = Int(UIScreen.main.bounds.width)
        let seze: CGFloat = (CGFloat)(width/(size + 1))
        return CGSize(width: seze, height: seze)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        let width = Int(UIScreen.main.bounds.width)
        let side: CGFloat = (CGFloat)(((width) - ((size) * (width/(size + 1)))) / 2)
        return UIEdgeInsets(top: 50, left: side, bottom: 0, right: side)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}
