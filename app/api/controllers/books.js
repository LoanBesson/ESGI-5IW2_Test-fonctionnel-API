const bookModel = require('../models/books');
module.exports = {
  getById: function (req, res, next) {
    console.log(req.body);
    bookModel.findById(req.params.bookId, function (err, bookInfo) {
      if (err) {
        next(err);
      } else {
        res.json({ status: "success", message: "Book found!!!", data: { books: bookInfo } });
      }
    });
  },
  getAll: function (req, res, next) {
    let booksList = [];
    bookModel.find({}, function (err, books) {
      if (err) {
        next(err);
      } else {
        for (let book of books) {
          booksList.push({ id: book._id, name: book.name, released_on: book.released_on });
        }
        res.json({ status: "success", message: "Books list found!!!", data: { books: booksList } });
      }
    });
  },
  updateById: function (req, res, next) {
    bookModel.findByIdAndUpdate(req.params.bookId, { name: req.body.name }, function (err, bookInfo) {
      if (err)
        next(err);
      else {
        res.json({ status: "success", message: "Book updated successfully!!!", data: null });
      }
    });
  },
  deleteById: function (req, res, next) {
    bookModel.findByIdAndRemove(req.params.bookId, function (err, bookInfo) {
      if (err)
        next(err);
      else {
        res.json({ status: "success", message: "Book deleted successfully!!!", data: null });
      }
    });
  },
  create: function (req, res, next) {
    bookModel.create({ name: req.body.name, released_on: req.body.released_on }, function (err, result) {
      if (err)
        next(err);
      else
        res.json({ status: "success", message: "Book added successfully!!!", data: null });

    });
  },
}