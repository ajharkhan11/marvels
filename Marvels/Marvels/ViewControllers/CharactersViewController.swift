//
//  CharactersViewController.swift
//  Marvels
//
//  Created by Ajharudeen Khan on 19/02/22.
//

import UIKit

class CharactersViewController: UIViewController {
    
    @IBOutlet private weak var charactersTableView: UITableView!
    
    private var charactersViewModel : CharactersViewModel!
    
    private let characterTableViewCellIdentifier = "CharacterTableViewCell"
    
    private var dataSource : CharactersDataSourceModel<CharacterTableViewCell , CharacterDataModel>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate() {
        startActivityIndicator()
        self.charactersViewModel = CharactersViewModel()
        self.charactersViewModel.bindCharactersViewModelToController = {
            self.updateDataSource()
        }
    }
    
    // MARK: - Data Source
    
    func updateDataSource()  {
        guard let characters = self.charactersViewModel.characters else { return }
        self.dataSource = CharactersDataSourceModel.init(cellIdentifier: characterTableViewCellIdentifier, items:characters, configureCell: { (cell, character) in
            cell.refreshWithCharacter(character)
        })
        
        DispatchQueue.main.async {
            self.charactersTableView.dataSource = self.dataSource
            self.charactersTableView.delegate = self.dataSource
            self.charactersTableView.reloadData()
            self.stopActivityIndicator()
        }
        self.dataSource.handleCick = { (item) in
            self.performSegue(withIdentifier: "detail_screen", sender: item)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if let character = sender {
            let detailController = segue.destination as? CharacterDetailViewController
            detailController?.characterID = (character as? CharacterDataModel)?.id
        }
    }
}
