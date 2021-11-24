module.exports = cds => {
    const { Models, Components, Adapters } = cds.entities

    cds.on('CreateChildEntity', async (req, ) => {
        console.log('req', req);
        const parentInfo = (req.entity === 'CatalogService.Kinds') ? { entity: Models } :
            (req.entity === 'CatalogService.Models') ? { entity: Components} :
                (req.entity === 'CatalogService.Components') ? { entity: Adapters } : null;
        parentInfo.ID = req.params[req.params.length - 1].ID;
        parentInfo.IsActiveEntity = req.params[req.params.length - 1].IsActiveEntity;

        if (!parentInfo.IsActiveEntity)
            throw req.reject(400, `Sorry, I couldn't create model, becouse you have parent's draft. Please, save it.`)
        console.log('parentInfo.entity', parentInfo.entity, 'parentInfo.ID_Parent', parentInfo.ID_Parent, 'parentInfo.ID', parentInfo.ID);
        await INSERT.into(parentInfo.entity).columns(['ID_parent_ID', 'name','description']).values([parentInfo.ID, 'New Entry', parentInfo.ID]);
    })
}