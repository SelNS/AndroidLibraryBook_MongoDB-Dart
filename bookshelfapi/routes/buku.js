const router = require('express').Router()
const bukuController = require('../controllers/bukuController')
// const uploadConfig = require('../uploadConfig')
// const fields = uploadConfig.upload.fields([
//   {
//     name: 'gambar',
//     maxCount: 1
//   }
// ])

router.post('/create',(req, res) => {
  // req.body.gambar = req.files.gambar[0].filename
  // console.log(req.body)
  bukuController.create(req.body)
    .then(result => res.json(result))
    .catch(err => res.json(err))
})

router.put('/edit',(req, res) => {
  
  let data = req.body
  
  // console.log(data)
  bukuController.edit(req.params.judul, data)
    .then(result => res.json(result))
    .catch(err => res.json(err))
})


router.get('/getall', (req, res) => {
  bukuController.getData()
    .then(result => res.json(result))
    .catch(err => res.json(err))
})

router.get('/getbyid', (req, res) => {
  console.log(req.params.judul)
  bukuController.getById(req.params.id)
    .then(result => res.json(result))
    .catch(err => res.json(err))
})

router.delete('/hapus', (req, res) => {
  bukuController.delete(req.params.judul)
    .then(result => res.json(result))
    .catch(err => res.json(err))
})


module.exports = router