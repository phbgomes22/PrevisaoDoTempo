//
//  CollectionViewCell.swift
//  PrevisaoDoTempo
//
//  Created by Pedro Gomes on 15/10/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagemCelula: UIImageView!
    
    @IBOutlet weak var labelDiaMes: UILabel!
    
    @IBOutlet weak var labelDiaSemana: UILabel!
    
    
    static let idCelula = "celulaCustomizada"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func popula(com previsao: Previsao) {
        imagemCelula.image = UIImage(named: previsao.clima.imagem)
        
        labelDiaMes.text = "Dia \(previsao.diaMes)"
        
        labelDiaSemana.text = previsao.diaSemana.rawValue
    }
}
