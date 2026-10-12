namespace com.invoiceapp;

using { cuid,managed, sap.common.CodeList } from '@sap/cds/common';

entity CostCenter: cuid, managed{
    centerCode: String(10) not null;
    description: String(100);
    department: String(50);
}

entity Vendor: cuid, managed{
    name: String(100) not null;
    taxId: String(20);
    email: String(100);
    phone: String(20);
    street: String(100);
    city: String(50);
    country: String(3);
    invoices: Association to many Invoice on invoices.vendor = $self;
}

entity InvoiceStatus: CodeList{
    key Code: String(2);
}

entity Invoice: cuid, managed{
    invoiceNumber: String(20) not null;
    invoiceDate: Date not null;
    dueDate: Date;
    grossAmount: Decimal(13, 2);
    currency: String(3) default 'INR';
    notes: String(500);

    //---Associations
    vendor: Association to Vendor not null;
    costCenter: Association to CostCenter;
    status_code: String(2) not null default 'DR';
    status: Association to InvoiceStatus on status.Code= status_code;

    //---Compositions
    lineItems: Composition of many LineItem on lineItems.invoice = $self;
}

entity LineItem: cuid, managed{
    invoice: Association to Invoice;
    positionNumber: Integer;
    description: String(200) not null;
    quantity: Decimal(10,2);
    unitPrice: Decimal(13,2);
    amount: Decimal(13,2);
}