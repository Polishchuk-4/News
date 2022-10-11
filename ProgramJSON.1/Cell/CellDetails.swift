//
//  CellDetails.swift
//  ProgramJSON.1
//
//  Created by Denis Polishchuk on 06.07.2022.
//

import UIKit

class CellDetails: UITableViewCell {
    var imgView: UIImageView!
    var text: UILabel!
    var label: UILabel!
    static let height: CGFloat = 150
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createImgView()
        createText()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createImgView() {
        self.imgView = UIImageView()
        let sizeImgView: CGFloat = CellDetails.height - CGFloat.offset * 2
        self.imgView.frame.size = CGSize(width: sizeImgView, height: sizeImgView)
        self.imgView.frame.origin = CGPoint(x: CGFloat.offset, y: CGFloat.offset)
        self.imgView.layer.cornerRadius = imgView.frame.height / 5
        self.imgView.backgroundColor = .yellow
        self.imgView.contentMode = .scaleAspectFill
        self.imgView.clipsToBounds = true
        self.imgView.layer.cornerRadius = self.imgView.frame.height / 4
        self.contentView.addSubview(self.imgView)
    }
    
    private func createText() {
        self.text = UILabel()
        self.text.frame.size.width = UIScreen.main.bounds.width - self.imgView.frame.width - CGFloat.offset * 3
        self.text.frame.size.height = CellDetails.height * 0.7
        self.text.center.y = self.imgView.center.y
        self.text.frame.origin.x = self.imgView.frame.width + CGFloat.offset * 2
//        self.text.backgroundColor = .yellow
        self.text.numberOfLines = 0
        self.text.font = UIFont.systemFont(ofSize: 25)
        self.text.text = "self.text.frame.origin.x = self.imgView.frame.width + CGFloat.offset * 2"
        self.contentView.addSubview(self.text)
    }
    
    private func createLabel() {
        self.label = UILabel()
        
    }
}
