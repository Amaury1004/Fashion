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
        tableView.register(BlogsCell.self, forCellReuseIdentifier: "BlogsCell")
        tableView.register(ButtonCell.self, forCellReuseIdentifier: "ButtonCell")
        tableView.register(SocialIconCell.self, forCellReuseIdentifier: "SocialIconCell")
        tableView.allowsSelection = true
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
        guard indexPath.section == 2 else { return }
        
        let blogVC = BlogController()
        navigationController?.pushViewController(blogVC, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        Section.allCases.count
        // Хз откуда взять нормальное значение секций...
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return  BlogCellViewModel.mockData().count
            
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HeightForRow(rawValue: indexPath.section)?.height ?? HeightForRow.defaultHeight
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        switch indexPath.section {
        case 0:
            let viewModel = BlogCellViewTitle.setupTitle()
            let labelCell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath) as! LabelCell
            labelCell.configure(with: viewModel)
            cell = labelCell
        case 1:
            let viewModel = BlogCellViewScroll.setupScroll()
            let scrollCell = tableView.dequeueReusableCell(withIdentifier: "ScrollCell", for: indexPath) as! ScrollCell
            scrollCell.configure(model: viewModel)
            cell = scrollCell
        case 2:
            let viewModel = BlogCellViewModel.mockData()
            let blogItem = viewModel[indexPath.row]
            let blogCell = tableView.dequeueReusableCell(withIdentifier: "BlogsCell", for: indexPath) as! BlogsCell
            blogCell.configure(model: blogItem)
            cell = blogCell
        case 3:
            let viewModel = BlogCellViewLoad.setupTLoad()
            let buttonCell = tableView.dequeueReusableCell(withIdentifier: "ButtonCell", for: indexPath) as! ButtonCell
            buttonCell.configure(model: viewModel)
            cell = buttonCell
        case 4:
            let viewModel = BlogCellViewSocial.setupSocial()
            let socialCell = tableView.dequeueReusableCell(withIdentifier: "SocialIconCell", for: indexPath) as! SocialIconCell
            socialCell.configure(models: viewModel, viewController: self)
            cell = socialCell
        default:
            cell = UITableViewCell()
        }
        
        cell.selectionStyle = (indexPath.section == 2) ? .default : .none
        return cell
    }
        
}
