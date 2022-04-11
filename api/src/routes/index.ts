import express from 'express'
import { getAllRoutes, searchRoutes } from './db'

const router = express.Router()

router.get('/routes', async (req, res, next) => {
    const routes = await getAllRoutes()
    res.send(routes)
})

router.get('/routes/search', async (req, res, next) => {
    const { from, to } = req.query as { from: string, to: string }
    const routes = await searchRoutes(from, to)
    res.send(routes)
})

export { router as routeRouter }