import {Entity, Column, PrimaryGeneratedColumn, OneToMany } from "typeorm";
import { ReceiptDetail } from "./ReceiptDetail";
@Entity()

export class Product {
    @PrimaryGeneratedColumn()
    public readonly id: number;

    @Column({type: "varchar", length: 50})
    public name: string;

    @Column({type: "varchar", length: 50})
    public code: string;

    @Column({type: "varchar", length: 20})
    public unit: string;

    @OneToMany(() => ReceiptDetail, (ReceiptDetail) => ReceiptDetail.product)
    receiptDetails: ReceiptDetail[]
}