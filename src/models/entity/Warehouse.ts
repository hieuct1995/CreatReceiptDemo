import {Entity, Column, PrimaryGeneratedColumn, OneToMany } from "typeorm";
import { Receipt } from "./Receipt";
@Entity()

export class Warehouse {
    @PrimaryGeneratedColumn()
    public readonly id: number;

    @Column({type: "varchar", length: 50})
    public name: string;

    @Column({type: "varchar", length: 100})
    public location: string;

    @OneToMany(() => Receipt, (receipt) => receipt.warehouse)
    receipts: Receipt[]
}