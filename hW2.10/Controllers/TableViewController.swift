//
//  TableViewController.swift
//  hW2.10
//
//  Created by Алексей Трофимов on 01.12.2021.
//

import UIKit
import Alamofire

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
         metod()
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
             
                    self.metod()
             
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
    func postRequest(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        let userData = ["Name": "Aleksy", "Family": "Trofimov"]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userData, options: []) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { (data, response, _) in
            guard let response = response, let data = data else {return}
            print(response)
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch let error {
                print(error)
            }
        }.resume()
    }
}
