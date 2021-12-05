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
  
    var hero: [String] = []
    
    override func viewDidLoad() {
      
        super.viewDidLoad()
     
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 4
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        metod().
        cell.textLabel?.text = hero[indexPath.row]
        return cell
    }
   
    func fetchData (){
        
        guard let url = URL(string: jsonOne) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let decoder = JSONDecoder()
            do {
                self.heros = try decoder.decode(HeroOfFilm.self, from: data)
                print(self.heros)
            
            } catch let error {
                print(error.localizedDescription)
            } 
        }.resume()

    }
    func metod(){
    hero.append(self.heros.gender ?? "")
   hero.append(self.heros.culture ?? "")
    hero.append(self.heros.name ?? "")
    hero.append(self.heros.born ?? "")
   
    print(hero)
    }
}
