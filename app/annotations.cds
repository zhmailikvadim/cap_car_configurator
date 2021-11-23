using CatalogService as cs from '../srv/cc-service';
annotate cs.Adapters {
    ID          @readonly;
    name        @title : 'Name';
    description @title : 'Description';
    ID_component    @title : 'ID_Adapter';
};

annotate cs.Adapters with @UI : {
    PresentationVariant            : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : name,
            Descending : false
        }]
    },
    Identification                 : [
        {Value : name},
        {Value : description},
    ],
    SelectionFields                : [
        name,
        description
    ],
    HeaderInfo                     : {
        TypeName       : 'Adapter',
        TypeNamePlural : 'Adapters',
        Title          : {
            $Type : 'UI.DataField',
            Value : name
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : description
        }
    },
    LineItem                       : [
        {
            Value : name,
            Label : 'Component'
        },
        {Value : description},
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'CatalogService.CreateEntity',
            Label  : 'CreateEntity'
        },
    ],

    Facets                         : [{
        $Type  : 'UI.CollectionFacet',
        Label  : 'Model',
        ID     : 'Adapter',
        Facets : [
            {
                $Type  : 'UI.ReferenceFacet',
                ID     : 'AdapterData',
                Target : '@UI.FieldGroup#Adapter',
                Label  : 'Adapter'
            },
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : 'administrativeData',
                Target : '@UI.FieldGroup#AdministrativeData'
            },
        ],
        
    }],
    FieldGroup #Adapter          : {
        $Type : 'UI.FieldGroupType',
        Label : 'Model',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : name
            },
            {
                $Type : 'UI.DataField',
                Value : description
            },
        ]
    },
    FieldGroup #AdministrativeData : {
        Label : 'administrativeData',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : ID_component_ID
            },
        ]
    }
};
annotate cs.Components {
    ID          @readonly;
    name        @title : 'Name';
    description @title : 'Description';
    ID_model    @title : 'ID_Model';
};

annotate cs.Components with @UI : {
    PresentationVariant            : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : name,
            Descending : false
        }]
    },
    Identification                 : [
        {Value : name},
        {Value : description},
    ],
    SelectionFields                : [
        name,
        description
    ],
    HeaderInfo                     : {
        TypeName       : 'Component',
        TypeNamePlural : 'Components',
        Title          : {
            $Type : 'UI.DataField',
            Value : name
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : description
        }
    },
    LineItem                       : [
        {
            Value : name,
            Label : 'Component'
        },
        {Value : description},
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'CatalogService.CreateEntity',
            Label  : 'CreateEntity'
        },
    ],

    Facets                         : [{
        $Type  : 'UI.CollectionFacet',
        Label  : 'Model',
        ID     : 'Component',
        Facets : [
            {
                $Type  : 'UI.ReferenceFacet',
                ID     : 'ComponentData',
                Target : '@UI.FieldGroup#Component',
                Label  : 'Component'
            },
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : 'administrativeData',
                Target : '@UI.FieldGroup#AdministrativeData'
            },
        ],
        
    },        {
            $Type  : 'UI.ReferenceFacet',
            Target : 'to_adapters/@UI.LineItem',
            Label  : 'Models'
        } ],
    FieldGroup #Component          : {
        $Type : 'UI.FieldGroupType',
        Label : 'Model',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : name
            },
            {
                $Type : 'UI.DataField',
                Value : description
            },
        ]
    },
    FieldGroup #AdministrativeData : {
        Label : 'administrativeData',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : ID_model_ID
            },
        ]
    }
};

annotate cs.Models {
    @readonly
    ID            @title        : 'ID';
    name          @title        : 'Name';
    description   @title        : 'Description';
    ID_kind       @title        : 'IdKind';
    to_components ;
};

