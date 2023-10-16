import { Router } from "express";
import { ReceiptController } from "../controllers/receipt.controller";
import { PratitveController } from "../controllers/pratitive.controller";

export const APIRouter = Router();

APIRouter.get('/receipts/create', ReceiptController.getCreateForm);
APIRouter.post('/receipts/create', ReceiptController.createReceipt);

//Lấy tất cả các bộ phận theo đơn vị
APIRouter.get('/departments/:id/pratitives', PratitveController.getAllPractitveByDepartment);