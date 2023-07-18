//
//  ChannelViewController.swift
//  task3
//
//  Created by Ashvin Alva on 14/07/23.
//

import UIKit
import Alamofire

class ChannelViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var table: TableViewCell = TableViewCell()
    
    var viewModel = NetworkingClient()
    var data: DataModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        viewModel.execute { [weak self] in
            self?.data = self?.viewModel.dataModel
            
            //print("Meow: \(self?.data)")
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(tableView)
        self.tableView.rowHeight = 150;
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
}

extension ChannelViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You clicked at \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

extension ChannelViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.data?.data?.channels!.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.responseData = self.data?.data?.channels?[indexPath.section].airings
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width , height: view.frame.size.height))
        
        header.backgroundColor = UIColor(red: 190.0/255.0, green: 49.0/255.0, blue: 39.0/255.0, alpha: 1)
        
        let imageView = UIImageView()
        
        if let url = URL(string: (self.data?.data?.channels![section].logo)!!) {
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data, error == nil else { return }
                
                DispatchQueue.main.async {
                    imageView.image = UIImage(data: data)
                }
            }
            
            task.resume()
        }
        
        imageView.tintColor = .black
        header.addSubview(imageView)
        
        imageView.frame = CGRect(x: 50, y: 10, width: header.frame.size.height/14 - 25, height: header.frame.size.height/15 - 25)

        let label = UILabel(frame: CGRect(x: 60 + imageView.frame.size.width, y: 1, width: header.frame.size.width - 30 - imageView.frame.size.width , height: imageView.frame.size.height + 20))
        
        //let label = UILabel(frame: CGRect(x: header.frame.size.width/2, y: 1, width: header.frame.size.width - 30 - imageView.frame.size.width , height: imageView.frame.size.height + 20))

        
        header.addSubview(label)
        //label.backgroundColor = .blue
        label.text = self.data?.data?.channels?[section].title
        label.font = .systemFont(ofSize: 20,weight: .bold)
        label.textColor = .white
        label.tintColor = .white
        
        
        return header
        
    }
    
}
