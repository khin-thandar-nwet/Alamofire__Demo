//
//  TableView.swift
//  Alamofire
//
//  Created by MSIS SWH on 22/01/2023.
//

import UIKit

class TableView: UITableViewCell{

    @IBOutlet weak var trackName: UILabel!
        @IBOutlet weak var artistImgView: UIImageView!
          
        @IBOutlet weak var artisName: UILabel!
        @IBOutlet weak var artistCountry: UILabel!
        override func awakeFromNib() {
            super.awakeFromNib()
            // Initialization code
        }
      
      
        override func setSelected(_ selected: Bool, animated: Bool) {
            super.setSelected(selected, animated: animated)
      
      
            // Configure the view for the selected state
        }  

}
