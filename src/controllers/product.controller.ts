import { AppDataSource } from "../models/data-source";
import { Product } from "../models/entity/Product";
import { dataProductFromTable } from "./receipt.controller";


export class ProductController {
    static productRepository = AppDataSource.getRepository(Product);

    static async getAllProduct() {
        try {
            const products: Product[] = await ProductController.productRepository.find();
            return products
        } catch (err) {
            return err.message;
        }
    }

    static async createNewProduct(product: dataProductFromTable) {
        try {
            const newProduct: Product = new Product();
            newProduct.name = product.name;
            newProduct.code = product.code;
            newProduct.unit = product.unit;
            return await ProductController.productRepository.save(newProduct);
        } catch (err) {
            return err.message;
        }
    }
}