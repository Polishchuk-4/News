//
//  AppleNews.swift
//  ProgramJSON.1
//
//  Created by Denis Polishchuk on 06.07.2022.
//

import UIKit

struct Source: Codable {
    let id: String?
    let name: String?
}

struct Article: Codable {
    let title: String?
    let source: Source
    let urlToImage: URL?
    let url: URL?
}

struct FullData: Codable {
    let articles: [Article]
    let totalResults: Int
    let status: String?
}

class AppleNews: UITableViewController {
    var theme: String!
    var arrayData: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getJSON()
        self.settingNavBar()
    }
    
    private func settingNavBar() {
        self.navigationItem.title = self.theme.capitalized
    }
    
    private func getJSON() {
        let urlString = "https://newsapi.org/v2/everything?q=\(self.theme!)&from=2022-09-23&to=2022-09-28&sortBy=popularity&apiKey=cbe8ac1ec8e145ebaf910e463d2cee8b"
        let url = URL(string: urlString)!
        let urlSession = URLSession.shared
        urlSession.dataTask(with: url) { data, response, error in
            let str = String.init(data: data!, encoding: .utf8)
            print(str)
            do {
                let myData = try! JSONDecoder().decode(FullData.self, from: data!)
                self.arrayData = myData.articles
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                print(myData)
            } catch {
                fatalError("\(error)")
            }
        }.resume()
    }
}

//MARK: - UITableViewDataSource -
extension AppleNews {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let idCell = "detail"
        var cell = tableView.dequeueReusableCell(withIdentifier: idCell) as? CellDetails
        if cell == nil {
            cell = CellDetails(style: .value1, reuseIdentifier: idCell)
            cell?.selectionStyle = .none
        }
        let obj = self.arrayData[indexPath.row]
        cell?.imgView.load(url: obj.urlToImage!)
        cell?.text.text = obj.title
        return cell!
    }
}

//MARK: - Delegate -
extension AppleNews {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CellDetails.height
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj = self.arrayData[indexPath.row]
        if let url = obj.url {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}

//MARK: - ImageView -
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data.init(contentsOf: url) {
                if let image = UIImage.init(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
        
    }
}
