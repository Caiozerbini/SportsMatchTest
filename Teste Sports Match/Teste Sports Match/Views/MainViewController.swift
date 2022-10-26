//
//  MainViewController.swift
//  Teste Sports Match
//
//  Created by Caio Carneiro on 26/10/22.
//

import UIKit
import SDWebImage

class MainViewController: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var posLabel: UILabel!
    @IBOutlet weak var percentualView: UIView!
    @IBOutlet weak var percentualLabel: UILabel!
    @IBOutlet weak var vencidasPlaLabel: UILabel!
    @IBOutlet weak var vencidasPosLabel: UILabel!
    @IBOutlet weak var disputadasPlaLabel: UILabel!
    @IBOutlet weak var disputadasPosLabel: UILabel!
    @IBOutlet weak var copasVencidasProgressBar: BarProgressView!
    @IBOutlet weak var copasDisputadasProgressBar: BarProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        Networking().getData {[weak self] player in
            DispatchQueue.main.async {
                self?.displayData(player: player)
            }
        } failure: { error in
            print(error.localizedDescription)
        }

        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Background Image")!)
        
        
        percentualView.layer.cornerRadius = 50
        percentualView.layer.masksToBounds = true
        userImageView.layer.cornerRadius = 60
        userImageView.layer.masksToBounds = true
        userImageView.layer.borderWidth = 0.5
        userImageView.layer.borderColor = UIColor.white.cgColor
    }

    func displayData(player: Player) {
        userImageView.sd_setImage(with: URL(string: player.imageURL), completed: nil)
        nameLabel.text = player.name
        countryLabel.text = player.country
        posLabel.text = player.position
        percentualLabel.text = String(format: "%.3f", player.percentage)
        vencidasPlaLabel.text = String(format: "%.1f", player.worldCupVictories.pla)
        vencidasPosLabel.text = String(format: "%dº", player.worldCupVictories.pos)
        disputadasPlaLabel.text = String(format: "%.1f", player.worldCupPlayed.pla)
        disputadasPosLabel.text = String(format: "%dº", player.worldCupPlayed.pos)
        
        let victoryProgress = Float(player.worldCupVictories.pla / player.worldCupVictories.max)
        let disputedProgress = Float(player.worldCupPlayed.pla / player.worldCupPlayed.max)
        copasVencidasProgressBar.progress = victoryProgress
        copasDisputadasProgressBar.progress = disputedProgress
    }
}


