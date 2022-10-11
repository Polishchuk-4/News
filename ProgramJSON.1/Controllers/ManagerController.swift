//
//  ViewController.swift
//  ProgramJSON.1
//
//  Created by Denis Polishchuk on 05.07.2022.
//

import UIKit

struct PhotoTheme {
    let image: UIImage
    let theme: String
}

class ManagerController: UITableViewController {
    var arrImage: [PhotoTheme] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.settingNavBar()
        self.createObjc()
        
    }
    
    private func createObjc() {
        let apple = PhotoTheme(image: UIImage(named: "apple.jpg")!, theme: "apple")
        let tesla = PhotoTheme(image: UIImage(named: "tesla.jpg")!, theme: "tesla")
        let gizmodo = PhotoTheme(image: UIImage(named: "gizmodo.jpg")!, theme: "gizmodo")
        let techCrunch = PhotoTheme(image: UIImage(named: "techCrunch.jpg")!, theme: "techCrunch")
        let wallst = PhotoTheme(image: UIImage(named: "wallst.jpg")!, theme: "wallst")
        self.arrImage.append(contentsOf: [apple, tesla, gizmodo, techCrunch, wallst])
        tableView.reloadData()
    }
    
    private func settingNavBar() {
        let image = "camera".getSymbol(pointSize: 0, weight: .light)
        let widthNavBar = self.navigationController!.navigationBar.frame.width
        let heighthNavBar = self.navigationController!.navigationBar.frame.height
        
        let view = UIView()
        view.frame.size = CGSize(width: widthNavBar, height: heighthNavBar)
        let label = UILabel()
        label.frame.size.height = heighthNavBar * 1.2
        label.frame.size.width = 100
        label.center.x = widthNavBar / 2 - heighthNavBar * 1.2 / 2
        label.font = UIFont(name: "AvenirNext-BoldItalic", size: 30)
        label.text = "NEWS"
        view.addSubview(label)
        
        let imageView = UIImageView()
        imageView.frame.size = CGSize(width: heighthNavBar * 1.2, height: heighthNavBar * 1.2)
        imageView.frame.origin.x = label.frame.origin.x + label.frame.width
        imageView.center.y = label.center.y - 4
        imageView.image = image
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        self.navigationItem.titleView = view
    }
}


//MARK: - UITableViewDataSource -
extension ManagerController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrImage.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idCell = "news"
        var cell = tableView.dequeueReusableCell(withIdentifier: idCell) as? CellImage
        if cell == nil {
            cell = CellImage(style: .value1, reuseIdentifier: idCell)
            cell?.selectionStyle = .none
        }
        let objc = self.arrImage[indexPath.row]
        cell?.imgView.image = objc.image
        return cell!
    }
}

//MARK: - UITableViewDelegate -
extension ManagerController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CellImage.height
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AppleNews()
        let objc = self.arrImage[indexPath.row]
        vc.theme = objc.theme
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

