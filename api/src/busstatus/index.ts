import express from 'express';
import { getBusStatusById } from './db';

const router = express.Router()

router.get('/:id', async (req, res, next) => {
    try {
        const busId = req.params.id
        const busSatus = await getBusStatusById(busId)
        res.send(busSatus)
    } catch (error: any) {
        res.status(404).send({
            code: 500,
            message: error.message
        })
    }
})

export { router as busSatusRouter }