//
//  ViewController.swift
//  pokeeeeeeman
//
//  Created by mac on 9/21/22.
//

import UIKit
import RyansPokemonPackage

class ViewController: UIViewController {

    @IBOutlet weak var newPokemonButton: UIButton!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonImageView: UIImageView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newPokemonButton.layer.cornerRadius = 31
    }


    @IBOutlet weak var typesStackView: UIStackView!
    
  
    
    @IBOutlet weak var attacks: UIStackView!
    
    @IBAction func newPokemonButtonTapped(_ sender: Any) {
        Task {
            let pokemon = await getRandomPokemon(gen: .all)
//            you can add gen .all for all 905 pokemon, maybe...
            pokemonNameLabel.text = pokemon.name.capitalized
            pokemonImageView.setPokemon(pokemon: pokemon)
            
            for view in typesStackView.arrangedSubviews {
                view.removeFromSuperview()
            }
            for pType in pokemon.types {
                let label = UILabel()
                label.text = pType.capitalized
                label.textColor = .red
                label.textAlignment = .center
                typesStackView.addArrangedSubview(label)
            }
            
            for viewAtak in attacks.arrangedSubviews {
                viewAtak.removeFromSuperview()
            }
            
            for attak in pokemon.abilities{
                let atackLabel = UILabel()
                atackLabel.text = attak.capitalized
                atackLabel.textColor = .red
                atackLabel.textAlignment = .center
                attacks.addArrangedSubview(atackLabel)
            }
        
        }
        
                
    }
    
    
    
    
    
    
    
    
    
    
    
    
}

