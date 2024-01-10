const mongoose = require('mongoose')
const Schema = mongoose.Schema

const bukuSchema = new Schema({
    judul: {
        type: String
    },
    tahun: {
      type: Number
    },
    penulis: {
      type: String
    },
    penerbit: {
      type: String
    }
})

module.exports = mongoose.model('buku', bukuSchema)