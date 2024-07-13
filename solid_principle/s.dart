/// SOLID: S:single responsible principle - code must have one reason to change
class Product{
    String id;
    double price;
    String name;
    Product({required this.name,required this.price}):id = '${name.hashCode^price.round()}';
}

class ProductService{
    Future<void> saveProduct(Product Product)async{
        // save product
    }

    Future<bool> deleteProduct(String id)async{
        return true;
    }

    Future<void> updateProduct(String id,Product updatedProduct)async{
        // update product
    }

    Future<List<Product>> getAllProduts()async{
        return [];
    }
}

class TaxCalculation{
    double getTax(Product product){
        return 0.1*product.price;
    }
}