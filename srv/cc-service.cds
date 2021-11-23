using app.cc from '../db/schema';

//@requires : 'authenticated-user'
service CatalogService {

    @odata.draft.enabled
    entity Kinds @(Capabilities : {
        DeleteRestrictions : {Deletable : true},
        InsertRestrictions : {Insertable : true},
        UpdateRestrictions : {Updatable : true}
    }) as projection on cc.Kinds{*,} actions {
                 @sap.applicable.path : 'CreateEntityEnabled'
        action CreateEntity();
    };

    @odata.draft.enabled
    entity Models @(Capabilities : {
        DeleteRestrictions : {Deletable : true},
        InsertRestrictions : {Insertable : true},
        UpdateRestrictions : {Updatable : true}
    }) as projection on cc.Models{*,} actions {
                  @sap.applicable.path : 'CreateEntityEnabled'
        action CreateEntity();
    };

    @odata.draft.enabled
    entity Components @(Capabilities : {
        DeleteRestrictions : {Deletable : true},
        InsertRestrictions : {Insertable : true},
        UpdateRestrictions : {Updatable : true}
    }) as projection on cc.Components{*,} actions {
                      @sap.applicable.path : 'CreateEntityEnabled'
        action CreateEntity();
    };

    @odata.draft.enabled
    entity Adapters @(Capabilities : {
        DeleteRestrictions : {Deletable : true},
        InsertRestrictions : {Insertable : true},
        UpdateRestrictions : {Updatable : true}
    }) as projection on cc.Adapters{*,};

    function Count() returns Integer;

}
