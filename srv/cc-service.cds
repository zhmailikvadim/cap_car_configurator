using app.cc from '../db/schema';

//@requires : 'authenticated-user'
service CatalogService {

    @odata.draft.enabled
    //@fiori.draft.enabled
    entity Kinds @(Capabilities : {
        DeleteRestrictions : {Deletable : true},
        InsertRestrictions : {Insertable : true},
        UpdateRestrictions : {Updatable : true}
    }) as projection on cc.Kinds actions {
                              @sap.applicable.path : 'createModelEnabled'
                              //@cds.odata.bindingparameter.collection
        action createModel();
    };

    @odata.draft.enabled
    //@fiori.draft.enabled
    @Common.DraftRoot.ActivationAction : 'createModel'
    entity Models @(Capabilities : {
        DeleteRestrictions : {Deletable : true},
        InsertRestrictions : {Insertable : true},
        UpdateRestrictions : {Updatable : true}
    }) as projection on cc.Models actions {
        action deleteModel();
    };

    @odata.draft.enabled
    //@fiori.draft.enabled
    entity Components @(Capabilities : {
        DeleteRestrictions : {Deletable : true},
        InsertRestrictions : {Insertable : true},
        UpdateRestrictions : {Updatable : true}
    }) as projection on cc.Components;

    function Count() returns Integer;

}