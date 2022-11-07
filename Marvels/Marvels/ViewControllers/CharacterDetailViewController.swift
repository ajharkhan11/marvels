//
//  CharacterDetailViewController.swift
//  Marvels
//
//  Created by Ajharudeen Khan on 19/02/22.
//

import UIKit

class CharacterDetailViewController: UIViewController {
    
    @IBOutlet private weak var characterImageView: UIImageView!
    
    @IBOutlet private weak var characterNameLabel: UILabel!
    
    @IBOutlet private weak var characterDescriptionLabel: UILabel!
    
    @IBOutlet private weak var characterSeriesTableView: UITableView!
    
    var characterID : Int? = nil
    
    private var characterDetailViewModel : CharacterDetailViewModel!
    
    private var dataSource : CharactersDataSourceModel<CharacterSeriesNameTableViewCell , CharacterSeriesItem>!
    
    private let seriesNameCellIdentifier = "SeriesNameCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate() {
        guard let identifier = characterID else {return}
        startActivityIndicator()
        self.characterDetailViewModel = CharacterDetailViewModel(identifier: "\(identifier)")
        self.characterDetailViewModel.bindCharactersDetailViewModelToController = {
            self.updateDataSource()
        }
    }
    
    // MARK: - Data Source
    
    func updateDataSource()  {
        guard let characterSeries = self.characterDetailViewModel.characterDetail?.series?.items else { return }
        self.dataSource = CharactersDataSourceModel.init(cellIdentifier: seriesNameCellIdentifier, items:characterSeries, configureCell: { (cell, character) in
            cell.refreshSeriesName(character.name ?? "")
        })
        
        DispatchQueue.main.async {
            self.characterSeriesTableView.dataSource = self.dataSource
            self.characterSeriesTableView.delegate = self.dataSource
            self.characterSeriesTableView.reloadData()
            self.stopActivityIndicator()
            self.refreshCharacterDetails()
        }
        self.dataSource.handleCick = { (item) in
            //handle click
        }
    }
    
    func refreshCharacterDetails() {

        characterImageView.loadImageUsingCache(withUrl: characterDetailViewModel.characterImageURLString)
        characterNameLabel.text = characterDetailViewModel.characterDetail?.name
        characterDescriptionLabel.text = characterDetailViewModel.characterDetail?.description

        characterSeriesTableView.reloadData()
    }
}
