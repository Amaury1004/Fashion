import UIKit

class ScrollCell: UITableViewCell {
    
    let scroll = UIScrollView()
    let stackView = UIStackView()
    var model: [String] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(scroll)
        scroll.showsHorizontalScrollIndicator = false
        scroll.translatesAutoresizingMaskIntoConstraints = false
        
        setConstraints()
        
        setupStackView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            scroll.topAnchor.constraint(equalTo: contentView.topAnchor),
            scroll.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scroll.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scroll.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    func setupStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        
        scroll.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scroll.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scroll.leadingAnchor, constant: 32),
            stackView.trailingAnchor.constraint(equalTo: scroll.trailingAnchor, constant: -32)
        ])
    }
    
    func configure(model: [String]) {
        self.model = model
        
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        
        for title in model {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        
            let attributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 20, weight: .light),
                            .foregroundColor: UIColor.black]
            
            let attributedTitle = NSAttributedString(string: title, attributes: attributes)
                        
            button.setAttributedTitle(attributedTitle, for: .normal)
            button.layer.cornerRadius = 8
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            
            stackView.addArrangedSubview(button)
        }
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        guard let title = sender.titleLabel?.text else { return }
        print("Button tapped: \(title)")
    }
}
