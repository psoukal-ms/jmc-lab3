# Simple Mean App
Simple application to Add, Update, Remove, Search records using MEAN stack
Records generated based on field array defined in app.js list.

```javascript
vm.fields = [
    {label: 'Name', key: 'name'},
    {label: 'Email', key: 'email'},
    {label: 'Phone', key: 'phone'}
];
```

Change above array to have your own fields, html generates input box as of now

and change below for update query in server.js

```javascript
app.put('/records/:id', function(req, res, next){
    var id = req.params.id;
    records_collection.updateOne(
        {'_id': new ObjectId(id)},
        { $set: {
            'name' : req.body.name,
            'email': req.body.email,
            'phone': req.body.phone
            }
        }, function(err, results){
            console.log(results);
            res.json(results);
    });
});
```

This is for simple seed mean app at it basic level for learning.

# Azure ARM template

ARM template used to deploy (development/test) single node AKS cluster. 
See ./AzureTemplate


# Docker packaging and service composition

- Added Docker file used to package application
- Added .dockerignore to ensure local folders are excluded in packaging step


Service composition
- Added jmc-kubernetes-web.yaml used to compose node.Js application as "web" service
- Includes local balancer, service exposed as web, liveness probe, exposing port 80 mapped to internal port 3000.

Ensure that MONGODB_URI is populated in Docker and jmc-kubernetes-web.yaml prior to deployment.
