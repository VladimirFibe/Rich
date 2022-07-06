//
//  RichView.swift
//  Rich
//
//  Created by Vladimir Fibe on 06.07.2022.
//

import SwiftUI

class RichViewController: UIViewController {
  let label: UILabel = {
    $0.text = "I Am Rich"
    $0.font = UIFont(name: "HelveticaNeue", size: 40)
    $0.textColor = .white
    $0.textAlignment = .center
    return $0 } (UILabel())
  
  let image: UIImageView = {
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
    return $0 } (UIImageView(image: UIImage(named: "diamond")))
  
  lazy var stack: UIStackView = {
    $0.translatesAutoresizingMaskIntoConstraints = false
    $0.axis = .vertical
    $0.spacing = 150
    return $0 } (UIStackView(arrangedSubviews: [label, image]))
  
  override func viewDidLoad() {
    setupViews()
    setupConstraints()
  }
  func setupViews() {
    view.backgroundColor = #colorLiteral(red: 0.1815684736, green: 0.3587224483, blue: 0.4445167184, alpha: 1)
    view.addSubview(stack)
  }
  func setupConstraints() {
    NSLayoutConstraint.activate([
      stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      stack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 1),
    ])
  }
}

struct RichViewControllerRepresentable: UIViewControllerRepresentable {
  func makeUIViewController(context: Context) -> RichViewController {
    RichViewController()
  }
  
  func updateUIViewController(_ uiViewController: RichViewController, context: Context) {
    
  }
  
  typealias UIViewControllerType = RichViewController
  
  
}
struct RichView: View {
  let color = #colorLiteral(red: 0.1815684736, green: 0.3587224483, blue: 0.4445167184, alpha: 1)
  var body: some View {
    ZStack {
      Color(color).ignoresSafeArea()
      VStack(spacing: 150.0) {
        Text("I Am Rich")
          .font(.custom("HelveticaNeue", size: 40))
          .foregroundColor(.white)
        Image("diamond")
          .resizable()
          .scaledToFill()
          .frame(width: 270, height: 270)
      }
    }
  }
}

struct RichView_Previews: PreviewProvider {
  static var previews: some View {
    RichViewControllerRepresentable()
      .ignoresSafeArea()
  }
}
