import {Entity, Column, PrimaryGeneratedColumn, OneToMany, ManyToOne, JoinColumn } from "typeorm";
import { Receipt } from "./Receipt";
import { Department } from "./Department";
@Entity()

export class Pratitive {
    @PrimaryGeneratedColumn()
    public readonly id: number;

    @Column({type: "varchar", length: 50})
    public pratitive_name: string;

    @OneToMany(() => Receipt, (receipt) => receipt.pratitive)
    receipts: Receipt[]

    @ManyToOne(() => Department, (department) => department.pratitives)
    @JoinColumn({ name: 'department_id' })
    department: Department
}