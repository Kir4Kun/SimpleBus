import { getRouteByBusId, Route } from '../routes/db';
import { supabase } from '../supabase'
import { calculateDistance } from '../utils/distance';

export type Bus = {
    id: number;
    rno: string;
    name: string;
}

export async function getBuses() {
    const { data, error } = await supabase
        .from<Bus>('buses')
        .select('*')

    if (error) {
        throw error
    }
    return data
}

export async function getBusById(id: string) {
    const { data, error } = await supabase
        .from<Bus>('buses')
        .select('*')
        .eq('id', id)
        .single()

    if (error) {
        throw {
            code: 404,
            message: `Bus with ${id} not found`
        }
    }
    return data
}

export async function startBus({ id, latitude, longitude, direction }: { id: string, latitude: number, longitude: number, direction: number }) {
    const busRoutes = await getRouteByBusId(id)

    const startStop = busRoutes[0].busStop
    const endStop = busRoutes[busRoutes.length - 1].busStop
    const nextStop = busRoutes[1].busStop

    const { data, error } = await supabase
        .from('busStatus')
        .update({ startStopId: startStop.id, nextStopId: nextStop.id, endStopId: endStop.id, direction: direction })
        .eq('busId', id)
        .single()

    const distance = calculateDistance({ lat1: latitude, lon1: longitude, lat2: nextStop.latitude, lon2: nextStop.longitude })

    const { data: data1, error: error1 } = await supabase
        .from('busDistanceStatus')
        .update({ distanceToNext: distance, nextStopId: nextStop.id })
        .eq('busId', id)
        .single()

    console.log(data1)

    if (error || error1) {
        throw {
            code: 500,
            message: `An error occued ${error?.message} ${error1?.message}`
        }
    }
    return data
}

export async function stopBus(id: string) {
    const { data, error } = await supabase
        .from('busStatus')
        .update({ startStopId: null, nextStopId: null, endStopId: null, direction: null })
        .eq('busId', id)
        .single()

    const { data: data1, error: error1 } = await supabase
        .from('busDistanceStatus')
        .update({ distanceToNext: null, nextStopId: null })
        .eq('busId', id)
        .single()

    if (error || error1) {
        throw {
            code: 500,
            message: `An error occued ${error?.message} ${error1?.message}`
        }
    }
    return data
}

export async function updateBus({ id, latitude, longitude }: { id: string, latitude: number, longitude: number }) {

    const { data, error } = await supabase
        .from('busDistanceStatus')
        .select(`
            nextStop: nextStopId(*),
        `)
        .eq('busId', id)
        .single()

    let distance = calculateDistance({ lat1: latitude, lon1: longitude, lat2: data.nextStop.latitude, lon2: data.nextStop.longitude })

    if (distance < 20) {
        const busRoutes = await getRouteByBusId(id)

        const nextStop = busRoutes.filter(x => x.stopOrder == data.nextStop.stopOrder + 1).map(x => x.busStop)

        if (nextStop.length == 0) {
            return data;
        }

        distance = calculateDistance({ lat1: latitude, lon1: longitude, lat2: nextStop[0].latitude, lon2: nextStop[0].longitude })

        await supabase
            .from('busDistanceStatus')
            .update({ nextStopId: nextStop[0].id })
            .eq('busId', id)
            .single()

        await supabase
            .from('busStatus')
            .update({ nextStopId: nextStop[0].id })
            .eq('busId', id)
            .single()

    }

    if (error) {
        throw {
            code: 500,
            message: `An error occued ${error?.message}`
        }
    }

    await supabase
        .from('busDistanceStatus')
        .update({ distanceToNext: distance })
        .eq('busId', id)
        .single()

}