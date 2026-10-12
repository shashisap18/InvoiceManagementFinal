sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"com/shashi/invoice/manageinvoices/test/integration/pages/InvoicesList.gen",
	"com/shashi/invoice/manageinvoices/test/integration/pages/InvoicesObjectPage.gen",
	"com/shashi/invoice/manageinvoices/test/integration/pages/LineItemsObjectPage.gen"
], function (JourneyRunner, InvoicesListGenerated, InvoicesObjectPageGenerated, LineItemsObjectPageGenerated) {
    'use strict';

    const runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('com/shashi/invoice/manageinvoices') + '/test/flp.html#app-preview',
        pages: {
			onTheInvoicesListGenerated: InvoicesListGenerated,
			onTheInvoicesObjectPageGenerated: InvoicesObjectPageGenerated,
			onTheLineItemsObjectPageGenerated: LineItemsObjectPageGenerated
        },
        async: true
    });

    return runner;
});

