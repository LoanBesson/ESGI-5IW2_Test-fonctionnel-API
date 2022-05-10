const express = require('express');
const router = express.Router();
const bookController = require('../app/api/controllers/books');
router.get('/', bookController.getAll);
router.post('/', bookController.create);
router.get('/:bookId', bookController.getById);
router.put('/:bookId', bookController.updateById);
router.delete('/:bookId', bookController.deleteById);
module.exports = router;