import {Entity, Column, PrimaryGeneratedColumn, ManyToOne, OneToMany, JoinColumn } from "typeorm";
import { Department } from "./Department";
import { Warehouse } from "./Warehouse";
import { ReceiptDetail } from "./ReceiptDetail";
import { Pratitive } from "./Pratitive";
@Entity()

export class Receipt {
    @PrimaryGeneratedColumn()
    public readonly id: number;

    @Column({type: "varchar", unique: true})
    public code_number: string;

    @Column({type: "date"})
    public create_at: Date;

    @Column({type: "varchar", length: 50})
    public deliverer: string;

    @Column({type: "varchar", length: 50})
    public creator: string;

    @Column({type: "varchar", length: 50})
    public stocker: string;

    @Column({type: "varchar", length: 50})
    public chiefAccountant: string;

    @ManyToOne(() => Pratitive, (pratitve) => pratitve.receipts)
    @JoinColumn({ name: 'pratitive_id' })
    pratitive: Pratitive

    @ManyToOne(() => Warehouse, (warehouse) => warehouse.receipts)
    @JoinColumn({ name: 'warehouse_id' })
    warehouse: Warehouse

    @OneToMany(() => ReceiptDetail, (ReceiptDetail) => ReceiptDetail.receipt)
    receiptDetails: ReceiptDetail[]
}