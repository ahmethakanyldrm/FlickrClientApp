//
//  RecentPhotosTableViewController.swift
//  FlickerClientApp
//
//  Created by AHMET HAKAN YILDIRIM on 25.10.2022.
//

import UIKit

class RecentPhotosTableViewController: UITableViewController, UISearchResultsUpdating {
   
    

    // MARK: - UI ELEMENTS
    
    // MARK: - PROPERTİES
    
    private var response: PhotosResponse? {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    private var selectedPhoto : Photo?
    
    // MARK: - LİFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        fetchRecentPhotos()
    }
    
    // MARK: - FUNCTİONS
    private func fetchRecentPhotos() {
        guard let url = URL(string: "API KEY") else {return}
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data,response,error) in
            if let error = error {
                debugPrint(error)
                return
            }
            if let data = data,let response = try? JSONDecoder().decode(PhotosResponse.self,from: data) {
                self.response = response
            }
        }.resume()
    }
    
    private func searchPhotos(with text: String) {
        guard let url = URL(string: "API KEY") else {return}
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data,response,error) in
            if let error = error {
                debugPrint(error)
                return
            }
            if let data = data,let response = try? JSONDecoder().decode(PhotosResponse.self,from: data) {
                self.response = response
            }
        }.resume()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response?.photos?.photo?.count ?? .zero
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let photo = response?.photos?.photo?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! PhotoTableViewCell
        cell.ownerImageView.backgroundColor = .darkGray
        cell.ownerNameLabel.text = photo?.ownername
        
        NetworkManager.shared.fetchImage(with: photo?.buddyIconUrl) { data in
            cell.ownerImageView.image = UIImage(data: data)
        }
        
        NetworkManager.shared.fetchImage(with: photo?.urlN) { data in
            cell.photoImageView.image = UIImage(data: data)
        }
        
        cell.titleLabel.text = photo?.title
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       // navigationController?.pushViewController(PhotoDetailViewController(), animated: true)
        selectedPhoto = response?.photos?.photo?[indexPath.row]
        performSegue(withIdentifier: "toPhotoDetail", sender: nil)
        
    }
    // MARK: - UISEARCH RESULT UPDATİNG
    
    private func setupSearchController () {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here to search"
        navigationItem.searchController = search
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        if text.count > 2 {
            searchPhotos(with: text)
        }
    }
    // MARK: - ACTİONS
    
    
    // MARK: - NAVİGATİON
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? PhotoDetailViewController {
            // TODO: Seçilen fotoğrafı detay ekranına gönder
            viewController.photo = selectedPhoto
        }
    }

}

