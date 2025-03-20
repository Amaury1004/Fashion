import UIKit

class BlogController: UIViewController {
    let tableView = UITableView()
    
    var selectedBlog: BlogCellViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.allowsSelection = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.register(BlogCell.self, forCellReuseIdentifier: "BlogCell")
        tableView.register(SocialIconCell.self, forCellReuseIdentifier: "SocialIconCell")
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension BlogController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            guard let selectedBlog = selectedBlog else { return UITableViewCell() }
            let blogCell = tableView.dequeueReusableCell(withIdentifier: "BlogCell", for: indexPath) as! BlogCell
            blogCell.configure(model: selectedBlog)
            return blogCell
        } else {
            let viewModel = BlogCellViewSocial.setupSocial()
            let socialCell = tableView.dequeueReusableCell(withIdentifier: "SocialIconCell", for: indexPath) as! SocialIconCell
            socialCell.configure(models: viewModel, viewController: self)
            return socialCell
        }
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.row == 0 ? 1050 : 360
    }
}

extension BlogController: UITableViewDelegate {}
