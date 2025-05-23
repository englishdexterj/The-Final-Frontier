{
  "spriteId": null,
  "solid": false,
  "visible": true,
  "spriteMaskId": null,
  "persistent": false,
  "parentObjectId": {
    "name": "o_enemy",
    "path": "objects/o_enemy/o_enemy.yy",
  },
  "physicsObject": false,
  "physicsSensor": false,
  "physicsShape": 1,
  "physicsGroup": 1,
  "physicsDensity": 0.5,
  "physicsRestitution": 0.1,
  "physicsLinearDamping": 0.1,
  "physicsAngularDamping": 0.1,
  "physicsFriction": 0.2,
  "physicsStartAwake": true,
  "physicsKinematic": false,
  "physicsShapePoints": [],
  "eventList": [
    {"isDnD":false,"eventNum":0,"eventType":4,"collisionObjectId":{"name":"o_bullet","path":"objects/o_bullet/o_bullet.yy",},"parent":{"name":"o_enemy_suicider","path":"objects/o_enemy_suicider/o_enemy_suicider.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":1,"eventType":2,"collisionObjectId":null,"parent":{"name":"o_enemy_suicider","path":"objects/o_enemy_suicider/o_enemy_suicider.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":2,"collisionObjectId":null,"parent":{"name":"o_enemy_suicider","path":"objects/o_enemy_suicider/o_enemy_suicider.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":3,"collisionObjectId":null,"parent":{"name":"o_enemy_suicider","path":"objects/o_enemy_suicider/o_enemy_suicider.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
    {"isDnD":false,"eventNum":0,"eventType":0,"collisionObjectId":null,"parent":{"name":"o_enemy_suicider","path":"objects/o_enemy_suicider/o_enemy_suicider.yy",},"resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMEvent",},
  ],
  "properties": [],
  "overriddenProperties": [
    {"propertyId":{"name":"enemy_type","path":"objects/o_enemy/o_enemy.yy",},"objectId":{"name":"o_enemy","path":"objects/o_enemy/o_enemy.yy",},"value":"suicider","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"enemy_type_particle","path":"objects/o_enemy/o_enemy.yy",},"objectId":{"name":"o_enemy","path":"objects/o_enemy/o_enemy.yy",},"value":"global.pt_suicider","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
    {"propertyId":{"name":"can_shoot","path":"objects/o_enemy/o_enemy.yy",},"objectId":{"name":"o_enemy","path":"objects/o_enemy/o_enemy.yy",},"value":"False","resourceVersion":"1.0","name":"","tags":[],"resourceType":"GMOverriddenProperty",},
  ],
  "parent": {
    "name": "Enemies",
    "path": "folders/Objects/Enemies.yy",
  },
  "resourceVersion": "1.0",
  "name": "o_enemy_suicider",
  "tags": [],
  "resourceType": "GMObject",
}