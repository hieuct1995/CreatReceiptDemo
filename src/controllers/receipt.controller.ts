import { Request, Response } from "express";
import { AppDataSource } from "../models/data-source";
import { Department } from "../models/entity/Department";
import { Warehouse } from "../models/entity/Warehouse";
import { Product } from "../models/entity/Product";
import { Receipt } from "../models/entity/Receipt";
import { ReceiptDetail } from "../models/entity/ReceiptDetail";
import { DepartmentController } from "./department.controller";
import { WarehouseController } from "./warehouse.controller";
import { ProductController } from "./product.controller";
import { ReceiptDetailController } from "./receiptDetail.controller";


export type dataProductFromTable = {
    name: string,
    code: string,
    unit: string,
    price: number,
    quantityOnNote: number,
    quantityReal: number,
}

export class ReceiptController {
    static receiptRepository = AppDataSource.getRepository(Receipt);

    static async getCreateForm(req: Request, res: Response) {
        try {
            const departments: Department[] = await DepartmentController.getAllDepartment();
            const warehouses: Warehouse[] = await WarehouseController.getAllwarehouse();
            res.render('create', { departments, warehouses })
        } catch (err) {
            res.status(500).json({
                message: err.message
            });
        }

    }

    static async createReceipt(req: Request, res: Response) {
        try {
            let { department, pratitive, create_at, warehouse,
                code_number, deliverer, creator, stocker, chiefAccountant, localStorageData } = req.body.data;
            let receiptExisted: Receipt = await ReceiptController.receiptRepository.findOne({
                where: {
                    code_number: code_number
                }
            });
            if (receiptExisted) {
                return res.status(409).json({
                    message: "Mã phiếu đã tồn tại"
                })
            }

            let newReceipt: Receipt = new Receipt();
            newReceipt.code_number = code_number;
            newReceipt.create_at = create_at;
            newReceipt.deliverer = deliverer;
            newReceipt.creator = creator;
            newReceipt.stocker = stocker;
            newReceipt.chiefAccountant = chiefAccountant;
            newReceipt.pratitive = pratitive;
            newReceipt.warehouse = warehouse;
            let receipt = await ReceiptController.receiptRepository.save(newReceipt);
            if (!receipt) {
                return res.status(400).json({
                    message: "Kiểm tra lại dữ liệu"
                });
            }
            let products: Product[] = await ProductController.getAllProduct();
            localStorageData = JSON.parse(localStorageData);
            localStorageData.forEach(async (data: dataProductFromTable) => {
                let productExisted = products.find(item => item.code === data.code);
                let newProduct: Product = productExisted;
                if (!productExisted) {
                    newProduct = await ProductController.createNewProduct(data);
                    if (!newProduct) {
                        return res.status(400).json({
                            message: "Kiểm tra lại dữ liệu"
                        });
                    }
                }
                let newReceiptDetail: ReceiptDetail = await ReceiptDetailController.createNewreceiptDetail(data, receipt, newProduct);
                if (!newReceiptDetail) {
                    return res.status(400).json({
                        message: "Kiểm tra lại dữ liệu"
                    });
                }
            })
            return res.status(200).json({
                message: "Tạo phiếu thành công!",
            })
        } catch (err) {
            res.status(500).json({
                message: err.message
            });
        }
    }

}