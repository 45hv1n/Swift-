//
//  SecondViewController.swift
//  task2.0
//
//  Created by Ashvin Alva on 05/07/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    var store = Storage()
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    
    var completionInstance: ((Bool , Storage.StudentDetails , Int) -> Void)?

    var arr: [Storage.StudentDetails] = []
    
    var departmentFilter: [String] = ["CSE","ISE","ME","EC","EEE"]
    var aggregateFilter: [String] = ["<60","60-80",">80"]
    
    var departmentPicker = UIPickerView()
    var aggregatePicker = UIPickerView()
    
    var isSearching = false
    var searchArr : [Storage.StudentDetails] = []
    
    var isFiltering = false
    var filteredArr: [Storage.StudentDetails] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let nib = UINib(nibName: "TableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "TableViewCell")
        
        table.delegate = self
        table.dataSource = self
        
       
        
        print("Load: \(store.viewStudentDetails())")
    }
    
    //Setup the second controller [Disabled the second controller].
    func setup(){
        arr = store.viewStudentDetails()
        print("Array size: \(arr)")
    }
    
    
    @IBAction func aggregateFilterBtn(_ sender: UIButton) {
        
        let all = UIAction(title: "All"){ _ in
            print("Clicked on All")
            
            self.isFiltering = false
            self.filteredArr.removeAll()
            self.table.reloadData()
        }
        
        let markLessSixty = UIAction(title:"<60"){ _ in
            print("aggregate < 60 clicked")
            
            self.isFiltering = true
            self.filteredArr.removeAll()
            
            for x in self.arr{
                if x.aggregate < 60{
                    self.filteredArr.append(x)
                }
            }
            
            print("Before : \(self.filteredArr)")
            self.table.reloadData()
            
        }
        
        let sixtyToEighty = UIAction(title: "60-80"){ _ in
            print("aggregate 60 - 80 clicked")
            
            self.isFiltering = true
            self.filteredArr.removeAll()
            
            for x in self.arr{
                if x.aggregate >= 60 && x.aggregate <= 80{
                    self.filteredArr.append(x)
                }
            }
            
            print("Before : \(self.filteredArr)")
            self.table.reloadData()
            
            
        }
        
        let greaterThanEighty = UIAction(title: "> 80"){ _ in
            print("aggregate > 80 clicked")
            
            self.isFiltering = true
            self.filteredArr.removeAll()
            
            for x in self.arr{
                if x.aggregate > 80 {
                    self.filteredArr.append(x)
                }
            }
            
            print("Before : \(self.filteredArr)")
            self.table.reloadData()
        }
        
        let menu = UIMenu(title:"Meow", children: [all,markLessSixty,sixtyToEighty,greaterThanEighty])
        sender.showsMenuAsPrimaryAction = true
        sender.menu = menu
        
        
    }
    
    
    
    @IBAction func departmentFilterBtn(_ sender: UIButton) {
        let all = UIAction(title: "All"){ _ in
            print("Clicked on All")
            
            self.isFiltering = false
            self.filteredArr.removeAll()
            self.table.reloadData()
        }
        
        let me = UIAction(title:"ME"){ _ in
            print("Filter ME")
            
            self.isFiltering = true
            self.filteredArr.removeAll()
            
            for x in self.arr{
                if x.department.lowercased() == "me"{
                    self.filteredArr.append(x)
                }
            }
            
            print("Before : \(self.filteredArr)")
            self.table.reloadData()
        }
        
        let cse = UIAction(title:"CSE"){ _ in
            print("Filter CSE")
            
            self.isFiltering = true
            self.filteredArr.removeAll()
            
            for x in self.arr{
                if x.department.lowercased() == "cse"{
                    self.filteredArr.append(x)
                }
            }
            
            print("Before : \(self.filteredArr)")
            self.table.reloadData()
            
        }
        
        let ise = UIAction(title:"ISE"){ _ in
            print("Filter ISE")
            
            self.isFiltering = true
            self.filteredArr.removeAll()
            
            for x in self.arr{
                if x.department.lowercased() == "ise"{
                    self.filteredArr.append(x)
                }
            }
            
            print("Before : \(self.filteredArr)")
            self.table.reloadData()
            
        }
        
        let menu = UIMenu(title:"Meow", children: [all,me,cse,ise])
        sender.showsMenuAsPrimaryAction = true
        sender.menu = menu
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

extension SecondViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Edit Functionality
        print("You tapped me Index : \(indexPath.row)")
        
        let firstScreenController = storyboard?.instantiateViewController(withIdentifier: "firstScreenController") as! ViewController
        
        completionInstance?(true, arr[indexPath.row] ,arr[indexPath.row].id)
        
        //self.navigationController?.popViewController(animated: true)
        
        self.dismiss(animated: true)
        
        self.present(firstScreenController, animated: true)
        
    }
}

