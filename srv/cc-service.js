module.exports = cds => {
    const { Models, Components, Adapters } = cds.entities

    cds.on('CreateEntity', async (req, ) => {
        const entity = (req.entity === 'CatalogService.Kinds') ? Models :
            (req.entity === 'CatalogService.Models') ? Components :
                (req.entity === 'CatalogService.Components') ? Adapters : null;
        const idParent = req.params[req.params.length - 1].ID;
        const idParentAssociacion = (req.entity === 'CatalogService.Kinds') ? 'ID_Kind_ID' :
            (req.entity === 'CatalogService.Models') ? 'ID_Model_ID' :
                (req.entity === 'CatalogService.Components') ? 'ID_Component_ID' : null;
        const IsActiveEntity = req.params[req.params.length - 1].IsActiveEntity;
        if (!IsActiveEntity) throw req.reject(400, `Sorry, I couldn't create model, becouse you have parent's draft. Please, save it.`)
        console.log('req.params', req.params,'entity', entity, 'reqEntity', req.entity, 'IdParent', idParent, 'IDAssoc', idParentAssociacion);
        await INSERT.into(entity).columns([idParentAssociacion, 'name']).values([idParent, 'New Entry 3']);
    })
}