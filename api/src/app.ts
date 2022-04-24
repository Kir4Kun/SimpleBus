import express from 'express'
import { busRouter } from './buses'
import { busSatusRouter } from './busstatus'
import { busstopRouter } from './busstops'
import { routeRouter } from './routes'

const app = express()

app.use(express.json())

app.use('/buses', busRouter)
app.use('/busstops', busstopRouter)
app.use('/routes', routeRouter)
app.use('/busstatus', busSatusRouter)
app.use('/busdistancestatus', routeRouter);


(async () => {
    try {
        app.listen(3000, '0.0.0.0')
        console.log(`Server listening on port 3000`)
    } catch (error) {
        console.log(error)
    }

})();