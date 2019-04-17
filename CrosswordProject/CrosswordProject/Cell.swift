//
//  Cell.swift
//  CrosswordProject
//
//  Created by CampusUser on 4/10/19.
//  Copyright © 2019 Yarrcad. All rights reserved.
//
import UIKit

class Cell: UICollectionViewCell {
    
    static var identifier: String = "Cell"
    
    weak var textLabel: UILabel!
    weak var numberLabel: UILabel!
    
    var letter: String?
    var numbers = [0,0]
    var input: String?
    var good = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let textLabel = UILabel(frame: .zero)
        let numberLabel = UILabel.init(frame: CGRect(x:2,y:2,width:15,height:10))
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.font = numberLabel.font.withSize(10)
        self.contentView.addSubview(textLabel)
        self.contentView.addSubview(numberLabel)
        NSLayoutConstraint.activate([
            self.contentView.centerXAnchor.constraint(equalTo: textLabel.centerXAnchor),
            self.contentView.centerYAnchor.constraint(equalTo: textLabel.centerYAnchor),
            ])
        self.textLabel = textLabel
        self.numberLabel = numberLabel
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.textLabel.textAlignment = .center
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.textLabel.text = ""
        self.numberLabel.text = ""
        self.backgroundColor = UIColor.white
        self.layer.borderColor = UIColor.black.cgColor
        self.letter = ""
        self.numbers = [0,0]
        self.input = ""
        self.good = false
        
    }
}
