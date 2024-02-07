/*
SPDX-License-Identifier: MIT
(c) Desenvolvido por Leandro Almeida
*/
pragma solidity 0.8.19;

/// @author Leandro Almeida
/// @title Um exemplo de Amizades
/// endereço do contrato: 0xA6e3B518087d1b76dE39167A6d5664B9beB51Af2
contract Amizades {

    mapping(address=>mapping(address => uint8)) public amizades;

    event LogNovaAmizade(address eu, address amigo);
 //   event LogQtdAmizades(address eu, uint8 qtdAmizades);

    // @notice Adicionar amigo
    // @dev coloca o amigo no mapa do usuario que vai transacionar
    function adicionar(address _contaAmigo) public {
        require(msg.sender != _contaAmigo, "Sinto muito. Eu ja sei que vc e seu amigo, preciso de outro");
        amizades[msg.sender][_contaAmigo] = 1;
        emit LogNovaAmizade(msg.sender, _contaAmigo);
//        emit LogQtdAmizades(msg.sender, amizades[msg.sender].length);
    }

}
