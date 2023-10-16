import { AppDataSource } from "../models/data-source";
import { Warehouse } from '../models/entity/Warehouse';

export class WarehouseController {
    static warehouseRepository = AppDataSource.getRepository(Warehouse);

    static async getAllwarehouse() {
        try {
            const warehouses: Warehouse[] = await WarehouseController.warehouseRepository.find();
            return warehouses
        } catch (err) {
            return err.message;
        }
    }
}