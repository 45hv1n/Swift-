//
//  DetailViewController.swift
//  task2
//
//  Created by Ashvin Alva on 21/07/23.
//

import UIKit

class DetailViewController: UIViewController, ViewProtocolDetailModule {
    
    var router: RouterProtocolDetailModule?
    var interactor: InteractorProtocolDetailModule?
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var aggSegment: UISegmentedControl!
    @IBOutlet weak var depSegment: UISegmentedControl!
    
    @IBOutlet weak var detailTableView: UITableView!
    
    let stored = Storage()
    var arr: [Storage.StudentDetails] = []
    
    var isSearching: Bool = false
    var searchArr: [Storage.StudentDetails] = []
    
    var isFiltering: Bool = false
    public var aggFilter: Set<Storage.StudentDetails> = Set()
    var depFilter: Set<Storage.StudentDetails> = Set()
    var filterSet: Set<Storage.StudentDetails> = Set()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        print("Initialized")
        setup()
    }

    func setup(){
        let view = self
        let interactor = DetailInteractor()
        let presenter = DetailPresenter()
        let router = DetailRouter()
        
        view.interactor = interactor
        interactor.presenter = presenter
        presenter.view = view
        
        view.router = router
    }
    
   override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Detail View did appear")
        arr = stored.viewStudentDetails()
       
       aggSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
       aggSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemIndigo], for: UIControl.State.normal)
       aggSegment.selectedSegmentIndex = 0

       depSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: UIControl.State.selected)
       depSegment.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.systemIndigo], for: UIControl.State.normal)
       aggSegment.selectedSegmentIndex = 0

       detailTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.detailTableView.delegate = self
        self.detailTableView.dataSource = self
    }
    
    @IBAction func aggregateSegment(_ sender: Any) {
        print("Segement aggregate")
        
        if(depSegment.selectedSegmentIndex == 0 && aggSegment.selectedSegmentIndex == 0){
            isFiltering = false
            aggFilter.removeAll()
            depFilter.removeAll()
            filterSet.removeAll()
            
        }
        else{
            print("Segement inside")
            isFiltering = true
            aggFilter.removeAll()
            
            interactor?.filterAggregate(selectedindex: aggSegment.selectedSegmentIndex)
        }
        
        detailTableView.reloadData()

    }
    
    @IBAction func departmentSegment(_ sender: Any) {
        
        if(depSegment.selectedSegmentIndex == 0 && aggSegment.selectedSegmentIndex == 0){
            isFiltering = false
            aggFilter.removeAll()
            depFilter.removeAll()
            filterSet.removeAll()
        }
        else{
            isFiltering = true
            depFilter.removeAll()
            interactor?.filterDepartment(selectedindex: depSegment.selectedSegmentIndex)
        }
        
        detailTableView.reloadData()
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching{
            return searchArr.count
        }
        if isFiltering{
            
            if aggSegment.selectedSegmentIndex == 0{
                filterSet = depFilter
            }
            else if depSegment.selectedSegmentIndex == 0{
                filterSet = aggFilter
            }
            else{
                filterSet = aggFilter.intersection(depFilter)
            }

            print("Filtering Set: \(filterSet)")
            return filterSet.count
        }
        
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected index is : \(indexPath)")
        
        Storage.isUpdating = true
        Storage.updateID = arr[indexPath.row].id
        
        router?.switchTabs(tabbarController: tabBarController!)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isSearching{
            return assignValues(arr: searchArr, indexPath: indexPath)
        }
        else if isFiltering{
            return assignValues(arr: Array(filterSet), indexPath: indexPath)
        }
         return assignValues(arr: arr, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableView.beginUpdates()
            
            arr = (interactor?.removeStudentDetail(id: arr[indexPath.row].id))!
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()
        }
    }
    
    func assignValues(arr: [Storage.StudentDetails], indexPath: IndexPath) -> UITableViewCell{
        let cell = detailTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        cell.nameLabel.text = "Name: " + arr[indexPath.row].name
        cell.idLabel.text = "ID: " + String(arr[indexPath.row].id)
        cell.departmentLabel.text = "Department: " + arr[indexPath.row].department
        cell.phoneLabel.text = "Contact Number: " + String(arr[indexPath.row].contact)
        cell.aggregateLabel.text = "Aggregate: " + String(arr[indexPath.row].aggregate)
        cell.emailLabel.text = "Email: " + arr[indexPath.row].email
        
        return cell
    }
}

extension  DetailViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText != ""){
            
            isSearching = true
            searchArr.removeAll()
            
            for element in arr{
                if((element.name.lowercased()).contains(searchText.lowercased())){
                    searchArr.append(element)
                }
            }
            self.detailTableView.reloadData()
        }
        else{
            isSearching = false
            searchArr.removeAll()
            self.detailTableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchArr.removeAll()
        isSearching = false
        self.detailTableView.reloadData()
    }
}
