import UIKit

class TabBarView: UIView {

    init() {
        super.init(frame: .zero)
        configureSubviews()
        addSubviews()
        setupLayout()
        backgroundColor = .white
    }

    required init?(coder aDecoder: NSCoder) { return nil }

    override func layoutSubviews() {
        super.layoutSubviews()
        bringSubviewToFront(bottomView)
    }

    let containerView = UIView(frame: .zero)
    let bottomView = SubviewFactory.bottomView()
    var bottomBarConstraint: NSLayoutConstraint?

    // MARK: - Privates

    private func configureSubviews() {
        let shadow = SketchShadow(color: .gray, x: 0, y: 2, blur: 4, spread: 0)
        bottomView.layer.apply(shadow)
    }

    private func addSubviews() {
        addSubview(containerView)
        addSubview(bottomView)
    }

    private func setupLayout() {
        containerView.pinTop(to: safeAreaLayoutGuide.topAnchor)
        containerView.pinLeading(to: safeAreaLayoutGuide.leadingAnchor)
        containerView.pinTrailing(to: safeAreaLayoutGuide.trailingAnchor)
        containerView.pinBottom(to: bottomView.topAnchor)
        bottomView.pinLeading(to: safeAreaLayoutGuide.leadingAnchor)
        bottomView.pinTrailing(to: safeAreaLayoutGuide.trailingAnchor)
        bottomBarConstraint = bottomView.pinBottom(to: safeAreaLayoutGuide.bottomAnchor)
    }

}

private extension TabBarView {

    struct SubviewFactory {

        static func bottomView() -> UIImageView {
            let imageView = UIImageView(frame: .zero)
            imageView.image = UIImage(named: "tabBar")
            imageView.contentMode = .center
            return imageView
        }

    }

}
