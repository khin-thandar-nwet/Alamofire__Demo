//
//  ViewController.swift
//  Alamofire
//
//  Created by MSIS SWH on 22/01/2023.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
          
        var artist = [[String:Any]]()
          
          
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            loadJsonData()
            tableView.delegate = self
            tableView.dataSource = self
            //tableView.rowHeight = UITableView.automaticDimension
        }
        func loadJsonData()
        {
           Alamofire.request("https://itunes.apple.com/search?media=music&term=bollywood").responseJSON { (response) in
                print("Response value \(response)")
              
                print("Response.result.value \(response.result.value!)")
              
            if let json = response.result.value as! [String:Any]?{
                if let responseValue = json["results"] as! [[String:Any]]?{
                    self.artist = responseValue
                    self.tableView.reloadData()
                }
            }
            }
        }
    }
      
      
    extension ViewController : UITableViewDataSource{
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return artist.count
        }
          
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell") as! MainTableViewCell
            if(artist.count > 0){
                do{
                let artistData = artist[indexPath.row]
                cell.artistImgView.image = try UIImage(data: Data(contentsOf: URL(string: artistData["artworkUrl60"] as! String) ?? URL(string: "http://www.google.com")!))
                    cell.trackName.text = artistData["trackName"] as! String
                    cell.artisName.text = artistData["artistName"] as! String
                    cell.artistCountry.text = artistData["country"] as! String
                }catch{
                      
                }
                  
            }
            return cell
              
        }
          
          
    }
    extension ViewController : UITableViewDelegate{
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 220
        }
          
    }  

