import { ReceiptDetail } from "../models/entity/ReceiptDetail";
import { AppDataSource } from "../models/data-source";
import { Product } from "../models/entity/Product";
import { Receipt } from "../models/entity/Receipt";
import { dataProductFromTable } from "./receipt.controller";


export class ReceiptDetailController {
    static receiptDetailRepository = AppDataSource.getRepository(ReceiptDetail);

    static async createNewreceiptDetail(receiptDetail: dataProductFromTable, receipt: Receipt, product: Product) {
        try {
            const newreceiptDetail: ReceiptDetail = new ReceiptDetail();
            newreceiptDetail.quantityOnNote = receiptDetail.quantityOnNote;
            newreceiptDetail.quantityReal = receiptDetail.quantityReal;
            newreceiptDetail.price = receiptDetail.price;
            newreceiptDetail.receipt = receipt;
            newreceiptDetail.product = product;
            return await ReceiptDetailController.receiptDetailRepository.save(newreceiptDetail);
        } catch (err) {
            return err.message;
        }
    }
}