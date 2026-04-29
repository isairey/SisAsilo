// import express from 'express'

const { sql,poolPromise } = require('../database/db')

class MainController {

    async getPams(req, res){
      try {
          const pool = await poolPromise
          const result = await pool.request()
          .query('exec sp_get_pams')
          res.json(result.recordset)
      } catch (error) {
        res.status(500)
        res.send(error.message)
      }
    }

    async getPam(req, res){
      try {
          const pool = await poolPromise
          const result = await pool.request()
          .input('pamID',sql.Int, req.params.pamID)
          .query('exec sp_get_pam @pam_id = @pamID')
          res.json(result.recordset)
      } catch (error) {
        res.status(500)
        res.send(error.message)
      }
    }

    async deletePam(req, res){
      try {
          const pool = await poolPromise
          const result = await pool.request()
          .input('pamID',sql.Int, req.params.pamID)
          .query('exec sp_delete_pam @pam_id = @pamID')
          res.json(result.recordset)
      } catch (error) {
        res.status(500)
        res.send(error.message)
      }
    }

    async updatePam(req, res){
      try {
          console.log(req.body.birth_day)
          const pool = await poolPromise
          const result = await pool.request()
          .input('pamID',sql.Int, req.params.pamID)
          .input('nameInput',sql.VarChar(255), req.body.name)
          .input('birthDate',sql.Date, req.body.birth_day)
          .input('genderInput',sql.VarChar(255), req.body.gender)
          .query('exec sp_update_pam @pam_id = @pamID, @name = @nameInput, @birth_day = @birthDate, @gender = @genderInput')
          res.json(result.recordset)
      } catch (error) {
        res.status(500)
        res.send(error.message)
      }
    }

    async addPam(req, res){
      try {
          const pool = await poolPromise
          const result = await pool.request()
          .input('nameInput',sql.String, req.body.name)
          .input('birthDate',sql.Date, req.params.birth_date)
          .input('genderInput',sql.String, req.body.gender)
          .query('exec sp_add_pam @name = @nameInput, @birth_date = @birthDate, @gender = @genderInput')
          res.json(result.recordset)
      } catch (error) {
        res.status(500)
        res.send(error.message)
      }
    }

}

const pamController = new MainController()
module.exports = pamController;