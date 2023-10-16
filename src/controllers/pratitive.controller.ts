import { Request, Response } from "express";
import { AppDataSource } from "../models/data-source";
import { Pratitive } from "../models/entity/Pratitive";


export class PratitveController {
    static pratitiveRepository = AppDataSource.getRepository(Pratitive);

    static async getAllPractitveByDepartment(req: Request, res: Response) {
        try {
            const departmentID = + req.params.id
            const pratitives: Pratitive[] = await PratitveController.pratitiveRepository.find(
                {
                    relations: {
                        department: true
                    },
                    where: {
                        department: {
                            id: departmentID
                        }
                    }
                }
            );
            if (pratitives) {
                res.status(200).json({
                    message: "Success",
                    pratitives
                });
            }
        } catch (err) {
            res.status(500).json({
                message: err.message
            });
        }
    }
}