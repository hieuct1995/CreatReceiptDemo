import { AppDataSource } from "../models/data-source";
import { Department } from "../models/entity/Department";


export class DepartmentController {
    static departmentRepository = AppDataSource.getRepository(Department);

    static async getAllDepartment() {
        try {
            const departments: Department[] = await DepartmentController.departmentRepository.find();
            return departments
        } catch (err) {
            return err.message;
        }
    }
}