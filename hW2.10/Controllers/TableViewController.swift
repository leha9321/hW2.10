//
//  TableViewController.swift
//  hW2.10
//
//  Created by Алексей Трофимов on 01.12.2021.
//

import UIKit

class TableViewController: UITableViewController {

    let jsonOne = "https://anapioficeandfire.com/api/characters/583"
    var heros = HeroOfFilm(name: "", gender: "", culture: "", born: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
    

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var her: [String?] = []
        her.append(heros.name)
        her.append(heros.born)
        her.append(heros.culture)
        her.append(heros.gender)
        cell.textLabel?.text = her[0]
        return cell
    }
   
    func fetchData (){
        guard let url = URL(string: jsonOne) else { return }
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                self.heros = try decoder.decode(HeroOfFilm.self, from: data)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
        
    }
}
