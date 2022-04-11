import express from 'express'
import { getBusById, getBuses, startBus, stopBus, updateBus } from './db'

const router = express.Router()

router.get('/', async (req, res, next) => {
    const buses = await getBuses()
    res.send(buses)
})

router.get('/:id', async (req, res, next) => {
    try {
        const busId = req.params.id
        const buses = await getBusById(busId)
        res.send(buses)
    } catch (error) {
        res.status(404).send(error)
    }
})

router.post('/:id/start', async (req, res, next) => {
    try {
        const busId = req.params.id
        const body = req.body

        const direction = body.direction as number
        const latitude = body.latitude as number
        const longitude = body.longitude as number

        const busSatus = await startBus({ id: busId, latitude, longitude, direction })

        res.send(busSatus)

    } catch (error) {
        console.log(error)
        res.status(404).send(error)
    }
})

router.post('/:id/live', async (req, res, next) => {
    try {
        const busId = req.params.id
        const body = req.body

        const latitude = body.latitude as number
        const longitude = body.longitude as number

        const busSatus = await updateBus({ id: busId, latitude, longitude })

        res.send(busSatus)

    } catch (error) {
        console.log(error)
        res.status(404).send(error)
    }
})

router.post('/:id/stop', async (req, res, next) => {
    try {
        const busId = req.params.id

        const busSatus = await stopBus(busId)

        res.send(busSatus)

    } catch (error) {
        console.log(error)
        res.status(404).send(error)
    }
})


export { router as busRouter }