

import UIKit

class ViewController: UIViewController {
    
    let tableView: UITableView = .init(frame: .zero, style:  .plain)
    let content = BlogCellViewModel.mockData()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(FashionCell.self, forCellReuseIdentifier: "FashionCell")
       
        
        let menuButtons = UIBarButtonItem(
            image: UIImage(systemName: "xmark"),
            style: .plain,
            target: self,
            action: #selector(menuButton))
        navigationItem.leftBarButtonItem = menuButtons
        
        
        self.navigationItem.title = "Open \n Fashion"
        
        
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        
        
        setupConstraints()
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return content.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FashionCell", for: indexPath) as? FashionCell else {
            fatalError("Cell not found")
        }
        let blogItem = content[indexPath.row]
        
        cell.configure(blogRow: blogItem)
        
        return cell
    }
    
}

extension ViewController {
    func setupConstraints() {
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
}

extension ViewController {
    @objc func menuButton() {
        
    }
}

