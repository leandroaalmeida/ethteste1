/*
SPDX-License-Identifier: MIT
(c) Desenvolvido por Leandro Almeida
*/
pragma solidity 0.8.19;

/// @author Leandro Almeida
/// @title Um exemplo de Amizades
/// endereco: 0x15587B95beF44578F037720643ac9Aa972fE1e54
contract Amizades {

    mapping(address=>mapping(address => string)) private amizades;
    mapping(address=>uint256) private qtdAmizades;

    event LogNovaAmizade(address eu, address amigo, string nome);
    event LogQtdAmizades(address eu, uint256 qtdAmizades);

    // @notice Adicionar amigo
    // @dev coloca o amigo no mapa do usuario que iniciou a transacao
    function adicionar(address _contaAmigo, string memory nome) public {
        require(msg.sender != _contaAmigo, "Sinto muito. Eu ja sei que vc e seu amigo, preciso de outro");
        bytes memory nomeExistente = bytes(amizades[msg.sender][_contaAmigo]);
        require(nomeExistente.length == 0, "Esta amizade ja existe. OBS: e deve ser bem forte.");
        if (nomeExistente.length == 0) {
            qtdAmizades[msg.sender]++;
        }
        amizades[msg.sender][_contaAmigo] = nome;
        emit LogNovaAmizade(msg.sender, _contaAmigo, nome);
        emit LogQtdAmizades(msg.sender, qtdAmizades[msg.sender]);
    }

    // @notice Consultar quantidade de amigos
    // @dev retorna o contador que esta no segundo mapa para cada usuario
    // @return quantidade atual de amigos do usuario que iniciou a operacao
    function quantidadeAmigos() public view returns (uint256) {
        return qtdAmizades[msg.sender];
    }
}
