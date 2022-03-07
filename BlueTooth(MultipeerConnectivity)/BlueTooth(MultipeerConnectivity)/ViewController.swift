//
//  ViewController.swift
//  BlueTooth(MultipeerConnectivity)
//
//  Created by Lei Zhao on 3/6/22.
//

import UIKit
import MultipeerConnectivity

class ViewController: UIViewController {

    private weak var buttonStackView: UIStackView?
    private weak var imageView: UIImageView?
    private var label: UILabel?
    private var allowSwitch: UISwitch?

    private let peerID: MCPeerID = MCPeerID(displayName: UIDevice.current.name)
    private var mcSession: MCSession?
    private var advertiser: MCNearbyServiceAdvertiser?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupImageView()
        setupLabel()
        setupAllowSwitch()
        setupBtnStackView()

        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        mcSession?.delegate = self
    }

    @objc private func selectImage() {
        let picker = UIImagePickerController()
        if !UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum) {
            print("照片不可用")
            return
        }
        picker.sourceType = .savedPhotosAlbum
        picker.delegate = self
        present(picker, animated: true)
    }

    @objc private func toggleDiscoverable(allowSwitch: UISwitch) {
        if !allowSwitch.isOn {
            advertiser?.stopAdvertisingPeer()
            return
        }

        advertiser = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: "lessThan15Chars")
        advertiser?.delegate = self
        advertiser?.startAdvertisingPeer()
    }

    @objc private func searchDeviceToConnect() {
        let mcBrowser = MCBrowserViewController(serviceType: "lessThan15Chars", session: mcSession!)
        mcBrowser.delegate = self
        present(mcBrowser, animated: true)
    }

    @objc private func sendPhoto() {
        guard let mcSession = mcSession, let imageView = imageView, let image = imageView.image else { return }
        if mcSession.connectedPeers.count > 0 {
            if let imageData = image.pngData() {
                do {
                    try mcSession.send(imageData, toPeers: mcSession.connectedPeers, with: .reliable)

                } catch let error as NSError {
                    let ac = UIAlertController(title: "Send error", message: error.localizedDescription, preferredStyle: .alert)
                    ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    present(ac, animated: true)
                }
            }
        }
    }
}

extension ViewController: MCSessionDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .notConnected:
            print("Not Connected: \(peerID.displayName)")
        case .connecting:
            print("Connecting: \(peerID.displayName)")
        case .connected:
            print("Connected: \(peerID.displayName)")
        @unknown default:
            print("Some error occur...")
        }
    }

    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
    }

    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
        print("---session didStartReceivingResourceWithName---")
    }

    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
        print("---session didFinishReceivingResourceWithName---")
    }

    public func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        print("---session didReceive---")
        if let image = UIImage(data: data) {
            OperationQueue.main.addOperation {
                self.imageView?.image = image
            }
        }
    }
}

extension ViewController: MCBrowserViewControllerDelegate {
    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        print("----browserViewControllerDidFinish---")
        dismiss(animated: true)
    }

    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        print("----browserViewControllerWasCancelled---")
        dismiss(animated: true)
    }
}

extension ViewController: MCNearbyServiceAdvertiserDelegate {
    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        let ac = UIAlertController(title: "BlueTooth(MultipeerConnectivity)", message: "'\(peerID.displayName)' wants to connect", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Accept", style: .default, handler: { [weak self] _ in
            invitationHandler(true, self?.mcSession)
        }))
        ac.addAction(UIAlertAction(title: "Decline", style: .cancel, handler: { _ in
            invitationHandler(false, nil)
        }))
        present(ac, animated: true)
    }
}

extension ViewController {
    private func setupImageView() {
        let imageView = UIImageView()
        imageView.backgroundColor = .systemPink
        view.addSubview(imageView)

        self.imageView = imageView

        setupImageViewConstrains()
    }

    private func setupBtnStackView() {
        let btn1 = setupButton(title: "Search Other Device")
        btn1.addTarget(self, action: #selector(searchDeviceToConnect), for: .touchUpInside)
        let btn2 = setupButton(title: "Select A Photo")
        btn2.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
        let btn3 = setupButton(title: "Send The Photo Selected")
        btn3.addTarget(self, action: #selector(sendPhoto), for: .touchUpInside)

        let stackView = UIStackView()
        stackView.addArrangedSubview(btn1)
        stackView.addArrangedSubview(btn2)
        stackView.addArrangedSubview(btn3)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        view.addSubview(stackView)

        buttonStackView = stackView

        setupButtonStackViewConstrains()
    }

    private func setupLabel() {
        let label = UILabel()
        label.text = "Allow other device to connect to your device"
        label.sizeToFit()
        view.addSubview(label)

        self.label = label
        setupLabelConstrains()
    }

    private func setupAllowSwitch() {
        let allowSwitch = UISwitch()
        allowSwitch.addTarget(self, action: #selector(toggleDiscoverable), for: .valueChanged)

        view.addSubview(allowSwitch)

        self.allowSwitch = allowSwitch
        setupAllowSwitchConstrains()
    }

    private func setupImageViewConstrains() {
        imageView?.translatesAutoresizingMaskIntoConstraints = false

        var constrains = [NSLayoutConstraint]()
        constrains.append(imageView!.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor))
        constrains.append(imageView!.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -150))
        constrains.append(imageView!.widthAnchor.constraint(equalToConstant: 300))
        constrains.append(imageView!.heightAnchor.constraint(equalToConstant: 200))

        NSLayoutConstraint.activate(constrains)
    }

    private func setupAllowSwitchConstrains() {
        allowSwitch?.translatesAutoresizingMaskIntoConstraints = false
        var constrains = [NSLayoutConstraint]()
        constrains.append(allowSwitch!.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constrains.append(allowSwitch!.topAnchor.constraint(equalTo: label!.bottomAnchor, constant: 20))

        NSLayoutConstraint.activate(constrains)
    }

    private func setupLabelConstrains() {
        label?.translatesAutoresizingMaskIntoConstraints = false
        var constrains = [NSLayoutConstraint]()
        constrains.append(label!.centerXAnchor.constraint(equalTo: view.centerXAnchor))
        constrains.append(label!.topAnchor.constraint(equalTo: imageView!.bottomAnchor, constant: 20))

        NSLayoutConstraint.activate(constrains)
    }

    private func setupButtonStackViewConstrains() {
        buttonStackView?.translatesAutoresizingMaskIntoConstraints = false

        var constrains = [NSLayoutConstraint]()

        constrains.append(buttonStackView!.topAnchor.constraint(equalTo: allowSwitch!.bottomAnchor, constant: 20))
        constrains.append(buttonStackView!.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor))
        constrains.append(buttonStackView!.widthAnchor.constraint(equalToConstant: 200))
        constrains.append(buttonStackView!.heightAnchor.constraint(equalToConstant: 150))

        NSLayoutConstraint.activate(constrains)
    }

    private func setupButton(title: String) -> UIButton {
        let btn = UIButton(type: .roundedRect)
        btn.setTitle(title, for: .normal)
        btn.sizeToFit()
        return btn
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        print("\(info)")

        //1.取出照片
        imageView?.image = info[.originalImage] as? UIImage

        picker.dismiss(animated: true)
    }

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}