annotate cs.Models with @UI : {
    CreateHidden                   : false,
    PresentationVariant            : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : name,
            Descending : false
        }]
    },
    Identification                 : [
        {Value : name},
        {Value : description},
    ],
    SelectionFields                : [
        name,
        description
    ],
    HeaderInfo                     : {
        TypeName       : 'Model',
        TypeNamePlural : 'Models',
        Title          : {
            $Type : 'UI.DataField',
            Value : name
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : description
        }
    },
    LineItem                       : [
        {
            Value : name,
            Label : 'Model'
        },
        {Value : description},
        {Value : ID_kind_ID},
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'CatalogService.CreateEntity',
            Label  : 'CreateEntity'
        },
    ],

    Facets                         : [
        {
            $Type  : 'UI.CollectionFacet',
            Label  : 'Model',
            ID     : 'Model',
            Facets : [
                {
                    $Type  : 'UI.ReferenceFacet',
                    ID     : 'ModelData',
                    Target : '@UI.FieldGroup#Model',
                    Label  : 'Kind'
                },
                {
                    $Type  : 'UI.ReferenceFacet',
                    Label  : 'administrativeData',
                    Target : '@UI.FieldGroup#AdministrativeData'
                },
            ]
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Target : 'to_components/@UI.LineItem',
            Label  : 'Models'
        }
    ],
    FieldGroup #Model              : {
        $Type : 'UI.FieldGroupType',
        Label : 'Model',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : name
            },
            {
                $Type : 'UI.DataField',
                Value : description
            },
            {
                $Type : 'UI.DataField',
                Value : ID_kind_ID
            },
        ]
    },
    FieldGroup #AdministrativeData : {
        Label : 'administrativeData',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : ID_kind_ID,
            },
            {
                $Type : 'UI.DataField',
                Value : ID,
            }
        ]
    }
};

annotate cs.Kinds {
    ID          @readonly;
    name        @title : 'Name';
    description @title : 'Description';
    to_models;
}

annotate cs.Kinds with @UI : {
    PresentationVariant            : {
        Text           : 'Default',
        Visualizations : ['@UI.LineItem'],
        SortOrder      : [{
            $Type      : 'Common.SortOrderType',
            Property   : name,
            Descending : false
        }]
    },
    Identification                 : [
        {Value : name},
        {Value : description},
    ],
    SelectionFields                : [
        name,
        description
    ],
    HeaderInfo                     : {
        TypeName       : 'Kind',
        TypeNamePlural : 'Kinds',
        Title          : {
            $Type : 'UI.DataField',
            Value : name
        },
        Description    : {
            $Type : 'UI.DataField',
            Value : description
        }
    },
    LineItem                       : [
        {Value : name},
        {Value : description},
        {
            $Type  : 'UI.DataFieldForAction',
            Action : 'CatalogService.CreateEntity',
            Label  : 'CreateEntity'
        },
    ],

    Facets                         : [
        {
            $Type  : 'UI.CollectionFacet',
            Label  : 'Booking',
            ID     : 'Kind',
            Facets : [
                {
                    $Type  : 'UI.ReferenceFacet',
                    ID     : 'KindData',
                    Target : '@UI.FieldGroup#Kind',
                    Label  : 'Kind'
                },
                {
                    $Type  : 'UI.ReferenceFacet',
                    Label  : 'administrativeData',
                    Target : '@UI.FieldGroup#AdministrativeData'
                },
            ]
        },
        {
            $Type  : 'UI.ReferenceFacet',
            Target : 'to_models/@UI.LineItem',
            Label  : 'Models'
        }
    ],
    FieldGroup #Kind               : {
        $Type : 'UI.FieldGroupType',
        Label : 'Kind',
        Data  : [

            {
                $Type : 'UI.DataField',
                Value : name
            },
            {
                $Type : 'UI.DataField',
                Value : description
            },
        ]
    },
    FieldGroup #AdministrativeData : {
        Label : 'administrativeData',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedBy,
            },
            {
                $Type : 'UI.DataField',
                Value : ID,
            },
        ]
    }
};
