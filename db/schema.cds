namespace app.cc;

using {
    custom.managed,
    TextInfo
} from './common';
using {cuid} from '@sap/cds/common';

type Name : String(50);
type LDescription : String(500);

entity Kinds : cuid, managed, TextInfo {
    key ID          : UUID;

        to_models   : Association to many Models
                          on to_models.ID_kind = $self;
};

entity Models : cuid, managed, TextInfo {
    key ID            : UUID;
        ID_kind       : Association to Kinds;
        to_components : Association to many Components
                            on to_components.ID_model = $self;
};

entity Components : cuid, managed, TextInfo {
    key ID          : UUID;
        ID_model    : Association to Models;
}