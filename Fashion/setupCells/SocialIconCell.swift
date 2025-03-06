import UIKit
import SafariServices

struct Social {
    static let instagram = "https://www.instagram.com/uwu_maksimka_/"
    static let youtube = "https://www.youtube.com/@%D0%90%D0%BC%D0%B0%D1%83%D1%80%D0%B8-%D0%BA1%D0%B2"
    static let x = "https://x.com/MakotkinMaxim"
}

class SocialIconCell: UITableViewCell {
    var model: BlogCellViewSocial?
    let stackView = UIStackView()
    let stackView2 = UIStackView()
    let separator = CustomSeparator()
    let separator2 = CustomSeparator()
    let label = UILabel()
    
    var viewController: UIViewController?  // Ссылка на родительский контроллер
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        stackView2.arrangedSubviews.forEach { $0.removeFromSuperview() }
    }
    
    func setupUI() {
        label.text = "support@openui.design\n+60 825 876\n08:00 - 22:00 - Everyday"
        label.textAlignment = .center
        label.numberOfLines = 3
        
        label.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        separator.translatesAutoresizingMaskIntoConstraints = false
        separator2.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.axis = .horizontal
        stackView.spacing = 45
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        stackView2.axis = .horizontal
        stackView2.spacing = 20
        stackView2.alignment = .center
        stackView2.distribution = .fillEqually
        
        contentView.addSubview(label)
        contentView.addSubview(separator)
        contentView.addSubview(stackView)
        contentView.addSubview(separator2)
        contentView.addSubview(stackView2)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 33),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            separator.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 36),
            separator.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 120),
            separator.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -120),
            separator.heightAnchor.constraint(equalToConstant: 1),
            
            label.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 36),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -25),
            
            separator2.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 36),
            separator2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 120),
            separator2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -120),
            separator2.heightAnchor.constraint(equalToConstant: 1),
            
            stackView2.topAnchor.constraint(equalTo: separator2.bottomAnchor, constant: 32),
            stackView2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            stackView2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40)
        ])
    }
    
    func configure(models: [BlogCellViewSocial], viewController: UIViewController) {
        self.viewController = viewController
        
        for (index, model) in models.enumerated() {
            let iconButton = UIButton(type: .system)
            iconButton.contentMode = .scaleAspectFit
            iconButton.setImage(UIImage(systemName: model.icon!), for: .normal)
            iconButton.tintColor = .black
            iconButton.tag = index
            
            iconButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
            iconButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
            iconButton.addTarget(self, action: #selector(iconButtonTapped(_:)), for: .touchUpInside)
            
            stackView.addArrangedSubview(iconButton)
        }
        
        for index in 0..<3 {
            let button = UIButton(type: .system)
            button.tintColor = .black
            
            switch index {
            case 0:
                button.setTitle("About", for: .normal)
            case 1:
                button.setTitle("Contact", for: .normal)
            case 2:
                button.setTitle("Blog", for: .normal)
            default:
                break
            }
            
            stackView2.addArrangedSubview(button)
            button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        }
    }
    
    @objc func iconButtonTapped(_ sender: UIButton) {
        let index = sender.tag
        let model = BlogCellViewSocial.setupSocial()[index]

        switch model.icon {
        case "camera":
            openSocial(social: Social.instagram)
        case "play.rectangle":
            openSocial(social: Social.youtube)
        case "xmark":
            openSocial(social: Social.x)
        default:
            print("ℹ️ Нажата кнопка: \(model.icon ?? "неизвестная")")
        }
    }
    
    func openSocial(social: String) {
        if let instagram = URL(string: social) {
            let safariViewController = SFSafariViewController(url: instagram)
            viewController?.present(safariViewController, animated: true, completion: nil)
        }
    }
}
