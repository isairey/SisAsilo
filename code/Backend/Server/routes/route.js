const express = require('express');
const pamController = require('../controllers/pamController')

const router = express.Router();
router.get('/api/getPams', pamController.getPams);
router.get('/api/getPam/:pamID', pamController.getPam);
router.post('/api/updatePam/:pamID', pamController.updatePam);
router.post('/api/addPams', pamController.addPam);
router.delete('/api/deletePam/:pamID', pamController.deletePam);



module.exports = router;