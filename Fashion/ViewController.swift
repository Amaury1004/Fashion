import UIKit

class ViewController: UIViewController {
    
    let tableView: UITableView = .init(frame: .zero, style: .plain)
   
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTopPanel()
        
        view.backgroundColor = .black
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LabelCell.self, forCellReuseIdentifier: "LabelCell")
        tableView.register(ScrollCell.self, forCellReuseIdentifier: "ScrollCell")
        tableView.register(BlogCell.self, forCellReuseIdentifier: "BlogCell")
        tableView.register(ButtonCell.self, forCellReuseIdentifier: "ButtonCell")
        tableView.register(SocialIconCell.self, forCellReuseIdentifier: "SocialIconCell")
        tableView.allowsSelection = false
        tableView.separatorStyle = .none


           
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc func menu() {
        print("DA")
    }
    
    func setupTopPanel() {
        let leftButton = UIBarButtonItem(image: UIImage(systemName: "xmark"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(menu))
        navigationItem.leftBarButtonItem = leftButton
        
        let rightButton = UIBarButtonItem(image: UIImage(systemName: "magnifyingglass"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(menu))
        
        let rightButton2 = UIBarButtonItem(image: UIImage(systemName: "cart.fill"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(menu))
        navigationItem.rightBarButtonItems = [rightButton2, rightButton]
        
        [leftButton, rightButton, rightButton2].forEach { button in
            button.tintColor = .lightGray
        }
        
        let mainLabel = UIImageView()
        mainLabel.image = UIImage(named: "Logo")
        
        
        self.navigationItem.titleView = mainLabel
        
        
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            tableView.allowsSelection = true
            return  BlogCellViewModel.mockData().count
            
        }
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if  indexPath.section == 0 {
            return 50
        }
        else if indexPath.section == 1 {
            return 64
        }
        else if indexPath.section == 2 {
            return 181
        }
        else if indexPath.section == 3 {
            return 54
        }
        else if indexPath.section == 4 {
            return 340
        }
        return 50
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let viewModel = BlogCellViewTitle.setupTitle()
            let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! LabelCell
            cell.configure(with: viewModel)
            return cell
        case 1:
            let viewModel = BlogCellViewScroll.setupScroll()
            let cell = tableView.dequeueReusableCell(withIdentifier: "ScrollCell", for: indexPath) as! ScrollCell
            cell.configure(model: viewModel)
            return cell
        case 2:
            let viewModel = BlogCellViewModel.mockData()
            let blogItem = viewModel[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "BlogCell", for: indexPath) as! BlogCell
            cell.configure(model: blogItem)
            return cell
        case 3:
            let viewModel = BlogCellViewLoad.setupTLoad()
            let cell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as! ButtonCell
            cell.configure(model: viewModel)
            return cell
        case 4 :
            let viewModel = BlogCellViewSocial.setupSocial()
            let cell = tableView.dequeueReusableCell(withIdentifier: "SocialIconCell", for: indexPath) as! SocialIconCell
            cell.configure(models: viewModel, viewController: self)
            return cell
            
        default:
            return UITableViewCell()
        }
    }
        
}
