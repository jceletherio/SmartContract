pragma solidity >=0.4.22 <0.7.0;

contract ContretoServico {

    uint public valor;
    address payable public contratante;
    address payable public contratado;
    address dono;
    uint256 prazoconclusao; //DDMMAAAA
    uint256 prazogarantia; //DDMMAAAA
    bool realizado;
    
    
    constructor(address payable _contratado, address payable _contratante, uint256 _prazoconclusao, uint256 _prazogarantia)public payable{
        dono = msg.sender;
        contratante = _contratante;
        contratado = _contratado;
        valor = msg.value;
        prazoconclusao = _prazoconclusao;
        prazogarantia = _prazogarantia;
    }
    
    function servicoconcluido(bool _realizado) public payable{
        require(msg.sender == contratante, "Somente o contratante pode atestar que o serviço foi concluido");
        realizado = _realizado;
        contratante.transfer(valor);
        contratado.transfer(address(this).balance);
    }
    
    function getstatus()public view returns(bool){
        return realizado;
    }
    
    function getcontratante() public view returns(address){
        return contratante;
    }
    
    function getcontratado() public view returns(address){
        return contratado;
    }
    
    function getvalor() public view returns(uint256){
        return valor;
    }
    
    function gettermino() public view returns(uint256){
        return prazoconclusao;
    }
    
    function getgarantia() public view returns(uint256){
        return prazogarantia;
    }

}