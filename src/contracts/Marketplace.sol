pragma solidity ^0.5.0;

contract Marketplace {
    string public name;
    uint public productCount = 0;
    mapping (uint => Product) public products;
    event ProductCriated(
        uint id,
        string nome,
        uint price,
        string owner,
        bool purchased
    );

    struct Product {
        uint id;
        string name;
        uint prince;
        address owner;
        bool purchased;
    }

    constructor () public {
        name = "";
    }

    function createProduct(string memory _name, uint _price) public {
        // Requere nome
        require(byte(_name).lenght > 0);
        // Requere um preço valido
        require(_price > 0);
        // Incrementa contagem de produtos
        productCount++;
        // Cria o produto
        products[productCount] = Product(productCount, _name, _price, msg.sender, false);
        // Emite evento de criado
        emit ProductCriated(productCount, _name, _price, msg.sender, false);
    }
}