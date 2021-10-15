//
//  ViewController.swift
//  PrevisaoDoTempo
//
//  Created by Pedro Gomes on 15/10/21.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Views
    lazy var previsaoCollectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width/3.0 - 10, height: view.frame.height/3)
        layout.minimumLineSpacing = 10.0
        layout.minimumInteritemSpacing = 5
        
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        
        return collectionView
    }()
    
    var labelTitulo: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Previsão para a semana"
        label.font = UIFont.systemFont(ofSize: 24.0, weight: .bold)
        return label
    }()
    
    // MARK: - Variáveis
    let previsaoSemana: [Previsao] = [
        Previsao(diaMes: 7, diaSemana: .domingo, clima: .sol),
        Previsao(diaMes: 8, diaSemana: .segunda, clima: .sol),
        Previsao(diaMes: 9, diaSemana: .terca, clima: .nublado),
        Previsao(diaMes: 10, diaSemana: .quarta, clima: .chuva),
        Previsao(diaMes: 11, diaSemana: .quinta, clima: .chuva),
        Previsao(diaMes: 12, diaSemana: .sexta, clima: .nublado),
        Previsao(diaMes: 13, diaSemana: .sabado, clima: .sol),
    ]
    
    var idCelulaPadrao: String = "celula"
    
    // MARK: - Ciclo de Vida
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        preparaTitulo()
        preparaCollectionView()
        preparaConstraints()
    }
    
    func preparaTitulo() {
        self.view.addSubview(labelTitulo)
        
        NSLayoutConstraint.activate([
            labelTitulo.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            labelTitulo.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20.0)
        ])
    }
    
    
    func preparaCollectionView() {
        
        previsaoCollectionView.delegate = self
        previsaoCollectionView.dataSource = self
        
        // registrar célula padrão
        previsaoCollectionView.register(
            UICollectionViewCell.self,
            forCellWithReuseIdentifier: "cell"
        )
        
        let nibCelula = UINib(nibName: "CollectionViewCell", bundle: nil)
        
        previsaoCollectionView.register(nibCelula, forCellWithReuseIdentifier: CollectionViewCell.idCelula)

        
        self.view.addSubview(previsaoCollectionView)
    }
    
    func preparaConstraints() {
        
        NSLayoutConstraint.activate([
            previsaoCollectionView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.95),
            previsaoCollectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            previsaoCollectionView.topAnchor.constraint(equalTo: self.labelTitulo.bottomAnchor, constant: 10.0),
            previsaoCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }

}


extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.previsaoSemana.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.idCelula, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let previsao = self.previsaoSemana[indexPath.row]
        
        cell.popula(com: previsao)
        
        return cell
    }
    
}