extension SecondViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering{
            return filteredArr.count
        }
        if isSearching{
            return searchArr.count
        }
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        if isFiltering{
            cell.nameLabel.text = "Name: \(filteredArr[indexPath.row].name)"
            cell.idLabel.text = "ID:\(String(filteredArr[indexPath.row].id))"
            cell.departmentLabel.text = "Department: \(filteredArr[indexPath.row].department)"
            cell.phoneLabel.text = "Phone: \(String(filteredArr[indexPath.row].contact))"
            cell.aggregrateLabel.text = "Aggregate: \(String(filteredArr[indexPath.row].aggregate))"
            cell.emailLabel.text = "Email: \(filteredArr[indexPath.row].email)"
            print("\n\n--------------------Update the table-------------------------\n\n")
            print("Aggregate: \(filteredArr[indexPath.row].aggregate)")
            print("Data: \(self.filteredArr)")
            print("-----------------------------------------------------------------")
            
        }
        
        else if !isSearching{
            cell.nameLabel.text = "Name: \(self.arr[indexPath.row].name)"
            cell.idLabel.text = "ID:\(String(self.arr[indexPath.row].id))"
            cell.departmentLabel.text = "Department: \(self.arr[indexPath.row].department)"
            cell.phoneLabel.text = "Phone: \(String(self.arr[indexPath.row].contact))"
            cell.aggregrateLabel.text = "Aggregate: \(String(self.arr[indexPath.row].aggregate))"
            cell.emailLabel.text = "Email: \(self.arr[indexPath.row].email)"
            

        }
        else{
            cell.nameLabel.text = "Name: \(self.searchArr[indexPath.row].name)"
            cell.idLabel.text = "ID:\(String(self.searchArr[indexPath.row].id))"
            cell.departmentLabel.text = "Department: \(self.searchArr[indexPath.row].department)"
            cell.phoneLabel.text = "Phone: \(String(self.searchArr[indexPath.row].contact))"
            cell.aggregrateLabel.text = "Aggregate: \(String(self.searchArr[indexPath.row].aggregate))"
            cell.emailLabel.text = "Email: \(self.searchArr[indexPath.row].email)"
        }
//        cell.deleteBtn.tag  = indexPath.row
//        cell.deleteBtn.addTarget(self, action: #selector(deleteElement), for: .touchUpInside)
        
//        cell.editBtn.tag = indexPath.row
//        cell.editBtn.addTarget(self, action: #selector(editStudentElement), for: .touchUpInside)
//

//        cell.layer.cornerRadius = 20
//        cell.backgroundColor = .secondarySystemFill
//        cell.tintColor = .white
        
        cell.img.image = UIImage(named: "bachelor")
        cell.layer.cornerRadius = 30

        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            arr = store.removeStudentDetail(id: arr[indexPath.row].id)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
            tableView.endUpdates()
        }
    }
    
//    @objc func deleteElement(sender:UIButton){
//        print("clicked Delete")
//        let indexpath1 = IndexPath(row: sender.tag, section: 0)
//        print(store.removeStudentDetail(id: arr[indexpath1.row].id))
//
//        arr = store.removeStudentDetail(id: arr[indexpath1.row].id)
//        self.table.reloadData()
//    }
    
//    @objc func editStudentElement(sender : UIButton){
//        
//        print("Edit Button Clicked")
//        let indexpath2 = IndexPath(row: sender.tag, section: 0)
//        print("indexpath2 : \(indexpath2)")
//    }
}

extension SecondViewController: UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText != ""{
            print("Searching...")
            
            self.isSearching = true
            searchArr.removeAll()
            
            for x in arr{
                if x.name.lowercased().contains(searchText.lowercased()) || String(x.contact).contains(searchText) {
                    searchArr.append(x)
                }
            }
        }
        else{
            self.isSearching = false
        }
        
        table.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchBar.text = ""
        self.isSearching = false
        searchArr.removeAll()
        table.reloadData()
    }
}
