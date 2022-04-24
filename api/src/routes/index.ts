import express from 'express'
import { getAllRoutes, getRouteByBusId, searchRoutes } from './db'

const router = express.Router()

router.get('/', async (req, res, next) => {
    const routes = await getAllRoutes()
    res.send(routes)
})

router.get('/search', async (req, res, next) => {
    const { from, to } = req.query as { from: string, to: string }
    const routes = await searchRoutes(from, to)
    res.send(routes)
})

router.get('/:id', async (req, res, next) => {
    const busId = req.params.id
    const routes = await getRouteByBusId(busId)
    res.send(routes)
})

export { router as routeRouter }