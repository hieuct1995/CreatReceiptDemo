import {Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn } from "typeorm";
import { Receipt } from "./Receipt";
import { Product } from "./Product";

@Entity()

export class ReceiptDetail {
    @PrimaryGeneratedColumn()
    public readonly id: number;

    @Column({type: "int"})
    public quantityOnNote: number;

    @Column({type: "int"})
    public quantityReal: number;

    @Column({type: "real"})
    public price: number;

    @ManyToOne(() => Receipt, (receipt) => receipt.receiptDetails)
    @JoinColumn({ name: 'receipt_id' })
    receipt: Receipt

    @ManyToOne(() => Product, (product) => product.receiptDetails)
    @JoinColumn({ name: 'product_id' })
    product: Product
}