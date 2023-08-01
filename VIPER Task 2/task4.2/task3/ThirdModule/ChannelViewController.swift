//
//  ChannelViewController.swift
//  task3
//
//  Created by Ashvin Alva on 14/07/23.
//

import UIKit

class ChannelViewController: UIViewController, PresenterToViewThirdModule {
    
    var presenter: ViewToPresenterThirdModule?
    
    @IBOutlet weak var tableView: UITableView!
    let imageReterival: ImageRetrival = ImageRetrival()
    
//    var viewModel = ApiViewModel()
      var data: DataModel?
//
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
//        viewModel.getData { [weak self] in
//            self?.data = self?.viewModel.dataModel
//
//            print("Meow: \(self?.data)")
//            DispatchQueue.main.async {
//                self?.tableView.reloadData()
//            }
//        }
        
        presenter?.getAPIData(completion: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
        
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ChannelViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You clicked at \(indexPath.row)")
    }
}

extension ChannelViewController: UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return Storage.data?.data?.channels?.count ?? 0
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        return Storage.data?.data?.channels?[section].title
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        cell.responseData = Storage.data?.data?.channels?[indexPath.section].airings
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width , height: view.frame.size.height))
           
           header.backgroundColor = UIColor(red: 190.0/255.0, green: 49.0/255.0, blue: 39.0/255.0, alpha: 1)
           
           let imageView = UIImageView()
           
            imageReterival.image(url: (Storage.data?.data?.channels![section].logo)!, completion: {imageData in
//                print("Channel func called")
                if imageData != nil{
                    DispatchQueue.main.async {
                        print(Storage.data?.data?.channels![section].title)
                        imageView.image = UIImage(data: imageData!)
                    }
                }
            })
           
           imageView.tintColor = .black
           header.addSubview(imageView)
           
           imageView.frame = CGRect(x: 30, y: 10, width: 50, height: 50)

           let label = UILabel(frame: CGRect(x: 60 + imageView.frame.size.width, y: 1, width: header.frame.size.width - 30 - imageView.frame.size.width , height: imageView.frame.size.height + 20))
           

           //label.backgroundColor = .blue
           label.text = Storage.data?.data?.channels?[section].title
           label.font = .systemFont(ofSize: 20,weight: .bold)
           label.textColor = .white
           label.tintColor = .white
           
           header.addSubview(label)
        
           return header
           
       }
}
