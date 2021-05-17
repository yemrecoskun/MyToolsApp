//
//  TheNewsViewController.swift
//  MyToolsApp
//
//  Created by Yunus Emre Coşkun on 13.05.2021.
//

import UIKit

class TheNewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var themeModelType = UserDefaults.standard.integer(forKey: "themeModelType")
    var theNewUrl : String!
    private var theNewsTableViewModel : TheNewsViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        TDViewModel.changeTheme(themeModelType: themeModelType, view: view)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        GetTheNews()
        // Do any additional setup after loading the view.
    }
    func GetTheNews(){
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey=a28e185f36a4487490c5a358e8b979d7")
        //let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/BTK-iOSDataSet/master/dataset.json")
        WebService().GetTheNews(url: url!) {(theNew) in
            if let theNew = theNew{
                self.theNewsTableViewModel = TheNewsViewModel(theNews: theNew)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theNewsTableViewModel == nil ? 0 : self.theNewsTableViewModel.numberOfRowsInSection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! NewsCellTableViewCell
        let theNewsViewModel = self.theNewsTableViewModel.newsAtIndexPath(indexPath.row)
        if themeModelType == 1{
            cell.backgroundColor = .black
        }
        //cell.imageView?.load(urlString: theNewsViewModel.article.urlToImage!)
        cell.titleLabel.text = theNewsViewModel.article.title
        cell.storyLabel.text = theNewsViewModel.article.description
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.theNewUrl = self.theNewsTableViewModel.newsAtIndexPath(indexPath.row).article.url
        performSegue(withIdentifier: "toDetailsView", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsView"{
            let destinationVC = segue.destination as! WebViewController
            destinationVC.url = self.theNewUrl
        }
    }
}
