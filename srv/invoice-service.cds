using { com.invoiceapp as inv } from '../db/schema.cds';

service InvoiceService @(path: '/invoice', requires: 'authenticated-user') {

    @odata.draft.enabled
    entity Invoices @(
        restrict: [
            {grant: ['READ'], to: 'Display'},
            {grant: ['WRITE', 'DELETE', 'submitInvoice'], to: 'Edit'}
        ]
    ) as projection on inv.Invoice
    actions {
        action submitInvoice() returns Invoices;
    };
    entity LineItems as projection on inv.LineItem;
    entity Vendors as projection on inv.Vendor;
    entity CostCenters as projection on inv.CostCenter;

    @readonly
    entity InvoiceStatus as projection on inv.InvoiceStatus;
}