//
//  CellManager.swift
//  ProgramJSON.1
//
//  Created by Denis Polishchuk on 05.07.2022.
//

import UIKit

class CellImage: UITableViewCell {
    var imgView: UIImageView!
    var label: UILabel!
    
    static let height: CGFloat = 200
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.createImgView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createImgView() {
        self.imgView = UIImageView()
        self.imgView.frame.size.width = UIScreen.main.bounds.width - CGFloat.offset * 2
        self.imgView.frame.size.height = CellImage.height - CGFloat.offset * 2
        self.imgView.frame.origin = CGPoint(x: CGFloat.offset, y: CGFloat.offset)
        self.imgView.backgroundColor = .black
        self.imgView.layer.cornerRadius = self.imgView.frame.height / 6
        self.imgView.clipsToBounds = true
        self.contentView.addSubview(self.imgView)
    }
}
