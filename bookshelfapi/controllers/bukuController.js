const bukuModel = require('../models/buku')

exports.create = (data) =>
  new Promise((resolve, reject) => {
    bukuModel.create(data)
      .then(() => {
        resolve({
          sukses: true,
          msg: 'Berhasil Menyimpan Data Buku'
        })
      }).catch((e) => {
        console.log(e)
        reject({
          sukses: false,
          msg: 'Gagal Menyimpan Data Buku'
        })
      })
  })

exports.getData = () =>
  new Promise((resolve, reject) => {
    bukuModel.find({})
      .then(res => {
        resolve({
          sukses: true,
          msg: 'Berhasil Mengambil Data Buku',
          data: res
        })
      }).catch(() => reject({
        sukses: false,
        msg: 'Gagal Mengambil Data Buku',
        data: []
      }))
  })

exports.getById = (judul) =>
  new Promise((resolve, reject) => {
    bukuModel.findOne({
      _judul: judul
    })
      .then(res => {
        resolve({
          sukses: true,
          msg: 'Berhasil Mengambil Data Buku',
          data: res
        })
      }).catch(() => reject({
        sukses: false,
        msg: 'Gagal Mengambil Data Buku',
        data: {}
      }))
  })

exports.edit = (judul, data) =>
  new Promise((resolve, reject) => {
    bukuModel.updateOne({
      _judul: judul
    }, data).then(() => resolve({
      sukses: true,
      msg: 'Berhasil Edit Data Buku'
    })).catch(() => reject({
      sukses: false,
      msg: 'Gagal Edit Data Buku'
    }))
  })

exports.delete = (judul) =>
  new Promise((resolve, reject) => {
    bukuModel.deleteOne({
      _judul: judul
    }).then(() => resolve({
      sukses: true,
      msg: 'Berhasil Hapus Data Buku'
    })).catch(() => reject({
      sukses: false,
      msg: 'Gagal Hapus Data Buku'
    }))
  })