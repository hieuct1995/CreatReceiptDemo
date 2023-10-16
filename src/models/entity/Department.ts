import {Entity, Column, PrimaryGeneratedColumn, OneToMany } from "typeorm";
import { Pratitive } from "./Pratitive";
@Entity()

export class Department {
    @PrimaryGeneratedColumn()
    public readonly id: number;

    @Column({type: "varchar", length: 50})
    public department_name: string;

    @OneToMany(() => Pratitive, (pratitive) => pratitive.department)
    pratitives: Pratitive[]
}