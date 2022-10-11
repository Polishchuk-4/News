//
//  String.swift
//  ProgramJSON.1
//
//  Created by Denis Polishchuk on 05.07.2022.
//

import UIKit

extension String {
    func getSymbol(pointSize: CGFloat, weight: UIImage.SymbolWeight) -> UIImage {
        let config = UIImage.SymbolConfiguration.init(pointSize: pointSize, weight: weight)
        let image = UIImage.init(systemName: self, withConfiguration: config)
        return image!
    }
}
