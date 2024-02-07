// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.19;

import "./owner.sol";
import "./titulo.sol";

/**
 * @title Debenture
 * @dev Operacoes de uma duplicata
 * @author Leandro ALmeida
 */
 contract Duplicata is Titulo, Owner {

    string _emissor;
    uint256 immutable _dataEmissao;
    uint256 _valor;
    uint8 immutable _decimais;
    string _sacado;
    uint256 _vencimento;

    constructor() {
        _emissor = "Sacador";
        _dataEmissao = block.timestamp;
        _valor = 100000000;
        _decimais = 2;
        _sacado = "Sacado";
        _vencimento = _dataEmissao + 90 days;
        emit NovoPrazoPagamento(_dataEmissao, _vencimento);
    }

    /**
     * @dev Retorna o valor nominal.
     */
    function valorNominal() external view returns (uint256) {
        return _valor;
    }

    /**
     * @dev Retorna o nome do Emissor.
     */
    function nomeEmissor() external view returns (string memory) {
        return _emissor;
    }

    /**
     * @dev Retorna a data da emissao.
     */
    function dataEmissao() external view returns (uint256) {
        return _dataEmissao;
    }

 }