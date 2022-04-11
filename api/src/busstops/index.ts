import express from 'express'
import { getBuStops, getBusStopById } from './db'

const router = express.Router()

router.get('/', async (req, res, next) => {
    const busStops = await getBuStops()
    res.send(busStops)
})

router.get('/:id', async (req, res, next) => {
    try {
        const busstopId = req.params.id
        const buses = await getBusStopById(busstopId)
        res.send(buses)
    } catch (error) {
        res.status(404).send(error)
    }
})

export { router as busstopRouter }